package com.santosh.servlets;

import java.sql.*;

public class DriverConnection {
	
	public static Connection getConnection() 
									throws Exception{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
           
           return DriverManager.getConnection("jdbc:odbc:archu");
	}
}
