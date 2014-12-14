<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*,java.sql.*" %>
  <%@ page session="true"%> 
  
  
   <% 
   int counter=0;
   Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
   Connection con=DriverManager.getConnection("jdbc:odbc:archu"); 
   Statement st1 = con.createStatement();
   int tid=0;
   Integer userIDO=(Integer)session.getAttribute("memberId");
   int userID=userIDO.intValue();
  
	String thoughtName=request.getParameter("thoughtgiveName");
	int probId = Integer.parseInt(request.getParameter("topRatedProblemName"));

	ResultSet res=st1.executeQuery("select * from teammember where memberID="+userID+"");
	if(res.next())
	{
		tid=res.getInt(13);
	}
	
	 ResultSet res1=st1.executeQuery("select count(*) from sixthinking");
	if(res1.next())
	{
		counter=res1.getInt(1);
		counter++;
	}	   
	else
	{
		counter=1;
	}

    int n=st1.executeUpdate("insert into sixthinking values("+counter+","+probId+","+userID+",0,0,'"+thoughtName+"')");
	
	ResultSet rs1=st1.executeQuery("select * from sixthinking");

	if(rs1.next()){
	}
	ResultSet rs2=st1.executeQuery("select * from teammember");

	if(rs2.next()){
	}
	
	if(n>0)
	{
	
	%>
	 <%response.sendRedirect("1slide.jsp");%>
	<%
	}
	else{%>
	<jsp:forward page="invalidPage.jsp"/>
	<%
	}
	
	%>