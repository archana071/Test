<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*,java.sql.*" %>
  <%@ page session="true"%> 
  
   <% 
   
   Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
   Connection con=DriverManager.getConnection("jdbc:odbc:archu");    
   
   String userName=request.getParameter("userName");
   String password=request.getParameter("password");
	
   Statement st=con.createStatement();
   ResultSet rs=st.executeQuery("select * from userdetails where uname='"+userName+"' and pass='"+password+"'");
   String name=userName.substring(7);
   String name1 =userName.substring(0,6);
   int id=Integer.parseInt(name);
   if(rs.next())
  {
	  session.setAttribute("sessionMemberName",name1);
	  session.setAttribute("memberId",id);
	  response.sendRedirect("1slide.jsp");
  }
  else
  {
	  response.sendRedirect("invalidlogin.jsp");
  }
%>