package com.santosh.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ForwardServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String uname=request.getParameter("uname");
		String fromid=request.getParameter("fromid");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		
		out.println("<html><head>");
		out.println("<title>Forward Page</title>");
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
		out.println("<form name=form1 method=get action=insert>");
		out.println("<table width=100% height=100% border=0 cellpadding=0 cellspacing=0>");
		out.println("<tr bgcolor=#CCCCCC> ");
		out.println("<th height=34 colspan=2 bgcolor=#CCCCCC>Forward Mail</th>");
		out.println("</tr>");
		out.println("<tr bgcolor=#CCCCCC> ");
		out.println("<td width=15% height=38 bgcolor=#FFFFFF>To : </td>");
		out.println("<td width=85% bgcolor=#FFFFFF><input name=to type=text id=to></td>");
		out.println("</tr>");
		out.println("<tr bgcolor=#CCCCCC> ");
		out.println("<td height=35 bgcolor=#FFFFFF>Subject : </td>");
		out.println("<td bgcolor=#FFFFFF><strong>");
		out.println("<input name=subject type=text id=subject value='Fw: "+subject+"'>");
		out.println("</strong></td></tr>");
		out.println("<tr bgcolor=#CCCCCC> ");
		out.println("<td height=35 bgcolor=#FFFFFF><strong>Message:</strong></td>");
		out.println("<td bgcolor=#FFFFFF>&nbsp;</td>");
		out.println("</tr>");
		out.println("<tr align=left valign=top bgcolor=#CCCCCC> ");
		out.println("<td colspan=2 bgcolor=#FFFFFF><textarea name=content cols=100 rows=20 id=content>"+content+"</textarea></td>");
		out.println("</tr>");
		out.println("<tr bgcolor=#CCCCCC> ");
		out.println("<td height=35 bgcolor=#FFFFFF>&nbsp;</td>");
		out.println("<td bgcolor=#FFFFFF><input type=submit value=Send></td></tr>");
		//out.println("</tr></table>");
out.println("<input type=hidden name=uname value="+uname+">");
		out.println("</form></tr>");
		out.println("<tr align=center> ");
		out.println("</tr></table>");
		out.println("</body></html>");
	}
}
