package com.santosh.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;

public class RegisterServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String fname=request.getParameter("t1");
                String lname=request.getParameter("t2");
                String uname=request.getParameter("t3");
		String pass=request.getParameter("t4");
                String repass=request.getParameter("t5");
		String gen=request.getParameter("t6");
String date=new java.util.Date().toString();
Statement st2;
		response.setContentType("text/html");

		PrintWriter out = response.getWriter();
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		
		if (uname==null||uname.equals("")){
			out.println("<b><i>Username Cannot be empty</i></b>");
			RequestDispatcher rd=request.getRequestDispatcher("/Register.html");
			rd.include(request, response);
			return;
		}
		if (pass==null||pass.equals("")){
			out.println("<b><i>Password Cannot be empty</i></b>");
			RequestDispatcher rd=request.getRequestDispatcher("/Register.html");
			rd.include(request, response);
			return;
		}
               if (fname==null||fname.equals("")){
			out.println("<b><i>first name Cannot be empty</i></b>");
			RequestDispatcher rd=request.getRequestDispatcher("/Register.html");
			rd.include(request, response);
			return;
		}
if (lname==null||lname.equals("")){
			out.println("<b><i>last name Cannot be empty</i></b>");
			RequestDispatcher rd=request.getRequestDispatcher("/Register.html");
			rd.include(request, response);
			return;
		}
if (repass==null||repass.equals("")){
			out.println("<b><i>please retype Password </i></b>");
			RequestDispatcher rd=request.getRequestDispatcher("/Register.html");
			rd.include(request, response);
			return;
		}
if (gen==null||gen.equals("")){
			out.println("<b><i>select gender</i></b>");
			RequestDispatcher rd=request.getRequestDispatcher("/Register.html");
			rd.include(request, response);
			return;
		}
if(!repass.equals(pass))
{
out.println("<b><i>Passwords donot match</i></b>");
			RequestDispatcher rd=request.getRequestDispatcher("/Register.html");
			rd.include(request, response);
			return;
		}
//System.out.println("-------------");
ListDAO ld=new ListDAO();
//System.out.println(ld.validate(uname));
if(ld.validate(uname)){
int value=Num.getTotal();
System.out.println("value="+value);
try{
                    Connection con=DriverConnection.getConnection();
                    Statement st=con.createStatement();
st2=con.createStatement();

                    int p=st.executeUpdate("insert into userdetails values('"+uname+"','"+fname+"','"+lname+"','"+pass+"','"+repass+"','"+gen+"')");
                    
                 /* ResultSet rs=st3.executeQuery("select * from mails");
int count=1;
while(rs.next())
{
count++;
}

System.out.println(count);

//int count=19;
//Statement st2=con.createStatement();

st2.setInt(1,count);*/


int p1=st2.executeUpdate("insert into mails values("+value+",'"+uname+"','global@xyz.com','From global mail','Welcome to global mail','"+date+"')");
if(p1!=0)
{
out.println("welcome");
RequestDispatcher rd=request.getRequestDispatcher("/Login.html");
			rd.include(request, response);
                                                     return;
}

}
catch(Exception e)
{
e.printStackTrace();
}
}


else
{
out.println("<b><i>Please choose another email id and fname</i></b>");
			RequestDispatcher rd=request.getRequestDispatcher("/Register.html");
			rd.include(request, response);
			return;
}
out.println("hello world");
}
}

