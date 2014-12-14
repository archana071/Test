package snake2;

import java.awt.*;

import java.awt.event.*;
import javax.swing.*;

public class Instruction extends JPanel implements ActionListener
{
String str,value;
JButton jb;
TextArea t;
String iuser;
 boolean enable_start=true;
 
          private static final long serialVersionUID = 1L;

Instruction(String j)
{
	iuser=j;
setBackground(Color.pink);
jb=new JButton("back");
value="1.Press rightarrow(->) key to move right\n"+"2.Press left arrow(<-) arrow to move left\n"+"3.Press up arrow to move up\n"+"4.Press down arrow to move down\n"+"5.Eat the star visible to increase score\n"+"6.In board1 snake will die only if its tail strikes its body\n"+"7.In board2 snake will die if its tail strikes its body or its head strikes walls\n"+"In board2 snake will die if its tail strikes its body or its head strikes walls or mazes\n";

t=new TextArea(value,10,30);
add(t);

jb.addActionListener(this);
add(jb);


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
 