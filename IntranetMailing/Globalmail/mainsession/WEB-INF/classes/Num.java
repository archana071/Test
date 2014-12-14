package com.santosh.servlets;

import java.sql.*;
public class Num
{
public static int getTotal()
{
int total=1;
try
{
Connection con=DriverConnection.getConnection();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from mails");
while(rs.next())
{
total++;
}
System.out.println("total="+total);
}
catch(Exception e)
{
e.printStackTrace();
}
return total;
}
}