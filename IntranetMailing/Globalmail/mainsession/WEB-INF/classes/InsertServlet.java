package com.santosh.servlets;

//import java.util.Date;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
//import javax.sql.*;

public class InsertServlet extends HttpServlet
{
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
response.setContentType("text/html");
PrintWriter out=response.getWriter();
String uname=request.getParameter("to");
String fromid=request.getParameter("uname");
String subject=request.getParameter("subject");
String content=request.getParameter("content");
System.out.println("hai");

String date=new java.util.Date().toString();
System.out.println("hi");
System.out.println(date);
System.out.println(content);
System.out.println(subject);
System.out.println(fromid);
System.out.println(uname);
int count=Num.getTotal();
System.out.println("count="+count);
try
{
Connection con=DriverConnection.getConnection();
//Statement st4=con.createStatement();
Statement st5=con.createStatement();
/*ResultSet rs=st4.executeQuery("select * from mails");
int count=0;
while(rs.next())
count++;
System.out.println("this    "+count);
count++;*/

/*st5.setInt(1,count);
st5.setString(2,uname);
st5.setString(3,fromid);
st5.setString(4,subject);
st5.setString(5,content);
st5.setString(6,date);*/

int p=st5.executeUpdate("insert into mails values("+count+",'"+uname+"','"+fromid+"','"+subject+"','"+content+"','"+date+"')");
out.println("Your mail is sent successfully");
RequestDispatcher rd=request.getRequestDispatcher("/inbox?uname="+fromid+"");
			rd.include(request, response);
			return;

}
catch(Exception e)
{
e.printStackTrace();
}
out.println("hello");
}
}


	