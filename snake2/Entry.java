package snake2;

import java.awt.event.*;
import javax.swing.*;

public class Entry extends JPanel implements ActionListener
{
String str;
boolean enable_login=true;
boolean enable_create=true;
private static final long serialVersionUID=1L;
JButton jb1,jb2;

Entry()
{
jb1=new JButton("Signin");
jb2=new JButton("Signup");


jb1.setActionCommand("signin");
jb1.addActionListener(this);

jb2.setActionCommand("signup");
jb2.addActionListener(this);

add(jb1);
add(jb2);
setFocusable(true);
}

public void actionPerformed(ActionEvent ae)
{
if(ae.getActionCommand().equals("signin"))
{
while(enable_login)
{
Login l=new Login();
new Snake(l);
enable_login=false;
}
}
if(ae.getActionCommand().equals("signup"))
{
while(enable_create)
{
Create c=new Create();
new Snake(c);
enable_create=false;
}
}

}
}