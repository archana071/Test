package snake2;


import javax.swing.JFrame;


public class Snake extends JFrame {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3450323111869429033L;

	public Snake(Board1 A) {

        add( A);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(320, 340);
        setLocationRelativeTo(null);
        setTitle("Level1");

        setResizable(false);
        setVisible(true);
   
}
	public Snake(Board2 B) {

        add( B);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(320, 340);
        setLocationRelativeTo(null);
        setTitle("Level2");

        setResizable(false);
        setVisible(true);
   
}

	
	
	public Snake(Board3 C) {

        add( C);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(320, 340);
        setLocationRelativeTo(null);
        setTitle("Level3");

        setResizable(false);
        setVisible(true);
   
}



	public Snake(snakemaze S) {

        add( S);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(320, 340);
        setLocationRelativeTo(null);
        setTitle("Snake");

        setResizable(false);
        setVisible(true);
   
}

public Snake(Start t) {

        add( t);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(320, 340);
        setLocationRelativeTo(null);
        setTitle("Start");

        setResizable(false);
        setVisible(true);
   
}
public Snake(Entry e) {
         
        add( e);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(320, 340);
        setLocationRelativeTo(null);
        setTitle("Entry");

        setResizable(false);
        setVisible(true);
   
}
public Snake(Login L) {

        add( L);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(320, 340);
        setLocationRelativeTo(null);
        setTitle("Login");

        setResizable(false);
        setVisible(true);
   
}
	
	
public Snake(Create c) {

        add( c);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(320, 340);
        setLocationRelativeTo(null);
        setTitle("Create");

        setResizable(false);
        setVisible(true);
   
}	
public Snake(Highscores H) {

    add( H);
    setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    setSize(320, 340);
    setLocationRelativeTo(null);
    setTitle("Highscores");

    setResizable(false);
    setVisible(true);
}
public Snake(Instruction A) {

    add( A);
    setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    setSize(320, 340);
    setLocationRelativeTo(null);
    setTitle("Instruction");

    setResizable(false);
    setVisible(true);

}
	
	
    public static void main(String[] args) {
     
      
      snakemaze A=new snakemaze();
      
    	new Snake(A);
    
        
    }

	
	
	
	
	
}
