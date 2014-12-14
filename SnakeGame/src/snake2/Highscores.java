package snake2;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;


import java.sql.*;
import javax.swing.*;

public class Highscores extends JPanel implements ActionListener
{
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
JLabel ja;
JButton jb;
String iuser;
boolean enable_start=true;

Highscores(String x)
{
	iuser=x;
ja=new JLabel("HIGH SCORES");
jb=new JButton("back");
add(ja);
jb.addActionListener(this);
add(jb);
String[] header = 
{
    "Name", "Score" ///////add column name
};
Object[][] data = new Object[5][2];//put data received from database...
try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

Connection   con = DriverManager.getConnection("jdbc:odbc:csedsn","system","oracle");


 Statement st=con.createStatement();

 ResultSet rs= st.executeQuery("select * from highscores order by score desc");
 

for (int i = 0; i < data.length; i++)
{
	
	rs.next();
    for (int j = 0; j < data[i].length; j++)
    {
    	data[i][j]=rs.getString(j+1);
    		
   
    
    			
    }		
  
    	
    	
    
         
    
}
}
catch(Exception e)
{
	System.out.println("error");
}
JTable table = new JTable(data, header);
add(table,BorderLayout.CENTER);
}
public void actionPerformed(ActionEvent ae)
{


     if(ae.getActionCommand().equals("back"))
     {
           
     while(enable_start)
          {
                Start s=new Start(iuser);
                new Snake(s);
                 enable_start=false;
            }

        }
     
}
}
