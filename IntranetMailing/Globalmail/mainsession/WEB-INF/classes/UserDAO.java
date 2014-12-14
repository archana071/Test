package com.santosh.servlets;
import java.sql.*;
public class UserDAO {
	public boolean validate(String uname, String pass){
		
		try {
			Connection con=DriverConnection.getConnection();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from userdetails where uname='"+uname+"' and pass='"+pass+"'");
			System.out.println("select * from userdetails where uname='"+uname+"' and pass='"+pass+"'");
			if(rs.next())
return true;
		}//try
		catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}
}
