<%@page import="javax.security.auth.login.FailedLoginException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,java.sql.*"%>
<%@ page session="true"%>

<%
	int accountbal = 0;
	int finalaccountbal = 0;
	String item1 = "", item2 = "", item3 = "", item4 = "", item5 = "", item6 = "", item7 = "", item8 = "";
	String itemName = "";
	String value1 = request.getParameter("itemValue");
	String items[] = value1.split(",");
	itemName = items[0];
	int value = Integer.parseInt(items[1]);

	Integer userIDO = (Integer) session.getAttribute("memberId");
	int userID = userIDO.intValue();

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:archu");

	boolean hasValue = false;
	Statement ss = con.createStatement();
	ResultSet rss = ss
			.executeQuery("select * from items where memberID="
					+ userID + "");
	if (rss.next()) {
		hasValue = true;
		item1 = rss.getString("item1");
		item2 = rss.getString("item2");
		item3 = rss.getString("item3");
		item4 = rss.getString("item4");
		item5 = rss.getString("item5");
		item6 = rss.getString("item6");
		item7 = rss.getString("item7");
		item8 = rss.getString("item8");
		if (itemName.equals("item1")) {
			item1 = "Yes";
		} else if (itemName.equals("item2")) {
			item2 = "Yes";
		} else if (itemName.equals("item3")) {
			item3 = "Yes";
		} else if (itemName.equals("item4")) {
			item4 = "Yes";
		} else if (itemName.equals("item5")) {
			item5 = "Yes";
		} else if (itemName.equals("item6")) {
			item6 = "Yes";
		} else if (itemName.equals("item7")) {
			item7 = "Yes";
		} else if (itemName.equals("item8")) {
			item8 = "Yes";
		}
	} else {
		if (itemName.equals("item1")) {
			item1 = "Yes";
			item2 = "No";
			item3 = "No";
			item4 = "No";
			item5 = "No";
			item6 = "No";
			item7 = "No";
			item8 = "No";
		} else if (itemName.equals("item2")) {
			item1 = "No";
			item2 = "Yes";
			item3 = "No";
			item4 = "No";
			item5 = "No";
			item6 = "No";
			item7 = "No";
			item8 = "No";
		} else if (itemName.equals("item3")) {
			item1 = "No";
			item2 = "No";
			item3 = "Yes";
			item4 = "No";
			item5 = "No";
			item6 = "No";
			item7 = "No";
			item8 = "No";
		} else if (itemName.equals("item4")) {
			item1 = "No";
			item2 = "No";
			item3 = "No";
			item4 = "Yes";
			item5 = "No";
			item6 = "No";
			item7 = "No";
			item8 = "No";
		} else if (itemName.equals("item5")) {
			item1 = "No";
			item2 = "No";
			item3 = "No";
			item4 = "No";
			item5 = "Yes";
			item6 = "No";
			item7 = "No";
			item8 = "No";
		} else if (itemName.equals("item6")) {
			item1 = "No";
			item2 = "No";
			item3 = "No";
			item4 = "No";
			item5 = "No";
			item6 = "Yes";
			item7 = "No";
			item8 = "No";
		} else if (itemName.equals("item7")) {
			item1 = "No";
			item2 = "No";
			item3 = "No";
			item4 = "No";
			item5 = "No";
			item6 = "No";
			item7 = "Yes";
			item8 = "No";
		} else if (itemName.equals("item8")) {
			item1 = "No";
			item2 = "No";
			item3 = "No";
			item4 = "No";
			item5 = "No";
			item6 = "No";
			item7 = "No";
			item8 = "Yes";
		}

	}

	Statement stmt = con.createStatement();
	ResultSet rset = stmt
			.executeQuery("select accountbal from teammember where memberID="
					+ userID + "");
	if (rset.next()) {
		accountbal = rset.getInt("accountbal");
	}
	System.out.println(accountbal + "-balance");

	if (accountbal < value) {
		session.setAttribute("invalid",
				"You do not have sufficient balance to buy.");
	} else {
		finalaccountbal = (accountbal - value);

		Statement st5 = con.createStatement();
		int updateCount2 = st5
				.executeUpdate("update teammember set accountbal = "
						+ finalaccountbal + " where memberID = "
						+ userID + "");

		Statement st6 = con.createStatement();
		if (!hasValue) {
			System.out
					.println("insert into items(item1,item2,item3,item4,item5,item6,item7,item8,memberID) values('"
							+ item1
							+ "','"
							+ item2
							+ "','"
							+ item3
							+ "','"
							+ item4
							+ "','"
							+ item5
							+ "','"
							+ item6
							+ "','"
							+ item7
							+ "','"
							+ item8
							+ "'," + userID + ")");
			int updateCount3 = st6
					.executeUpdate("insert into items(item1,item2,item3,item4,item5,item6,item7,item8,memberID) values('"
							+ item1
							+ "','"
							+ item2
							+ "','"
							+ item3
							+ "','"
							+ item4
							+ "','"
							+ item5
							+ "','"
							+ item6
							+ "','"
							+ item7
							+ "','"
							+ item8
							+ "'," + userID + ")");
		} else {
			st6.executeUpdate("update items set item1='" + item1
					+ "', item2 ='" + item2 + "', item3 ='" + item3
					+ "', item4 ='" + item4 + "', item5 ='" + item5
					+ "', item6 ='" + item6 + "', item7 ='" + item7
					+ "',item8 ='" + item8 + "' where memberID="+userID+"");
		}

		session.setAttribute("msgsuc", "Successs Message");
		session.setAttribute("invalid", "");
	}

	Statement st = con.createStatement();
	ResultSet rs = st
			.executeQuery("select * from teammember where teamID="
					+ userID + "");
	if (rs.next()) {
	}

	response.sendRedirect("1slide.jsp");
%>