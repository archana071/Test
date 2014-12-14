package snake2;

import java.awt.*;

import java.awt.event.*;
import java.sql.*;

import javax.swing.*;


public class Login extends JPanel implements ActionListener
{
String str,user;

boolean enable_start=true;
private static final long serialVersionUID=1L;

JLabel jl1,jl2;
Label lab;
TextField jf1,jf2;
JButton jb;

Login()
{
jb=new JButton("Login");
jl1=new JLabel("Username:");
jl2=new JLabel("Password:");
jf1=new TextField(20);
jf2=new TextField(8);

jf2.setEchoChar('*');
jb.setActionCommand("Login");
jb.addActionListener(this);
add(jl1);
add(jf1);
add(jl2);
add(jf2);
add(jb);
setFocusable(true);
//user=jf1.getText().trim();

}

public void actionPerformed(ActionEvent ae)
{




if(ae.getActionCommand().equals("Login"))
{
	String x=jf1.getText().trim();
	user=jf1.getText().trim();
	System.out.println(user);
    String y=jf2.getText().trim();

          try
{
        	  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        	    
        	    Connection   con = DriverManager.getConnection("jdbc:odbc:csedsn","system","oracle");
        	    

        	     Statement st=con.createStatement();
           

        	   ResultSet rs= st.executeQuery("select password from logintab where username='"+x+"'");
        	   
        	   if(rs.next())
               {
                   String dbpass = rs.getString(1);
                   if(dbpass.equals(y))
                   {
                   JOptionPane.showMessageDialog(null,"Login Successful! ","Success",JOptionPane.PLAIN_MESSAGE);
                   while(enable_start)
                   {
                   Start s=new Start(user);
                   new Snake(s);
                   enable_start=false;
                   }
                   }
               else
               {
                   JOptionPane.showMessageDialog(null,"Login Unsuccessful!","Error",1);
               }
               }
                   else
                   {
                       JOptionPane.showMessageDialog(null,"Username not found","Error",1);
                   }
              }
               
              
                 






catch(Exception e)
{
	System.out.println("error");
}
}

}
}

                