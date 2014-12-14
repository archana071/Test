package com.santosh.servlets;

import java.util.*;
import java.sql.*;

public class MailsDAO {
	
	public Collection getMails(String uname){
		/*
		 * Connect to Mail server and get all the mails of the given username
		 * This can be done using Java Mail API
		 * Java Mail API concept is out of scope of this book
		 * and thus for this example we will get the mails from DB
		 * insted of getting diverted towards Java Mail API 
		 */ 		
		try {
			Connection con=DriverConnection.getConnection();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(
					"select fromid, subject, sentdate,mid from mails where uname='"+uname+"'");
			ArrayList al=new ArrayList();
			//int count=1;
			while (rs.next()){
				Mail m=new Mail();
				m.setMailid(rs.getString(4));
				m.setFromid(rs.getString(1));
				m.setSubject(rs.getString(2));
				m.setSentDate(rs.getString(3));
				al.add(m);
				//count++;
			}
			return al;
		}
		catch(Exception e){e.printStackTrace();}
		return null;
	}
	
	public Mail getMail(String uname, String id){
		try {
			Connection con=DriverConnection.getConnection();
			Statement st=con.createStatement();
int id1=Integer.parseInt(id);
			ResultSet rs=st.executeQuery("select fromid, subject, sentdate, content from mails where uname='"+uname+"' and mid="+id+"");
			if (rs.next()){
				Mail m=new Mail();
				m.setFromid(rs.getString(1));
				m.setSubject(rs.getString(2));
				m.setSentDate(rs.getString(3));
				m.setContent(rs.getString(4));
				return m;
			}
		}
		catch(Exception e){e.printStackTrace();}
		return null;
	}
}
