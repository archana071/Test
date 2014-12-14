package com.santosh.servlets;
import java.sql.*;
public class ListDAO {
	public boolean validate(String eid){
boolean flags=true;
		
		try {
			Connection con=DriverConnection.getConnection();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from userdetails where uname='"+eid+"'");
			//System.out.println("select * from details where uname='"+eid+"'");
			if(rs.next())
                                                       flags=false;

		}//try
		catch(Exception e){
			e.printStackTrace();
		}
		return flags;
	}
}
