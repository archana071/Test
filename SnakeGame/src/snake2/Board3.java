package snake2;

import java.awt.Color;

import java.awt.Component;
import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;

import javax.swing.ImageIcon;
import javax.swing.Timer;
import javax.swing.JPanel;
import java.sql.*;


public class Board3 extends JPanel implements ActionListener{
	
private static final long serialVersionUID = -5643472061105604091L;
	
	
	static boolean Bdis= false;
	boolean gpause=true;
	private final int WIDTH = 300;
	    private final int HEIGHT = 300;
	    private final int DOT_SIZE = 10;
	    private final int ALL_DOTS = 900;
	    private final int RAND_POS = 29;
	    private final int DELAY = 140;

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
	    private Image block;
	//  

	    private int br1[] = new int[10];
	    private int bc1[] = new int[10];

	    private int br2[] = new int[10];
	    private int bc2[] = new int[10];

	    private int vr1[] = new int[5];
	    private int vc1[] = new int[5];

	    private int vr2[] = new int[5];
	    private int vc2[] = new int[5];

	    private int vr3[] = new int[5];
	    private int vc3[] = new int[5];
	    String b3user;


	    private boolean nl=false;
	    private Image level;
	    private Font titleFont;
	    private int score=2000;
	    private boolean test;


	//

	    public Board3(String b3) {
	    	b3user=b3;
	        addKeyListener(new TAdapter());

	        setBackground(Color.black);

	        ImageIcon iid = new ImageIcon(this.getClass().getResource("dot.png"));
	        ball = iid.getImage();

	        ImageIcon iia = new ImageIcon(this.getClass().getResource("apple.png"));
	        apple = iia.getImage();

	        ImageIcon iih = new ImageIcon(this.getClass().getResource("head.png"));
	        head = iih.getImage();

	        ImageIcon iil = new ImageIcon(this.getClass().getResource("door.png"));
	        level = iil.getImage(); 



	        ImageIcon iib = new ImageIcon(this.getClass().getResource("block.png"));
	        block = iib.getImage(); 





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

	        
	         for (int z = 0; z < 10; z++) {
	            br1[z] = 100+z*10;
	            bc1[z] = 70;
	        }

	        
	         for (int z = 0; z < 10; z++) {
	            br2[z] = 100+z*10;
	            bc2[z] = 220;
	        }

	        for (int z = 0; z < 5; z++) {
	            vr1[z] = 70;
	            vc1[z] = 120+z*10;
	        }

	         for (int z = 0; z < 5; z++) {
	            vr2[z] = 150;
	            vc2[z] = 120+z*10;
	        }
	        
	       for (int z = 0; z < 5; z++) {
	            vr3[z] = 220;
	            vc3[z] = 120+z*10;
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
	           if(score<3000)
	           {
	g.setColor(Color.white);
	            g.drawString("Apple at "+ apple_x+" "+apple_y, 100,200);
	            g.drawImage(apple, apple_x, apple_y, this);
	           }
	         
	         else
	           g.drawImage(level, apple_x, apple_y, this);
	         }
	          // 
	            for (int z = 0; z < dots; z++) {
	                if (z == 0)
	                    g.drawImage(head, x[z], y[z], this);
	                else 
	      g.drawImage(ball, x[z], y[z], this);
	            }
	              
	        //      

	            for(int z=0;z<10;z++)
	          {
	           g.drawImage(block,br1[z],bc1[z],this);
	           g.drawImage(block,br2[z],bc2[z],this);
	}
	         for(int z=0;z<5;z++)
	{
	           g.drawImage(block,vr1[z],vc1[z],this);
	           g.drawImage(block,vr2[z],vc2[z],this);
	           g.drawImage(block,vr3[z],vc3[z],this);
	          
	             }






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
		 setBdis(true);
	            gameOver(g,b3user);
	           
	            setEnabled(true);
	            
	        }


	 Toolkit.getDefaultToolkit().sync();
	            g.dispose();

	    }


	    public void gameOver(Graphics g,String k) {
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
	    	Bdis=true;
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
	             

	      String msg = "level3 passed";
	        Font small = new Font("Helvetica", Font.BOLD, 24);
	        FontMetrics metr = this.getFontMetrics(small);
	       
	        g.setColor(Color.white);
	        g.setFont(small);
	        
	        g.drawString(msg, (WIDTH - metr.stringWidth(msg)) / 2,
	                     HEIGHT / 2);
	        setBdis(true);
	        setEnabled(true);

	}
	//

	    public void checkApple() {
	         
	        if ((x[0] == apple_x) && (y[0] == apple_y)&&(score!=3000) ){
	            dots++;
	            score+=50;
	            locateApple();
	     
	 }

	//
	    else if ((x[0] == apple_x) && (y[0] == apple_y)&&(score ==3000))
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
	            x[0] -= DOT_SIZE;
	        }

	        if (right) {
	            x[0] += DOT_SIZE;
	        }

	        if (up) {
	            y[0] -= DOT_SIZE;
	        }

	        if (down) {
	            y[0] += DOT_SIZE;
	        }
	    }


	    public void checkCollision() {

	          for (int z = dots; z > 0; z--) {

	              if ((z > 4) && (x[0] == x[z]) && (y[0] == y[z])) {
	                  inGame = false;
	              }
	         
	             }
	          for(int l=90;l<190;) {
	              
	          

	              l=l+10;

	              if((x[0]==l) && ((y[0] ==70)||(y[0] ==220)))
	                 
	                { inGame = false;
	                  
	                   break;
	  }         

	                }

	//

	for(int l=110;l<160;) {
	              
	          

	              l=l+10;

	              if((y[0]==l) && ((x[0] ==70)||(x[0] ==150)||(x[0]==220)))
	                 
	                { inGame = false;
	                  
	                   break;
	  }         

	                }
	//


	            
	        

	        if (y[0] > 300) {
	            inGame = false;
	        }

	        if (y[0] < 0) {
	            inGame = false;
	        }

	      if (x[0] > 300) {
	            inGame = false;
	        }   

	        if (x[0] < 0) {
	            inGame = false;
	        }
	    }






	    public void locateApple() {




	        

	        int r = (int) (Math.random() * RAND_POS);
	        apple_x = ((r * DOT_SIZE));
	        r = (int) (Math.random() * RAND_POS);
	        apple_y = ((r * DOT_SIZE));
	 
	        

	           
	        

	            test=  (((apple_x>=100)||(apple_x<=200)) && ((apple_y==70)||(apple_y ==220)));
	                 
	               if(test)
	               {
	                apple_y=50;
	               }
	                   
	                

	//

	
	            test=  (((apple_y>=120)||(apple_y<=160)) && ((apple_x==70)||(apple_x ==150)||(apple_x==220)));
	                 
	               if(test)
	               {
	            	   apple_x=80;
	               }
	               
                  


	          


	    }

	    public void actionPerformed(ActionEvent e) {

	        if (inGame) {
	            checkApple();
	            checkCollision();
	            move();
	        }

	        repaint();
	    }

	    
	    public void setEnabled(boolean enabled) {
	        super.setEnabled(enabled);
	        Component[] components = getComponents();
	        if (components != null && components.length > 0) {
	        int count = components.length;
	        for (int i = 0; i < count; i++)
	            components[i].setEnabled(enabled);
	        }
	    }
	    
	       
	    

	    public static boolean isBdis() {
			return Bdis;
		}


		public static void setBdis(boolean bdis) {
			Bdis = bdis;
		}




		private class TAdapter extends KeyAdapter {

	        public void keyPressed(KeyEvent e) {

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
	        }
	    }
	

	
	



}
