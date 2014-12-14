package snake2;

import java.awt.*;
import java.sql.*;
import java.awt.event.*;
import javax.swing.*;

public class Create extends JPanel implements ActionListener
{
String str;
boolean enable_entry=true;
private static final long serialVersionUID=1L;

JLabel jl1,jl2;
TextField jf1,jf2;
JButton jb;

Create()
{
jb=new JButton("Create");
jl1=new JLabel("Username:");
jl2=new JLabel("Password:");
jf1=new TextField(20);
jf2=new TextField(8);

jf2.setEchoChar('*');
jb.setActionCommand("create");
jb.addActionListener(this);
add(jl1);
add(jf1);
add(jl2);
add(jf2);
add(jb);
setFocusable(true);
}

public void actionPerformed(ActionEvent ae)
{








try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
           
           Connection   con = DriverManager.getConnection("jdbc:odbc:csedsn","system","oracle");
           
                Statement st=con.createStatement();
                
           
           String x=jf1.getText().trim();
           String y=jf2.getText().trim();
           
           
           
                          System.out.println(x);
                          System.out.println(y);
            
			int p=st.executeUpdate("insert into logintab values('"+x+"','"+y+"')");
			int p1=st.executeUpdate("insert into highscores values ('"+x+"' ,"+0+")");
            if(p1!=0)
                System.out.println("record insered");
            con.commit(); 
            System.out.println(p);
            if(p!=0)
            {
            	JOptionPane.showMessageDialog(null,"User created! ","Success",JOptionPane.PLAIN_MESSAGE);
                System.out.println("record inserted");
            } 
            
            	
        }catch(Exception e)   
        {
        	JOptionPane.showMessageDialog(null,"Username exists!","Error",1);
            System.out.println("bye");
        }
        
if(ae.getActionCommand().equals("create"))
{
while(enable_entry)
{
Entry  e=new Entry();
new Snake(e);
enable_entry=false;
}
}
}
}