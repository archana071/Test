package snake2;


import java.awt.*;
import java.sql.*;



import java.awt.event.*;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.Statement;


import javax.swing.*;




public class Board1 extends JPanel implements ActionListener {
	 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	boolean gpause=true;
	
	boolean pause_en=false;
	
	boolean enable_board2=true;
	private final int WIDTH = 300;
	    private final int HEIGHT = 300;
	    private final int DOT_SIZE = 10;
	    private final int ALL_DOTS = 900;
	    private final int RAND_POS = 29;
	    private final int DELAY = 140;
	    String b1user;

	    private int x[] = new int[ALL_DOTS];
	    private int y[] = new int[ALL_DOTS];

	    private int dots;
	    private int apple_x;
	    private int apple_y;

	    private boolean left = false;
	    private boolean right = true;
	    private boolean up = false;
	    private boolean down = false;
	    private boolean inGame = true;

	    private Timer timer;
	    private Image ball;
	    private Image apple;
	    private Image head;
	    
	
	    private boolean nl=false;
	    private Image level;
	    private Font titleFont;
	    private int score=0;
	       
	       

	
public Board1(String b) {
	b1user=b;
    addKeyListener(new TAdapter());
    //System.out.println(b1user);

    setBackground(Color.black);

    ImageIcon iid = new ImageIcon(this.getClass().getResource("dot.png"));
    ball = iid.getImage();

    ImageIcon iia = new ImageIcon(this.getClass().getResource("apple.png"));
    apple = iia.getImage();

    ImageIcon iih = new ImageIcon(this.getClass().getResource("head.png"));
    head = iih.getImage();

    ImageIcon iil = new ImageIcon(this.getClass().getResource("door.png"));
    level = iil.getImage(); 


    setFocusable(true);
    initGame();
}


public void initGame() {
      
    dots = 3;

//

    titleFont = new Font ("Modern No. 20", Font.BOLD, 20);
   // 
    
     for (int z = 0; z < dots; z++) {
        x[z] = 50 - z*10;
        y[z] = 50;
    }

    locateApple();
    
    timer = new Timer(DELAY, this);
    timer.start();
}


public void paint(Graphics g) {
    super.paint(g);

    if ((inGame) && (!nl)) {
  //     
      {
       if(score<1000)
       {
        g.drawImage(apple, apple_x, apple_y, this);
       }
     
     else
       g.drawImage(level, apple_x, apple_y, this);
     }
      // 
        for (int z = 0; z < dots; z++) {
            if (z == 0)
                g.drawImage(head, x[z], y[z], this);
            else g.drawImage(ball, x[z], y[z], this);
        }
          
    //      
        g.setColor(Color.white);
       g.setFont(titleFont);
        g.drawString("SCORE:"+score,0,300);
        
        //
        


    } 

else if(nl)
{
nextlevel(g);
}


else {
	
	
        gameOver(g,b1user);
    }


Toolkit.getDefaultToolkit().sync();
        g.dispose();

}


public  void gameOver(Graphics g,String k) {

	while(gpause)
	{
	
         
	try {
	       Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	       
	      Connection   con = DriverManager.getConnection("jdbc:odbc:csedsn","system","oracle");
	       
	          Statement st=con.createStatement();
	          System.out.println(score);
	            
	         String s="update highscores set score="+score+" where username='"+k+"'";
	       
	       
	                      
	        int p=st.executeUpdate(s);
	        if(p!=0)
	           System.out.println("record insered");
	           
	    }catch(Exception e)   
	    {
	        System.out.println("bye");
	    }
    
    
    gpause=false;
	}
	String msg = "Game Over";
    Font small = new Font("Helvetica", Font.BOLD, 24);
    FontMetrics metr = this.getFontMetrics(small);
   
    g.setColor(Color.white);
    g.setFont(small);
    
    g.drawString(msg, (WIDTH - metr.stringWidth(msg)) / 2,
                 HEIGHT / 2);
    g.drawString("SCORE:"+score,(WIDTH - metr.stringWidth(msg)) / 2,
            (HEIGHT / 2)+50);
}
//

public void nextlevel(Graphics g)
{
         

  String msg = "level1 passed";
    Font small = new Font("Helvetica", Font.BOLD, 24);
    FontMetrics metr = this.getFontMetrics(small);
   
    g.setColor(Color.white);
    g.setFont(small);
    
    g.drawString(msg, (WIDTH - metr.stringWidth(msg)) / 2,
                 HEIGHT / 2);

    while(enable_board2)
    {
    	Board2 B=new Board2(b1user);
    	new Snake(B);
    	enable_board2=false;
    }


}
//

public void checkApple() {

    if ((x[0] == apple_x) && (y[0] == apple_y)&&(score!=1000) ){
        dots++;
        score+=50;
        locateApple();
 
}

//
else if ((x[0] == apple_x) && (y[0] == apple_y)&&(score ==1000))
{
 nl=true;


}

//
}


public void move() {

    for (int z = dots; z > 0; z--) {
        x[z] = x[(z - 1)];
        y[z] = y[(z - 1)];
    }

    if (left) {
        if(x[0]<0)
         x[0]=300;
          else
            x[0] -= DOT_SIZE;
        }

        if (right) {
           if(x[0]>300)
         x[0]=0;
          else
            x[0] += DOT_SIZE;
        }

        if (up) {
            if(y[0]<0)
        y[0]=300;
          else
            y[0] -= DOT_SIZE;
        }

        if (down) {
 if(y[0]>300)
         y[0]=0;
          else
            y[0] += DOT_SIZE;
        }
}


public void checkCollision() {

      for (int z = dots; z > 0; z--) {

          if ((z > 4) && (x[0] == x[z]) && (y[0] == y[z])) {
              inGame = false;
          }
          
      }
      

    
}

public void locateApple() {
    int r = (int) (Math.random() * RAND_POS);
    apple_x = ((r * DOT_SIZE));
    r = (int) (Math.random() * RAND_POS);
    apple_y = ((r * DOT_SIZE));
}

public void actionPerformed(ActionEvent e) {

    if (inGame) {
        checkApple();
        checkCollision();
        move();
    }

    repaint();
}


/**/

private class TAdapter extends KeyAdapter {

	
	
	public void keyPressed(  KeyEvent e) {

        int key = e.getKeyCode();

        if ((key == KeyEvent.VK_LEFT) && (!right)) {
            left = true;
            up = false;
            down = false;
        }

          if ((key == KeyEvent.VK_RIGHT) && (!left)) {
            right = true;
            up = false;
            down = false;
        }

        if ((key == KeyEvent.VK_UP) && (!down)) {
            up = true;
            right = false;
            left = false;
        }

        if ((key == KeyEvent.VK_DOWN) && (!up)) {
            down = true;
            right = false;
            left = false;
        }

        if ((key == KeyEvent.VK_P) ) {
        	pause_en=!(pause_en);
        	if(pause_en){
        		while(key == KeyEvent.VK_P)
        		repaint();
        		
        	}
        	
        	}
        		
        	}
        }    
    
    
   
    
    }






