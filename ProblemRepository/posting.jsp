<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,java.sql.*"%>
<%@ page session="true"%>


<%
	int counter = 0;
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:archu");

	int tid = 0, teamPoints = 0, memberPoints = 0, housePoints = 0, finalHousePoints = 0, finalMemberPoints = 0, finalTeamPoints = 0;
	String houseName = "";
	Integer userIDO = (Integer) session.getAttribute("memberId");
	int userID = userIDO.intValue();
	boolean firstPhaseValue=true;
	String text = request.getParameter("postprob");

	Statement st1 = con.createStatement();
	ResultSet res = st1
	.executeQuery("select * from teammember where memberID="
			+ userID + "");
	if (res.next()) {
		tid = res.getInt("teamID");
		memberPoints = res.getInt("memberpoints");
	}
	
	Statement st2 = con.createStatement();
	ResultSet res1 = st2.executeQuery("select count(*) from problems");
	if (res1.next()) {
		counter = res1.getInt(1);
		counter++;
	} else {
		counter = 1;
	}
	
	Statement ss = con.createStatement();
	ResultSet rss = ss.executeQuery("select count(*) from problems where memberID="+userID+"");
	if(rss.next());
	{
		if(rss.getInt(1)>0)
		{
			firstPhaseValue=false;
		}
	}
	System.out.println(firstPhaseValue + "-");
	int n = st1.executeUpdate("insert into problems values(" + counter
	+ ",'" + text + "'," + userID + ",0," + tid + ")");

	Statement stmt = con.createStatement();
	ResultSet rset1 = stmt
	.executeQuery("select teampoints,House from teams where teamID="
			+ tid + "");
	if (rset1.next()) {
		teamPoints = rset1.getInt("teampoints");
		houseName = rset1.getString("House");
	}

	Statement stmt1 = con.createStatement();
	ResultSet rset2 = stmt1
	.executeQuery("select housepoints from house where House='"
			+ houseName + "'");
	if (rset2.next()) {
		housePoints = rset2.getInt("housepoints");
	}

	if (firstPhaseValue) {
		finalHousePoints = housePoints + 30;
		finalTeamPoints = teamPoints + 30;
		finalMemberPoints = memberPoints + 30;

		Statement stmt2 = con.createStatement();
		stmt2.executeUpdate("update house set housepoints="
		+ finalHousePoints + " where House='" + houseName + "'");

		Statement stmt3 = con.createStatement();
		stmt3.executeUpdate("update teams set teampoints = "
		+ finalTeamPoints + " where teamID=" + tid + " ");

		Statement stmt4 = con.createStatement();
		System.out.println("update teammember set memberpoints = "
		+ finalMemberPoints + " and firstPhase=1 where memberID=" + userID + " ");
		stmt3.executeUpdate("update teammember set memberpoints = "
		+ finalMemberPoints + " where memberID=" + userID + " ");
	}
	
	ResultSet rs1 = st1.executeQuery("select * from problems");

	if (rs1.next()) {
	}

	ResultSet rs2 = st1.executeQuery("select * from teammember");

	if (rs2.next()) {
	}

	if (n > 0) {
%>
<%
	response.sendRedirect("1slide.jsp");
%>
<%
	} else {
%>
<jsp:forward page="invalidPage.jsp" />
<%
	}
%>