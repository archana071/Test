<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*,java.sql.*" %>
  <%@ page session="true"%> 
  
  
   <% 
   
   Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
   Connection con=DriverManager.getConnection("jdbc:odbc:archu"); 
   Statement st1 = con.createStatement();
   
  Integer userIDO=(Integer)session.getAttribute("memberId");
   int userID=userIDO.intValue();
   System.out.println(userID);
    String editName=request.getParameter("editName");
	   System.out.println(editName);
System.out.println("update teammember set membername='"+editName+"' where memberID="+userID+"");
	int n = st1.executeUpdate("update teammember set membername='"+editName+"' where memberID="+userID+"");
	ResultSet rs1=st1.executeQuery("select * from problems");
	if(rs1.next()){
	System.out.println(rs1.getString(2));}
	
	if(n>0)
	{
	System.out.println(editName);
	%>
	 <%response.sendRedirect("1slide.jsp");%>
	<%
	}
	else{%>
	<jsp:forward page="invalidlogin.jsp"/>
	<%
	}
	
	%>