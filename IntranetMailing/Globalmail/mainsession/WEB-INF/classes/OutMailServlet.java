package com.santosh.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OutMailServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String uname=request.getParameter("uname");
		String mail_no=request.getParameter("id");
		
		OutDAO md=new OutDAO();
		Mail m=md.getMail(uname, mail_no);
		out.println("<html><head>");
		out.println("<title>View Mail Page</title>");
		out.println("</head><body>");
		out.println("<table width=98% height=95% border=1><tr> ");
		out.println("<td height=45 colspan=2 align=center><font size=5>My Email Site</font></td>");
		out.println("</tr><tr> ");
		out.println("<td width=12% height=545 align=center valign=top> ");
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
		out.println("<table width=100% height=100% border=0 cellpadding=0 cellspacing=0>");
		out.println("<tr bgcolor=#CCCCCC> ");
		out.println("<th height=34 colspan=2 bgcolor=#CCCCCC>Read Mail</th>");
		out.println("</tr><tr bgcolor=#CCCCCC> ");
		out.println("<td width=37% height=54 bgcolor=#FFFFFF>Sent to: <strong>"+m.getFromid()+"</strong></td>");
		out.println("<td width=63% bgcolor=#FFFFFF>Subject : <strong>"+m.getSubject()+"</strong></td>");
		out.println("</tr><tr bgcolor=#FFFFFF> ");
		out.println("<td height=36 colspan=2><form method=post action=sendForward>");
		out.println("<input type=submit name=Submit value=Forward>");
		out.println("<input name=uname type=hidden value='"+uname+"'>");
		out.println("<input name=fromid type=hidden value='"+m.getFromid()+"'>");
		out.println("<input name=subject type=hidden value='"+m.getSubject()+"'>");
		out.println("<input name=content type=hidden value='"+m.getContent()+"'>");
		out.println("</form></td><a href='sent?uname="+uname+"'>Back</a> </tr>");
		out.println("<tr valign=top bgcolor=#CCCCCC> ");
		out.println("<td height=375 colspan=2 bgcolor=#FFFFFF><p><strong>Message</strong>:</p>");
		out.println("<blockquote> ");
		out.println("<p>"+m.getContent()+"</p>");
		out.println("</blockquote></td>");
		out.println("</tr></table>");
		out.println("</td></tr>");
		out.println("<tr align=center> ");
		
		out.println("</tr></table>");
		out.println("</body></html>");
	}
}
