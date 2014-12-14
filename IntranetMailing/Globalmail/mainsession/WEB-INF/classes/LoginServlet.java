package com.santosh.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.http.*;

public class LoginServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String uname=request.getParameter("uname");
		String pass=request.getParameter("password");
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		
		if (uname==null||uname.equals("")){
			out.println("<b><i>Username Cannot be empty</i></b>");
			RequestDispatcher rd=request.getRequestDispatcher("/Login.html");
			rd.include(request, response);
			return;
		}
		if (pass==null||pass.equals("")){
			out.println("<b><i>Password Cannot be empty</i></b>");
			RequestDispatcher rd=request.getRequestDispatcher("/Login.html");
			rd.include(request, response);
			return;
		}
		
		UserDAO ud=new UserDAO();
		
		if(ud.validate(uname,pass)){
			out.println("<table width=98% height=95% border=1><tr>");
			out.println("<td height=45 colspan=2 align=center><font size=5>My Email Site</font></td>");
			out.println("</tr><tr>");
			out.println("<td width=12% height=545 align=center valign=top>");
			out.println("<p>&nbsp;</p><p><font size=4>");
			out.println("<a href='inbox?uname="+uname+"'>InBox</a>");
			out.println("</font></p>");
                        out.println("<a href='compose?uname="+uname+"'>Write Mail</a>");
			out.println("</font></p>");
                        out.println("<a href='sent?uname="+uname+"'>SENTMAIL</a>");
			out.println("</font></p>");
			/*out.println("<p><font size=4>Bulk Mail</font></p>");
			out.println("<p><font size=4>Sent Items</font></p>");
			out.println("<p><font size=4>Write Mail</font></p>");*/
			out.println("<p><font size=4><a href='Login.html'>Logout</a></font></p>");
			out.println("<p>&nbsp;</p></td>");
			out.println("<td width=88% align=left valign=top><p>&nbsp;</p>");
			out.println("<p><font size=4>Welcome, "+uname+"</font></p></td>");
			out.println("</tr><tr align=center>");
			out.println("</tr></table>");
		}//if

		else{
			out.println("<b><i>Username or Password given are not valid</i></b>");
			RequestDispatcher rd=request.getRequestDispatcher("/Login.html");
			rd.include(request, response);
			return;
		}
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

}
