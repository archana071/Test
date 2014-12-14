package snake2;

import java.awt.*;

import java.awt.event.*;
import javax.swing.*;

public class Start extends JPanel implements ActionListener
{
String str,userstart;
JButton jb1,jb3,jb4;
 boolean enable_board1=true;
 boolean enable_highscore=true;
 boolean enable_instruction=true;
          private static final long serialVersionUID = 1L;

Start(String x)
{
	userstart=x;
	//System.out.println(userstart);
setBackground(Color.cyan);
jb1=new JButton("New Game");

jb3=new JButton("Instructions");
jb4=new JButton("High Scores");

jb1.setActionCommand("new");

jb3.setActionCommand("instruction");
jb4.setActionCommand("high");


jb1.addActionListener(this);

jb3.addActionListener(this);
jb4.addActionListener(this);

add(jb1);

add(jb3);
add(jb4);

}

public void actionPerformed(ActionEvent ae)
{

if(ae.getActionCommand().equals("new"))
     {
           
     while(enable_board1)
          {
                Board1 b=new Board1(userstart);
                new Snake(b);
                 enable_board1=false;
}
     }
     if(ae.getActionCommand().equals("high"))
     {
           
     while(enable_highscore)
          {
                Highscores h=new Highscores(userstart);
                new Snake(h);
                 enable_highscore=false;
            }

        }
     if(ae.getActionCommand().equals("instruction"))
     {
           
     while(enable_instruction)
          {
                Instruction i=new Instruction(userstart);
                new Snake(i);
                 enable_instruction=false;
}
     }
}
}
