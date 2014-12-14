package com.santosh.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OutboxServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String uname=request.getParameter("uname");
		
		out.println("<html><head>");
		out.println("<title>InBox Page</title>");
		out.println("</head><body>");
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
		out.println("<td width=88% align=left valign=top><p><font size=4>Welcome, "+uname+"</font></p>");
		out.println("<table width=100% height=82 border=0 cellpadding=0 cellspacing=0>");
		out.println("<tr bgcolor=#CCCCCC>");
		out.println("<th width=8%>&nbsp; </th>");
		out.println("<th width=26% align=center>To</th>");
		out.println("<th width=41%>Subject</th>");
		out.println("<th width=25%>Sent Date</th>");
		out.println("</tr>");
		
		OutDAO od=new OutDAO();
		Collection c=od.getMails(uname);
		Iterator i=c.iterator();
		while (i.hasNext()){
			Mail m=(Mail)i.next();
			out.println("<tr>");
			out.println("<td align=center><input type=checkbox name=checkbox></td>");
			out.println("<td align=left>"+m.getFromid()+"</td>");
			out.println("<td><a href='outMail?id="+m.getMailid()+"&uname="+uname+"'>"+m.getSubject()+"</a></td>");
			out.println("<td>"+m.getSentDate()+"</td>");
			out.println("</tr>");
		}
		out.println("</table>");
		out.println("<p><font size=4></font></p>");
		out.println("</td></tr><tr align=center>");
		
		out.println("</tr></table>");
		out.println("</body></html>");
	}
}
