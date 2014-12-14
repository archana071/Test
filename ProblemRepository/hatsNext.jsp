<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,java.sql.*"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hats</title>
</head>
<body>
	<%
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Connection con = DriverManager.getConnection("jdbc:odbc:archu");
		
		Integer userIDO = (Integer) session.getAttribute("memberId");
		int userID = userIDO.intValue();
		int teamId=0;
		int hatcolor=Integer.parseInt(request.getParameter("hatcolor"));
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select teamID from teammember where memberID="+userID+"");
		if(rs.next()){
			teamId=rs.getInt("teamID");
		}
		
		Statement st1= con.createStatement();
		System.out.println("update teammember set hatcolor="+hatcolor+" where teamID="+teamId+"");
		int n =st1.executeUpdate("update teammember set hatcolor="+hatcolor+" where teamID="+teamId+"");
		if(n>0){
			response.sendRedirect("1slide.jsp");
		}else{
			response.sendRedirect("invalidPage.jsp");
		}
	
	%>
</body>
</html>