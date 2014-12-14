package snake2;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class snakemaze extends JPanel implements ActionListener
{
String str;
boolean enable_entry=true;
private static final long serialVersionUID = 1L;

JButton jb,jb1;
snakemaze()
{
ImageIcon snake=new ImageIcon(this.getClass().getResource("Snake.png")); 
jb=new JButton(snake);

setBackground(Color.pink);

jb1=new JButton("SNAKEMAZE");

jb.setActionCommand("snake");
jb.addActionListener(this);
add(jb);


jb1.setActionCommand("snake1");
jb1.addActionListener(this);
add(jb1);

setFocusable(true);
}

public void actionPerformed(ActionEvent ae)
{

if (ae.getActionCommand().equals("snake1") ){

//

     while(enable_entry)
          {     
    	 
                Entry e=new Entry();
                
                new Snake(e);
                 enable_entry=false;
                 
}

//
        
}
}





}

