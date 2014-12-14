<%@page import="javax.sound.midi.SysexMessage"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,java.sql.*"%>
<%@ page session="true"%>
<%
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:archu");
	Statement st = con.createStatement();

	String rate1 = request.getParameter("imprating1");
	System.out.println(rate1);

	Integer userIDO = (Integer) session.getAttribute("memberId");
	int userID = userIDO.intValue();
	int teamId = 0;
	ResultSet rset = st
			.executeQuery("select teamID from teammember where memberID = "
					+ userID + "");
	if (rset.next()) {
		teamId = rset.getInt("teamID");
	}

	//Split with underscore(_), we will get rating separated by , for each problem.
	String arr[] = rate1.split("s");
	System.out.println(arr.length);
	String arr1 = "0";
	String arr2 = "0";
	String arr3 = "0";

	if (arr.length > 0) {
		arr1 = arr[0];
		arr2 = arr[1];
		arr3 = arr[2];
	}

	Statement st4 = con.createStatement();
	ResultSet rset4 = st4
			.executeQuery("select count(*) from problems where teamID="
					+ teamId + "");
	int probCount = 0;
	if (rset4.next()) {
		probCount = rset4.getInt(1);
	}

	//Split with comma(,) we will get rating array.
	String arr11[] = new String[probCount];//
	String arr22[] = new String[probCount];//arr2.split(",");
	String arr33[] = new String[probCount];//arr3.split(",");

	if (arr1.contains(",")) {
		arr11 = arr1.split(",");
	} else {
		for (int p = 0; p < probCount; p++) {
			arr11[p] = "0";
		}
	}

	if (arr2.contains(",")) {
		arr22 = arr2.split(",");
	} else {
		for (int p = 0; p < probCount; p++) {
			arr22[p] = "0";
		}
	}

	if (arr3.contains(",")) {
		arr33 = arr3.split(",");
	} else {
		for (int p = 0; p < probCount; p++) {
			arr33[p] = "0";
		}
	}

	int arr44[] = new int[probCount];
	Statement st1 = con.createStatement();
	ResultSet rset1 = st1
			.executeQuery("select problemID from problems where teamID= "
					+ teamId + "");

	int k = 0;
	while (rset1.next()) {
		arr44[k] = rset1.getInt("problemID");
		k++;
	}

	// Loop through array to get rating for each problem
	int imp = 0, fre = 0, fru = 0, count = 0;

	System.out.println("Tesing .is ...");

	Statement stmt1 = con.createStatement();
	ResultSet rst1 = stmt1
			.executeQuery("select count(*) from rating where memberID="
					+ userID + " and teamID=" + teamId + "");
	if (rst1.next()) {
		count = rst1.getInt(1);
	}
	System.out.println("Count:" + count);
	Statement stmt = con.createStatement();

	for (int i = 0; i < probCount; i++) {
		if (arr11[i].equalsIgnoreCase("undefined")) {
			imp = 0;
		} else {
			imp = Integer.parseInt(arr11[i]);
		}

		if (arr22[i].equalsIgnoreCase("undefined")) {
			fre = 0;
		} else {
			fre = Integer.parseInt(arr22[i]);
		}

		if (arr33[i].equalsIgnoreCase("undefined")) {
			fru = 0;
		} else {
			fru = Integer.parseInt(arr33[i]);
		}

		if (count > 0) {
			System.out.println("update rating set importance=" + imp
					+ ",frequency=" + fre + ",frustration=" + fru
					+ " where problemID=" + arr44[i] + " and memberID="
					+ userID + " and teamID=" + teamId + "");
			stmt.executeUpdate("update rating set importance=" + imp
					+ ",frequency=" + fre + ",frustration=" + fru
					+ " where problemID=" + arr44[i] + " and memberID="
					+ userID + " and teamID=" + teamId + "");
		} else {
			System.out.println("insert into rating values(" + arr44[i]
					+ "," + userID + "," + teamId + "," + imp + ","
					+ fre + "," + fru + ")");
			stmt.executeUpdate("insert into rating values(" + arr44[i]
					+ "," + userID + "," + teamId + "," + imp + ","
					+ fre + "," + fru + ")");
		}
	}

	response.sendRedirect("1slide.jsp");
%>