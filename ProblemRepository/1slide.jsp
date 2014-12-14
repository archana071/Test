<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="java.lang.*"%>
<!doctype html>

<%
String msgsuc1 =(String) session.getAttribute("msgsuc");
String invalidMessage = (String)session.getAttribute("invalid");
	if(msgsuc1 != "" && msgsuc1 != null)
	{
		//out.println("<b><font color='blue' style='margin-top: 13%;position: absolute;margin-left:38%;z-index:20000000'>"+msgsuc1+"</font></b>");
		//session.setAttribute("msgsuc","");
	}else if(invalidMessage != "" && invalidMessage != null)
	{
		out.println("<b><font color='red' style='margin-top: 13%;position: absolute;margin-left:38%;z-index:20000000'>"+invalidMessage+"</font></b>");
		session.setAttribute("invalid","");
	}

   Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
   Connection con=DriverManager.getConnection("jdbc:odbc:archu");
   Statement st=con.createStatement();
   Statement st1=con.createStatement();
   Integer userIDO=(Integer)session.getAttribute("memberId");
   String sessMemberName = (String) session.getAttribute("sessionMemberName");
   int userID=userIDO.intValue();
   int hatColorId=0;
   ResultSet mrset=st.executeQuery("select * from teammember where memberID="+userID+"");
   String name="",pic="",path="",house="",stone="",flag="",symbol="", customerTitle="",topProblemDescription="";
   String hatColorPath="";
   int topProblemId=0;
   char home='a';
   int totpoints[]=new int[4];
   int tp=0,hp=0,mp=0,tid=0,mybalance=0;
   if(mrset.next())
   {
	   name=mrset.getString(2);
	   house=mrset.getString(7);
	   home=house.charAt(0);
	   pic=mrset.getString(3);
	   path="images1/"+pic+".png";
	   mp=mrset.getInt(4);
	   tid=mrset.getInt(13);
   }
   else
   {}

   //GetMember Points

   ResultSet memrset = st.executeQuery("select memberpoints,accountbal,hatcolor from teammember where memberID = "+userID+"");
   if(memrset.next())
   {
	   mp = memrset.getInt("memberpoints");
	   mybalance = memrset.getInt("accountbal");
	   hatColorId = memrset.getInt("hatcolor");
   }
  if(sessMemberName.equals("leader")){
	  hatColorPath="images1/Picture83.png";  
  }else if(hatColorId ==84){
	   hatColorPath="images1/Picture84.png";
   }else if(hatColorId ==85){
	   hatColorPath="images1/Picture85.png";
   }else if(hatColorId ==86){
	   hatColorPath="images1/Picture86.png";
   }else if(hatColorId ==87){
	   hatColorPath="images1/Picture87.png";
   }else if(hatColorId ==88){
	   hatColorPath="images1/Picture88.png";
   }
   
   // Get Team  points and customer title
   ResultSet trset = st.executeQuery("select teampoints,Requirementdescription from teams where teamID="+tid+"");
   if(trset.next())
   {
	tp = trset.getInt("teampoints");
	customerTitle = trset.getString("Requirementdescription");
  }

   // Get House points
   ResultSet hrset = st.executeQuery("select housepoints from house where House='"+house+"'");
   if(hrset.next())
   {
	   hp = hrset.getInt("housepoints");
   }
   
  
   Statement customerst = con.createStatement();
   
   
   switch(home)
   {
	   case 'G':    
		   stone="images1/Picture6.png";
		   flag="images1/Picture9.png";
		   symbol="images1/Picture8.png";
		   break;
	   case 'S':
	   	   stone="images1/stone3.png";
	       flag="images1/green.png";
	       symbol="images1/slyth.png";
		   break;
	   case 'H':
	   		stone="images1/stone2.png";
	        flag="images1/yellow.png";
	        symbol="images1/huffl.png";
			break;
		case 'R':
			stone="images1/stone1.png";
	        flag="images1/blue.png";
	        symbol="images1/rawen.png";
			break;
	}
					 
    ResultSet rs2=st.executeQuery("select * from house");
	int i=0;
	while(rs2.next())
	{
		totpoints[i]=rs2.getInt(2);
		i++;
	}
	
	ResultSet rs3=st.executeQuery("select count(*) from teams where House='Griffyndor'");
	int count=0;
	int j=0;
	if(rs3.next())
	{
		count=rs3.getInt(1);
	}

	ResultSet rs4=st.executeQuery("select * from teams where House='Griffyndor'");
	String tname[]=new String[count];
	int tscore[]=new int[count];
	while(rs4.next())
	{
		tname[j]=rs4.getString(2);
		tscore[j]=rs4.getInt(6);
		j++;
	}
	
	ResultSet rs5=st.executeQuery("select count(*) from teams where House='Slytherin'");
	int count1=0;
	int j1=0;
	if(rs5.next())
	{
		count1=rs5.getInt(1);
	}
	
	ResultSet rs6=st.executeQuery("select * from teams where House='Slytherin'");
	String tname1[]=new String[count1];
	int tscore1[]=new int[count1];
	while(rs6.next())
	{
		tname1[j1]=rs6.getString(2);
		tscore1[j1]=rs6.getInt(6);
		j1++;
	}
	
	ResultSet rs7=st.executeQuery("select count(*) from teams where House='Hufflepuff'");
	int count2=0;
	int j2=0;
	if(rs7.next())
	{
		count2=rs7.getInt(1);
	}
	
	ResultSet rs8=st.executeQuery("select * from teams where House='Hufflepuff'");
	String tname2[]=new String[count2];
	int tscore2[]=new int[count2];
	while(rs8.next())
	{
		tname2[j2]=rs8.getString(2);
		tscore2[j2]=rs8.getInt(6);
		j2++;
	}
	
	ResultSet rs9=st.executeQuery("select count(*) from teams where House='Rawenclaw'");
	int count3=0;
	int j3=0;
	if(rs9.next())
	{
		count3=rs9.getInt(1);
	}
	
	ResultSet rs10=st.executeQuery("select * from teams where House='Hufflepuff'");
	String tname3[]=new String[count3];
	int tscore3[]=new int[count3];
	while(rs10.next())
	{
		tname3[j3]=rs10.getString(2);
		tscore3[j3]=rs10.getInt(6);
		j3++;
	}
			
	ResultSet rs11=st.executeQuery("select count(*) from teammember where teamID="+tid+"");
	int ncount=0;
	int x=0;
	if(rs11.next())
	{
		ncount=rs11.getInt(1);
	}
		
	ResultSet rs12=st.executeQuery("select * from teammember where teamID="+tid+"");
	String nname[]=new String[ncount];
	String npath[]=new String[ncount];
	String tpath[]=new String[ncount];
	int nscore[]=new int[ncount];
	while(rs12.next())
	{
		nname[x]=rs12.getString(2);
		npath[x]=rs12.getString(3);
		tpath[x]="images1/"+npath[x]+".png";
		nscore[x]=rs12.getInt(4);
		x++;
	}
	
	String Customer="";
	ResultSet rs13=st.executeQuery("select * from teams where teamID="+tid+"");
	if(rs13.next())
	{
		Customer=rs13.getString(4);
	}
	
	int pcount=0;
	ResultSet rs15=st.executeQuery("select count(*) from problems where teamID="+tid+"");
	if(rs15.next())
	{
        pcount=rs15.getInt(1);
	}
	
	String topProblems[] = new String[pcount];
	String img[]=new String[pcount];
	String imgpath[]=new String[pcount];
	String msg[]=new String[pcount];
	int mid[]=new int[pcount];
	int pid[]=new int[pcount];
	
	Statement state1 = con.createStatement();
	Statement state2 = con.createStatement();
	ResultSet result2=null;
	int qq=0;
	ResultSet result1 = state1.executeQuery("select problemID,(importance+frequency+frustration)/3 from rating where teamID="+tid+" order by (importance+frequency+frustration)/3 desc");
	while(result1.next())
	{
		int probId = result1.getInt(1);
		int avgrating = result1.getInt(2);
		result2 = state2.executeQuery("select problemstatement from problems where problemID="+probId+"");
		if(result2.next())
		{
			topProblems[qq] = result2.getString("problemstatement");
			if(qq==0){
				topProblemDescription = topProblems[qq];
				topProblemId=probId;
			}
		}
		qq++;
	}
	
	ResultSet rs14=st.executeQuery("select * from problems where teamID="+tid+"");
	int v=0;
	while(rs14.next())
	{
	 	mid[v]=rs14.getInt(3);
		pid[v]=rs14.getInt(1);
		ResultSet new2=st1.executeQuery("select memberphoto from teammember where memberID="+mid[v]+"");
		if(new2.next())
		{
			img[v]=new2.getString(1);
			imgpath[v]="images1/"+img[v]+".png";
	    }
		ResultSet new1=st1.executeQuery("select problemstatement from problems where memberID="+mid[v]+" and problemID="+pid[v]+"");
		if(new1.next())
		{
			msg[v]=new1.getString(1);
		}
        v++;
    }
	
	String firstPhaseItems="";
	String secondPhaseItems ="";
	Statement statem = con.createStatement();
	ResultSet resSet1 = statem.executeQuery("select * from items where memberID="+userID+"");
	if(resSet1.next())
	{
		String item1 = resSet1.getString("item1");
		String item2 = resSet1.getString("item2");
		String item3 = resSet1.getString("item3");
		String item4 = resSet1.getString("item4");
		String item5 = resSet1.getString("item5");
		String item6 = resSet1.getString("item6");
		String item7 = resSet1.getString("item7");
		String item8 = resSet1.getString("item8");
		
		String s="";
		
		if(item6.equals("Yes") || item7.equals("Yes") || item8.equals("Yes")){
			s="Yes";
		}else{
			s = "No";
		}
		
		if(item2.equals("Yes")){
			secondPhaseItems = "Yes";
		}else{
			secondPhaseItems = "No";
		}
		
		if(item1.equals("Yes") && item5.equals("Yes") && item4.equals("Yes") && s.equals("Yes")){
			firstPhaseItems = "Yes";
		}else
		{
			firstPhaseItems = "No";
		}
	}else{
		firstPhaseItems = "No";
		secondPhaseItems ="No";
	}
	
%>

<html lang="en">
<head>
<link rel="stylesheet" href="styles/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="styles/style.css" type="text/css" />
<link rel="stylesheet" href="styles/bootstrap-responsive.css"
	type="text/css" />
<title>Home</title>
<script src="scripts/jquery-1.8.1.min.js"></script>
<script src="scripts/bootstrap.js"></script>
<script src="scripts/jquery.timer.js"></script>

<script type='text/javascript'>
			$('[data-toggle="tooltip"]').tooltip({'placement': 'top'});
		</script>

<script type='text/javascript'>
		var pcount = "<%=pcount%>";
		var ratingNumber=0;
	
	$('#NotificationId').live('click',function(){
			$('#sortingHatnextId').addClass('hide');
			$('#sortingHatnextId12').addClass('hide');
			$('#sortingHatnextId13').addClass('hide');
			$('#timerid').addClass('hide');
			$('#timerid1').addClass('hide');
			$('#closeBook1').addClass('hide');
			$('#firstImage').addClass('hide');
			$('#notificationPanelId').removeClass('hide');
			$('#nameChangeDiv').addClass('hide');
			$('#slide35Container').addClass('hide');
			$('#problemContainer2').addClass('hide');
			$('#Slide32Container').addClass('hide');
			$('#ratingForwardContainer3').addClass('hide');
			
			for(var m=0;m<pcount;m++)
			{
				var t1 = "#ratingContainer"+m;
				$(t1).addClass('hide');
			}
			$('#helpMessage1').addClass('hide');
			$('#diagonAlley').addClass('hide');
			$('#tcos').addClass('hide');
			$('#page1').addClass('hide');
			$('#page1').siblings().addClass('hide');
			$('#gifClick').addClass('hide');	
			$('#owlMessage').addClass('hide');
			$('#grinCotts').addClass('hide');
			$('#store').addClass('hide');
			$('#problemContainer').addClass('hide');
			$('#afterProblemContainer').addClass('hide');
			$('#ProbelmListcontainer').addClass('hide');
			$('#keyContentContainer').addClass('hide');
			$('#problemContainer1').addClass('hide');
			$('#problemsIdentifiedContainerBack').addClass('hide');
			$('#commonRoom').addClass('hide');
		 	$('#slide9').addClass('hide');
        	$('#slide10').addClass('hide');
	});

	$('#problemContainer #gcKey').live('click',function(){
			$('#sortingHatnextId').addClass('hide');
			$('#sortingHatnextId12').addClass('hide');
			$('#sortingHatnextId13').addClass('hide');
			$('#notificationPanelId').addClass('hide');
			$('#timerid').addClass('hide');
			$('#timerid1').addClass('hide');
			$('#nameChangeDiv').addClass('hide');
			$('#slide35Container').addClass('hide');
			$('#problemContainer2').addClass('hide');
			$('#Slide32Container').addClass('hide');
			$('#ratingForwardContainer3').addClass('hide');
			for(var m=0;m<pcount;m++)
			{
				var t1 = "#ratingContainer"+m;
				$(t1).addClass('hide');
			}
			
			$('#helpMessage1').addClass('hide');
			$('#diagonAlley').addClass('hide');
			$('#tcos').addClass('hide');
			$('#page1').addClass('hide');
			$('#page1').siblings().addClass('hide');
			$('#gifClick').addClass('hide');	
			$('#owlMessage').addClass('hide');
			$('#grinCotts').addClass('hide');
			$('#store').addClass('hide');
			$('#firstImage').addClass('hide');
			$('#problemContainer').addClass('hide');
			$('#afterProblemContainer').addClass('hide');
			$('#ProbelmListcontainer').addClass('hide');
			$('#keyContentContainer').removeClass('hide');
			$('#problemContainer1').addClass('hide');
			$('#problemsIdentifiedContainerBack').addClass('hide');
			$('#commonRoom').addClass('hide');
		 	$('#slide9').addClass('hide');
        	$('#slide10').addClass('hide');
		});

		$('#ProblemListContainerId').live('click',function(){
			$('#sortingHatnextId').addClass('hide');
			$('#sortingHatnextId12').addClass('hide');
			$('#sortingHatnextId13').addClass('hide');
			$('#notificationPanelId').addClass('hide');
			$('#timerid').addClass('hide');
			$('#timerid1').addClass('hide');
			$('#nameChangeDiv').addClass('hide');
			$('#slide35Container').addClass('hide');
			$('#problemContainer2').addClass('hide');
			$('#Slide32Container').addClass('hide');
			$('#ratingForwardContainer3').addClass('hide');
			for(var m=0;m<pcount;m++)
			{
				var t1 = "#ratingContainer"+m;
				$(t1).addClass('hide');
			}
			
			$('#helpMessage1').removeClass('hide');
			$('#diagonAlley').addClass('hide');
			$('#tcos').addClass('hide');
			$('#page1').addClass('hide');
			$('#page1').siblings().addClass('hide');
			$('#gifClick').addClass('hide');	
			$('#owlMessage').addClass('hide');
			$('#grinCotts').addClass('hide');
			$('#store').addClass('hide');
			$('#firstImage').addClass('hide');
			$('#problemContainer').addClass('hide');
			$('#afterProblemContainer').removeClass('hide');
			$('#ProbelmListcontainer').addClass('hide');
			$('#keyContentContainer').addClass('hide');
			$('#problemContainer1').addClass('hide');
			$('#problemsIdentifiedContainerBack').addClass('hide');
			$('#commonRoom').addClass('hide');
		 	$('#slide9').addClass('hide');
        	$('#slide10').addClass('hide');
		});
		
		$('#ProblemContainerBack').live('click',function(){
			$('#sortingHatnextId').addClass('hide');
			$('#sortingHatnextId12').addClass('hide');
			$('#sortingHatnextId13').addClass('hide');
			$('#nameChangeDiv').addClass('hide');
			$('#timerid1').addClass('hide');
			$('#timerid').addClass('hide');
			$('#notificationPanelId').addClass('hide');
			$('#slide35Container').addClass('hide');
			$('#problemContainer2').addClass('hide');
			$('#Slide32Container').addClass('hide');
			$('#ratingForwardContainer3').addClass('hide');
			
			for(var m=0;m<pcount;m++)
			{
				var t1 = "#ratingContainer"+m;
				$(t1).addClass('hide');
			}
			$('#helpMessage1').addClass('hide');
			$('#diagonAlley').addClass('hide');
			$('#tcos').addClass('hide');
			$('#page1').addClass('hide');
			$('#page1').siblings().addClass('hide');
			$('#gifClick').addClass('hide');	
			$('#owlMessage').addClass('hide');
			$('#grinCotts').addClass('hide');
			$('#store').addClass('hide');
			$('#firstImage').addClass('hide');
			$('#problemContainer').addClass('hide');
			$('#problemsIdentifiedContainerBack').addClass('hide');
			$('#afterProblemContainer').addClass('hide');
			$('#ProbelmListcontainer').addClass('hide');
			$('#keyContentContainer').addClass('hide');
			$('#problemContainer1').removeClass('hide');
			$('#commonRoom').addClass('hide');
			$('#slide9').addClass('hide');
			$('#slide10').addClass('hide');
		});

		$('#ProblemListContainerId1').live('click',function(){
			$('#sortingHatnextId').addClass('hide');
			$('#sortingHatnextId12').addClass('hide');
			$('#sortingHatnextId13').addClass('hide');
			$('#notificationPanelId').addClass('hide');
			$('#timerid1').addClass('hide');
			$('#timerid').addClass('hide');
			$('#slide35Container').addClass('hide');
			$('#nameChangeDiv').addClass('hide');
			$('#problemContainer2').addClass('hide');
			$('#Slide32Container').addClass('hide');
			$('#ratingForwardContainer3').addClass('hide');
			for(var m=0;m<pcount;m++)
			{
				var t1 = "#ratingContainer"+m;
				$(t1).addClass('hide');
			}
			
			$('#helpMessage1').removeClass('hide');
			$('#diagonAlley').addClass('hide');
			$('#tcos').addClass('hide');
			$('#page1').addClass('hide');
			$('#page1').siblings().addClass('hide');
			$('#gifClick').addClass('hide');	
			$('#owlMessage').addClass('hide');
			$('#grinCotts').addClass('hide');
			$('#store').addClass('hide');
			$('#firstImage').addClass('hide');
			$('#problemContainer').addClass('hide');
			$('#problemContainer1').removeClass('hide');
			$('#afterProblemContainer').addClass('hide');
			$('#ProbelmListcontainer').addClass('hide');
			$('#keyContentContainer').addClass('hide');
			$('#problemsIdentifiedContainerBack').addClass('hide');
			$('#commonRoom').addClass('hide');
		 	$('#slide9').addClass('hide');
        	$('#slide10').addClass('hide');
		});

		$('#gcKey1').live('click',function(){
			$('#sortingHatnextId').addClass('hide');
			$('#sortingHatnextId12').addClass('hide');
			$('#sortingHatnextId13').addClass('hide');
			$('#timerid').addClass('hide');
			$('#timerid1').addClass('hide');
			$('#notificationPanelId').addClass('hide');
			$('#firstImage').addClass('hide');
			$('#slide35Container').addClass('hide');
			$('#problemContainer2').addClass('hide');
			$('#Slide32Container').addClass('hide');
			$('#ratingForwardContainer3').addClass('hide');
			
			for(var m=0;m<pcount;m++)
			{
				var t1 = "#ratingContainer"+m;
				$(t1).addClass('hide');
			}
			$('#helpMessage1').addClass('hide');
			$('#diagonAlley').addClass('hide');
			$('#tcos').addClass('hide');
			$('#gifClick').addClass('hide');	
			$('#owlMessage').addClass('hide');
			$('#grinCotts').addClass('hide');
			$('#store').addClass('hide');
			$('#nameChangeDiv').addClass('hide');
			$('#page1').addClass('hide');
			$('#page1').siblings().addClass('hide');
			$('#problemContainer').addClass('hide');
			$('#problemsIdentifiedContainerBack').removeClass('hide');
			$('#problemContainer1').addClass('hide');
			$('#afterProblemContainer').addClass('hide');
			$('#ProbelmListcontainer').addClass('hide');
			$('#keyContentContainer').addClass('hide');
			$('#commonRoom').addClass('hide');
			$('#slide9').addClass('hide');
			$('#slide10').addClass('hide');
		});

		$('#gcKey11').live('click',function(){
			$('#sortingHatnextId').addClass('hide');
			$('#sortingHatnextId12').addClass('hide');
			$('#sortingHatnextId13').addClass('hide');
			$('#timerid').addClass('hide');
			$('#timerid1').addClass('hide');
			$('#notificationPanelId').addClass('hide');
			$('#firstImage').addClass('hide');
			$('#slide35Container').addClass('hide');
			$('#problemContainer2').addClass('hide');
			$('#Slide32Container').addClass('hide');
			$('#ratingForwardContainer3').addClass('hide');
			
			for(var m=0;m<pcount;m++)
			{
				var t1 = "#ratingContainer"+m;
				$(t1).addClass('hide');
			}
			$('#helpMessage1').addClass('hide');
			$('#diagonAlley').addClass('hide');
			$('#tcos').addClass('hide');
			$('#gifClick').addClass('hide');	
			$('#owlMessage').addClass('hide');
			$('#grinCotts').addClass('hide');
			$('#store').addClass('hide');
			$('#nameChangeDiv').addClass('hide');
			$('#page1').addClass('hide');
			$('#page1').siblings().addClass('hide');
			$('#problemContainer').addClass('hide');
			$('#problemsIdentifiedContainerBack').removeClass('hide');
			$('#problemContainer1').addClass('hide');
			$('#afterProblemContainer').addClass('hide');
			$('#ProbelmListcontainer').addClass('hide');
			$('#keyContentContainer').addClass('hide');
			$('#commonRoom').addClass('hide');
			$('#slide9').addClass('hide');
			$('#slide10').addClass('hide');
		});

		$('#HEclickId').live('click',function(){
			var firstPhaseOver = "<%=firstPhaseItems%>";
			
			if(firstPhaseOver == "Yes"){
				$('#helpMessage1').removeClass('hide');	
				$('#diagonAlley').addClass('hide');
			}else{
				alert('You have to buy KEY, ROBE, WAND, one PET atlease in Diagon Alley to enter into the next round. Hurry Up...');
				$('#helpMessage1').addClass('hide');
				$('#diagonAlley').removeClass('hide');
			}
			
			$('#sortingHatnextId').addClass('hide');
			$('#sortingHatnextId12').addClass('hide');
			$('#sortingHatnextId13').addClass('hide');
			$('#timerid').addClass('hide');
			$('#timerid1').addClass('hide');
			$('#notificationPanelId').addClass('hide');
			$('#firstImage').addClass('hide');
			$('#slide35Container').addClass('hide');
			$('#problemContainer2').addClass('hide');
			$('#Slide32Container').addClass('hide');
			$('#ratingForwardContainer3').addClass('hide');
			for(var m=0;m<pcount;m++)
			{
				var t1 = "#ratingContainer"+m;
				$(t1).addClass('hide');
			}
			
			
			$('#problemContainer1').addClass('hide');
			$('#problemsIdentifiedContainerBack').addClass('hide');
			$('#afterProblemContainer').addClass('hide');
			$('#ProbelmListcontainer').addClass('hide');
			$('#keyContentContainer').addClass('hide');
			
			$('#tcos').addClass('hide');
			$('#page1').addClass('hide');
			$('#page1').siblings().addClass('hide');
			$('#nameChangeDiv').addClass('hide');
			$('#gifClick').addClass('hide');	
			$('#owlMessage').addClass('hide');
			$('#grinCotts').addClass('hide');
			$('#store').addClass('hide');
			$('#problemContainer').addClass('hide');
			$('#commonRoom').addClass('hide');
		 	$('#slide9').addClass('hide');
        	$('#slide10').addClass('hide');
		});

		$('#ratingContainer1Id').live('click',function(){

			$('#sortingHatnextId').addClass('hide');
			$('#sortingHatnextId12').addClass('hide');
			$('#sortingHatnextId13').addClass('hide');
			$('#notificationPanelId').addClass('hide');
			$('#firstImage').addClass('hide');
			$('#timerid').addClass('hide');
			$('#nameChangeDiv').addClass('hide');
			$('#slide35Container').addClass('hide');
			$('#problemContainer2').addClass('hide');
			$('#Slide32Container').addClass('hide');
			$('#ratingForwardContainer3').addClass('hide');
			$('#timerid1').removeClass('hide');
			$('#ratingContainer0').removeClass('hide');
			$('#backwordContainer0').addClass('hide');
			$('#helpMessage1').addClass('hide');
			$('#problemContainer1').addClass('hide');
			$('#problemsIdentifiedContainerBack').addClass('hide');
			$('#afterProblemContainer').addClass('hide');
			$('#ProbelmListcontainer').addClass('hide');
			$('#keyContentContainer').addClass('hide');
			$('#diagonAlley').addClass('hide');
			$('#tcos').addClass('hide');
			$('#page1').addClass('hide');
			$('#page1').siblings().addClass('hide');
			$('#gifClick').addClass('hide');	
			$('#owlMessage').addClass('hide');
			$('#grinCotts').addClass('hide');
			$('#store').addClass('hide');
			$('#problemContainer').addClass('hide');
			$('#commonRoom').addClass('hide');
		 	$('#slide9').addClass('hide');
        	$('#slide10').addClass('hide');
		});

		$('#Picture70Id').live('click',function(){
			$('#sortingHatnextId').addClass('hide');
			$('#sortingHatnextId12').addClass('hide');
			$('#sortingHatnextId13').addClass('hide');
			$('#notificationPanelId').addClass('hide');
			$('#firstImage').addClass('hide');
			$('#timerid1').addClass('hide');
			$('#timerid').addClass('hide');
			$('#nameChangeDiv').addClass('hide');
			$('#slide35Container').addClass('hide');
			$('#problemContainer2').removeClass('hide');
			$('#Slide32Container').addClass('hide');
			$('#ratingForwardContainer3').addClass('hide');
			for(var m=0;m<pcount;m++)
			{
				var t1 = "#ratingContainer"+m;
				$(t1).addClass('hide');
			}
			
			$('#helpMessage1').addClass('hide');
			$('#problemContainer1').addClass('hide');
			$('#problemsIdentifiedContainerBack').addClass('hide');
			$('#afterProblemContainer').addClass('hide');
			$('#ProbelmListcontainer').addClass('hide');
			$('#keyContentContainer').addClass('hide');
			$('#diagonAlley').addClass('hide');
			$('#tcos').addClass('hide');
			$('#page1').addClass('hide');
			$('#page1').siblings().addClass('hide');
			$('#gifClick').addClass('hide');	
			$('#owlMessage').addClass('hide');
			$('#grinCotts').addClass('hide');
			$('#store').addClass('hide');
			$('#problemContainer').addClass('hide');
			$('#commonRoom').addClass('hide');
			$('#slide9').addClass('hide');
        	$('#slide10').addClass('hide');
		});

		$('#HogExpId').live('click',function(){
			$('#sortingHatnextId').addClass('hide');
			$('#sortingHatnextId12').addClass('hide');
			$('#sortingHatnextId13').addClass('hide');
			$('#notificationPanelId').addClass('hide');
			$('#firstImage').addClass('hide');
			$('#timerid1').addClass('hide');
			$('#timerid').addClass('hide');
			$('#nameChangeDiv').addClass('hide');
			$('#slide35Container').removeClass('hide');
			$('#problemContainer2').addClass('hide');
			$('#Slide32Container').addClass('hide');
			$('#ratingForwardContainer3').addClass('hide');
			
			for(var m=0;m<pcount;m++)
			{
				var t1 = "#ratingContainer"+m;
				$(t1).addClass('hide');
			}
			$('#helpMessage1').addClass('hide');
			$('#problemContainer1').addClass('hide');
			$('#problemsIdentifiedContainerBack').addClass('hide');
			$('#afterProblemContainer').addClass('hide');
			$('#ProbelmListcontainer').addClass('hide');
			$('#keyContentContainer').addClass('hide');
			$('#diagonAlley').addClass('hide');
			$('#tcos').addClass('hide');
			$('#page1').addClass('hide');
			$('#page1').siblings().addClass('hide');
			$('#gifClick').addClass('hide');	
			$('#owlMessage').addClass('hide');
			$('#grinCotts').addClass('hide');
			$('#store').addClass('hide');
			$('#problemContainer').addClass('hide');
			$('#commonRoom').addClass('hide');
		 	$('#slide9').addClass('hide');
        	$('#slide10').addClass('hide');
		});

		$('#hatsortId').live('click',function(){
			var sesmem = "<%=sessMemberName%>";
			var secondPhase = "<%=secondPhaseItems%>";
			
			if(secondPhase =="Yes")	{		
			if(timerCount2 == 0){
				$('#sortingHatnextId12').removeClass('hide');
				$('#sortingHatnextId13').addClass('hide');
				$('#sortingHatnextId').addClass('hide');
			}else{
				if(sesmem == "member"){
					$('#sortingHatnextId13').removeClass('hide');
					$('#sortingHatnextId12').addClass('hide');
					$('#sortingHatnextId').addClass('hide');
				}else{
					$('#sortingHatnextId').removeClass('hide');	
					$('#sortingHatnextId13').addClass('hide');
					$('#sortingHatnextId12').addClass('hide');
				}
			}
		}else
			{
			alert('You have to buy TICKET in Diagon Alley to enter into the next round. Hurry Up...');
			$('#diagonAlley').removeClass('hide');
			$('#sortingHatnextId12').addClass('hide');
			$('#sortingHatnextId13').addClass('hide');
			$('#sortingHatnextId').addClass('hide');
			
			}
			$('#notificationPanelId').addClass('hide');
			$('#firstImage').addClass('hide');
			$('#timerid1').addClass('hide');
			$('#timerid').addClass('hide');
			$('#nameChangeDiv').addClass('hide');
			$('#slide35Container').addClass('hide');
			$('#problemContainer2').addClass('hide');
			$('#Slide32Container').addClass('hide');
			$('#ratingForwardContainer3').addClass('hide');
			for(var m=0;m<pcount;m++)
			{
				var t1 = "#ratingContainer"+m;
				$(t1).addClass('hide');
			}
			
			$('#helpMessage1').addClass('hide');
			$('#problemContainer1').addClass('hide');
			$('#problemsIdentifiedContainerBack').addClass('hide');
			$('#afterProblemContainer').addClass('hide');
			$('#ProbelmListcontainer').addClass('hide');
			$('#keyContentContainer').addClass('hide');
			$('#tcos').addClass('hide');
			$('#page1').addClass('hide');
			$('#page1').siblings().addClass('hide');
			$('#gifClick').addClass('hide');	
			$('#owlMessage').addClass('hide');
			$('#grinCotts').addClass('hide');
			$('#store').addClass('hide');
			$('#problemContainer').addClass('hide');
			$('#commonRoom').addClass('hide');
		 	$('#slide9').addClass('hide');
        	$('#slide10').addClass('hide');
		});

		$('#problemsListId').live('click',function(){
			$('#sortingHatnextId').addClass('hide');
			$('#sortingHatnextId12').addClass('hide');
			$('#sortingHatnextId13').addClass('hide');
			$('#notificationPanelId').addClass('hide');
			$('#firstImage').addClass('hide');
			$('#timerid1').addClass('hide');
			$('#timerid').addClass('hide');
			$('#nameChangeDiv').addClass('hide');
			$('#slide35Container').addClass('hide');
			$('#problemContainer2').removeClass('hide');
			$('#Slide32Container').addClass('hide');
			$('#ratingForwardContainer3').addClass('hide');
			for(var m=0;m<pcount;m++)
			{
				var t1 = "#ratingContainer"+m;
				$(t1).addClass('hide');
			}
			
			$('#helpMessage1').addClass('hide');
			$('#problemContainer1').addClass('hide');
			$('#problemsIdentifiedContainerBack').addClass('hide');
			$('#afterProblemContainer').addClass('hide');
			$('#ProbelmListcontainer').addClass('hide');
			$('#keyContentContainer').addClass('hide');
			$('#diagonAlley').addClass('hide');
			$('#tcos').addClass('hide');
			$('#page1').addClass('hide');
			$('#page1').siblings().addClass('hide');
			$('#gifClick').addClass('hide');	
			$('#owlMessage').addClass('hide');
			$('#grinCotts').addClass('hide');
			$('#store').addClass('hide');
			$('#problemContainer').addClass('hide');
			$('#commonRoom').addClass('hide');
			$('#slide9').addClass('hide');
			$('#slide10').addClass('hide');
		});

		$('img.Pic26Forward').live('click',function(){
			var pcount="<%=pcount%>";
			var id = $(this).attr('id');
			var ids = id.substring((id.length-1),id.length);
			ratingNumber= Number(ids)-1;
					
			for(var m=0;m<pcount;m++)
			{
				if(m!=ids){
				var t1 = "#ratingContainer"+m;
				$(t1).addClass('hide');
				}
			}
			var rate1 = "#ratingContainer"+ids;
			$(rate1).removeClass('hide');
			
			var tt = Number(pcount)-1;
			var tt1 = Number(tt)+1;
			var idd = "#forwardContainer"+Number(tt1);
			var idd1 = "#submitId"+ids;
			
			if(tt == ids)
			{
				$(idd1).removeClass('hide');
				$(idd).addClass('hide');

			}
				

			$('#notificationPanelId').addClass('hide');
			$('#sortingHatnextId').addClass('hide');
			$('#sortingHatnextId12').addClass('hide');
			$('#sortingHatnextId13').addClass('hide');
			$('#firstImage').addClass('hide');
			$('#timerid1').removeClass('hide');
			$('#timerid').addClass('hide');
			$('#nameChangeDiv').addClass('hide');
			$('#slide35Container').addClass('hide');
			$('#problemContainer2').addClass('hide');
			$('#Slide32Container').addClass('hide');
			$('#ratingForwardContainer3').addClass('hide');
			$('#helpMessage1').addClass('hide');
			$('#problemContainer1').addClass('hide');
			$('#problemsIdentifiedContainerBack').addClass('hide');
			$('#afterProblemContainer').addClass('hide');
			$('#ProbelmListcontainer').addClass('hide');
			$('#keyContentContainer').addClass('hide');
			$('#diagonAlley').addClass('hide');
			$('#tcos').addClass('hide');
			$('#page1').addClass('hide');
			$('#page1').siblings().addClass('hide');
			$('#gifClick').addClass('hide');	
			$('#owlMessage').addClass('hide');
			$('#grinCotts').addClass('hide');
			$('#store').addClass('hide');
			$('#problemContainer').addClass('hide');
			$('#commonRoom').addClass('hide');
			$('#slide9').addClass('hide');
			$('#slide10').addClass('hide');			
		});

		$('img.ratingForwardBack').live('click',function(){
			var pcount="<%=pcount%>";
		var id = $(this).attr('id');
		var ids = id.substring((id.length - 1), id.length);
		ratingNumber = ids;
		for (var m = 0; m < pcount; m++) {
			if (m != ids) {
				var t1 = "#ratingContainer" + m;
				$(t1).addClass('hide');
				var t2 = "submitId" + m;
				$(t2).addClass('hide');
			}
		}

		var rate1 = "#ratingContainer" + ids;
		$(rate1).removeClass('hide');

		$('#notificationPanelId').addClass('hide');
		$('#sortingHatnextId').addClass('hide');
		$('#sortingHatnextId12').addClass('hide');
		$('#sortingHatnextId13').addClass('hide');
		$('#firstImage').addClass('hide');
		$('#timerid1').removeClass('hide');
		$('#timerid').addClass('hide');
		$('#nameChangeDiv').addClass('hide');
		$('#slide35Container').addClass('hide');
		$('#problemContainer2').addClass('hide');
		$('#Slide32Container').addClass('hide');
		$('#ratingForwardContainer3').addClass('hide');
		$('#helpMessage1').addClass('hide');
		$('#problemContainer1').addClass('hide');
		$('#problemsIdentifiedContainerBack').addClass('hide');
		$('#afterProblemContainer').addClass('hide');
		$('#ProbelmListcontainer').addClass('hide');
		$('#keyContentContainer').addClass('hide');
		$('#diagonAlley').addClass('hide');
		$('#tcos').addClass('hide');
		$('#page1').addClass('hide');
		$('#page1').siblings().addClass('hide');
		$('#gifClick').addClass('hide');
		$('#owlMessage').addClass('hide');
		$('#grinCotts').addClass('hide');
		$('#store').addClass('hide');
		$('#problemContainer').addClass('hide');
		$('#commonRoom').addClass('hide');
		$('#slide9').addClass('hide');
		$('#slide10').addClass('hide');
	});

	$('#keyContentNext').live('click', function() {
		$('#timerid').removeClass('hide');
		$('#timerid1').addClass('hide');
		$('#notificationPanelId').addClass('hide');
		$('#nameChangeDiv').addClass('hide');
		$('#firstImage').addClass('hide');
		$('#slide35Container').addClass('hide');
		$('#problemContainer2').addClass('hide');
		$('#Slide32Container').addClass('hide');
		$('#ratingForwardContainer3').addClass('hide');
		for (var m = 0; m < pcount; m++) {
			var t1 = "#ratingContainer" + m;
			$(t1).addClass('hide');
		}
		$('#ProbelmListcontainer').removeClass('hide');
		$('#keyContentContainer').addClass('hide');
		$('#diagonAlley').addClass('hide');
		$('#tcos').addClass('hide');
		$('#sortingHatnextId').addClass('hide');
		$('#sortingHatnextId12').addClass('hide');
		$('#sortingHatnextId13').addClass('hide');
		$('#page1').addClass('hide');
		$('#page1').siblings().addClass('hide');
		$('#gifClick').addClass('hide');
		$('#owlMessage').addClass('hide');
		$('#grinCotts').addClass('hide');
		$('#store').addClass('hide');
		$('#problemContainer').addClass('hide');
		$('#afterProblemContainer').addClass('hide');
		$('#keyContentContainer').addClass('hide');
		$('#problemContainer1').addClass('hide');
		$('#problemsIdentifiedContainerBack').addClass('hide');
		$('#commonRoom').addClass('hide');
		$('#slide9').addClass('hide');
		$('#slide10').addClass('hide');
	});

	$('#dalleyMenu').live('click', function() {
		$('#closeBook1').removeClass('hide');
		$('#diagonAlley').removeClass('hide');
		$('#notificationPanelId').addClass('hide');
		$('#firstImage').addClass('hide');
		$('#timerid').addClass('hide');
		$('#timerid1').addClass('hide');
		$('#slide35Container').addClass('hide');
		$('#problemContainer2').addClass('hide');
		$('#Slide32Container').addClass('hide');
		$('#ratingForwardContainer3').addClass('hide');
		for (var m = 0; m < pcount; m++) {
			var t1 = "#ratingContainer" + m;
			$(t1).addClass('hide');
		}

		$('#tcos').addClass('hide');
		$('#page1').addClass('hide');
		$('#page1').siblings().addClass('hide');
		$('#gifClick').addClass('hide');
		$('#owlMessage').addClass('hide');
		$('#sortingHatnextId').addClass('hide');
		$('#sortingHatnextId12').addClass('hide');
		$('#sortingHatnextId13').addClass('hide');
		$('#grinCotts').addClass('hide');
		$('#store').addClass('hide');
		$('#nameChangeDiv').addClass('hide');
		$('#problemContainer').addClass('hide');
		$('#afterProblemContainer').addClass('hide');
		$('#ProbelmListcontainer').addClass('hide');
		$('#keyContentContainer').addClass('hide');
		$('#problemContainer1').addClass('hide');
		$('#problemsIdentifiedContainerBack').addClass('hide');
		$('#commonRoom').addClass('hide');
		$('#slide9').addClass('hide');
		$('#slide10').addClass('hide');

	});

	$('#Picture48Id').live('click', function() {
		$('#grinCotts').removeClass('hide');
		$('#notificationPanelId').addClass('hide');
		$('#firstImage').addClass('hide');
		$('#timerid').addClass('hide');
		$('#timerid1').addClass('hide');
		$('#slide35Container').addClass('hide');
		$('#problemContainer2').addClass('hide');
		$('#Slide32Container').addClass('hide');
		$('#ratingForwardContainer3').addClass('hide');
		for (var m = 0; m < pcount; m++) {
			var t1 = "#ratingContainer" + m;
			$(t1).addClass('hide');
		}

		$('#store').addClass('hide');
		$('#diagonAlley').addClass('hide');
		$('#tcos').addClass('hide');
		$('#gifClick').addClass('hide');
		$('#owlMessage').addClass('hide');
		$('#page1').addClass('hide');
		$('#page1').siblings().addClass('hide');
		$('#nameChangeDiv').addClass('hide');
		$('#problemContainer').addClass('hide');
		$('#afterProblemContainer').addClass('hide');
		$('#ProbelmListcontainer').addClass('hide');
		$('#keyContentContainer').addClass('hide');
		$('#problemContainer1').addClass('hide');
		$('#problemsIdentifiedContainerBack').addClass('hide');
		$('#commonRoom').addClass('hide');
		$('#sortingHatnextId').addClass('hide');
		$('#sortingHatnextId12').addClass('hide');
		$('#sortingHatnextId13').addClass('hide');
		$('#slide9').addClass('hide');
		$('#slide10').addClass('hide');
	});

	$('#Picture49Id').live('click', function() {
		$('#notificationPanelId').addClass('hide');
		$('#firstImage').addClass('hide');
		$('#timerid').addClass('hide');
		$('#timerid1').addClass('hide');
		$('#slide35Container').addClass('hide');
		$('#problemContainer2').addClass('hide');
		$('#Slide32Container').addClass('hide');
		$('#ratingForwardContainer3').addClass('hide');

		for (var m = 0; m < pcount; m++) {
			var t1 = "#ratingContainer" + m;
			$(t1).addClass('hide');
		}
		$('#store').removeClass('hide');
		$('#grinCotts').addClass('hide');
		$('#diagonAlley').addClass('hide');
		$('#tcos').addClass('hide');
		$('#page1').addClass('hide');
		$('#page1').siblings().addClass('hide');
		$('#gifClick').addClass('hide');
		$('#owlMessage').addClass('hide');
		$('#nameChangeDiv').addClass('hide');
		$('#problemContainer').addClass('hide');
		$('#afterProblemContainer').addClass('hide');
		$('#ProbelmListcontainer').addClass('hide');
		$('#keyContentContainer').addClass('hide');
		$('#problemContainer1').addClass('hide');
		$('#sortingHatnextId').addClass('hide');
		$('#sortingHatnextId12').addClass('hide');
		$('#sortingHatnextId13').addClass('hide');
		$('#problemsIdentifiedContainerBack').addClass('hide');
		$('#commonRoom').addClass('hide');
		$('#slide9').addClass('hide');
		$('#slide10').addClass('hide');
	});

	$('#tcosMenu').live('click', function() {
		$('#closeBook1').addClass('hide');
		$('#notificationPanelId').addClass('hide');
		$('#firstImage').addClass('hide');
		$('#timerid').addClass('hide');
		$('#timerid1').addClass('hide');
		$('#slide35Container').addClass('hide');
		$('#problemContainer2').addClass('hide');
		$('#Slide32Container').addClass('hide');
		$('#ratingForwardContainer3').addClass('hide');
		for (var m = 0; m < pcount; m++) {
			var t1 = "#ratingContainer" + m;
			$(t1).addClass('hide');
		}

		$('#tcos').removeClass('hide');
		$('#page1').removeClass('hide');
		$('#page1').siblings().addClass('hide');
		$('#diagonAlley').addClass('hide');
		$('#grinCotts').addClass('hide');
		$('#store').addClass('hide');
		$('#sortingHatnextId').addClass('hide');
		$('#sortingHatnextId12').addClass('hide');
		$('#sortingHatnextId13').addClass('hide');
		$('#nameChangeDiv').addClass('hide');
		$('#gifClick').addClass('hide');
		$('#owlMessage').addClass('hide');
		$('#problemContainer').addClass('hide');
		$('#afterProblemContainer').addClass('hide');
		$('#ProbelmListcontainer').addClass('hide');
		$('#keyContentContainer').addClass('hide');
		$('#problemContainer1').addClass('hide');
		$('#problemsIdentifiedContainerBack').addClass('hide');
		$('#commonRoom').addClass('hide');
		$('#slide9').addClass('hide');
		$('#slide10').addClass('hide');
	});

	$('#firstImage').live('click', function() {
		$('#notificationPanelId').addClass('hide');
		$('#nameChangeDiv').addClass('hide');
		$('#timerid').addClass('hide');
		$('#timerid1').addClass('hide');
		$('#firstImage').addClass('hide');
		$('#slide35Container').addClass('hide');
		$('#problemContainer2').addClass('hide');
		$('#Slide32Container').addClass('hide');
		$('#ratingForwardContainer3').addClass('hide');
		for (var m = 0; m < pcount; m++) {
			var t1 = "#ratingContainer" + m;
			$(t1).addClass('hide');
		}

		$('#tcos').addClass('hide');
		$('#page1').addClass('hide');
		$('#page1').siblings().addClass('hide');
		$('#diagonAlley').addClass('hide');
		$('#grinCotts').addClass('hide');
		$('#store').addClass('hide');
		$('#sortingHatnextId').addClass('hide');
		$('#sortingHatnextId12').addClass('hide');
		$('#sortingHatnextId13').addClass('hide');
		$('#gifClick').removeClass('hide');
		$('#owlMessage').addClass('hide');
		$('#problemContainer').addClass('hide');
		$('#afterProblemContainer').addClass('hide');
		$('#ProbelmListcontainer').addClass('hide');
		$('#keyContentContainer').addClass('hide');
		$('#problemContainer1').addClass('hide');
		$('#problemsIdentifiedContainerBack').addClass('hide');
		$('#commonRoom').addClass('hide');
		$('#slide9').addClass('hide');
		$('#slide10').addClass('hide');
	});

	$('.sliderContent img.bookpic15').live('click', function() {
		var imgid = this.classList[0];
		var strAray = imgid.split('_');
		var pageCount = strAray[1];
		var path = strAray[2];
		if (path == "n") {
			$('#page' + (Number(pageCount) + 1)).removeClass('hide');
			$('#page' + (Number(pageCount) + 1)).siblings().addClass('hide');
		} else if (path == "p") {
			$('#page' + (Number(pageCount) - 1)).removeClass('hide');
			$('#page' + (Number(pageCount) - 1)).siblings().addClass('hide');
		}
	});
	$('#closeBook').live('click', function() {
		$('#notificationPanelId').addClass('hide');
		$('#nameChangeDiv').addClass('hide');
		$('#firstImage').addClass('hide');
		$('#sortingHatnextId').addClass('hide');
		$('#sortingHatnextId12').addClass('hide');
		$('#sortingHatnextId13').addClass('hide');
		$('#timerid').addClass('hide');
		$('#timerid1').addClass('hide');
		$('#slide35Container').addClass('hide');
		$('#problemContainer2').addClass('hide');
		$('#Slide32Container').addClass('hide');
		$('#ratingForwardContainer3').addClass('hide');

		for (var m = 0; m < pcount; m++) {
			var t1 = "#ratingContainer" + m;
			$(t1).addClass('hide');
		}
		$('#tcos').addClass('hide');
		$('#page1').addClass('hide');
		$('#page1').siblings().addClass('hide');
		$('#diagonAlley').addClass('hide');
		$('#grinCotts').addClass('hide');
		$('#store').addClass('hide');
		$('#gifClick').removeClass('hide');
		$('#owlMessage').addClass('hide');
		$('#problemContainer').addClass('hide');
		$('#afterProblemContainer').addClass('hide');
		$('#ProbelmListcontainer').addClass('hide');
		$('#keyContentContainer').addClass('hide');
		$('#problemContainer1').addClass('hide');
		$('#problemsIdentifiedContainerBack').addClass('hide');
		$('#commonRoom').addClass('hide');
		$('#slide9').addClass('hide');
		$('#slide10').addClass('hide');
	});

	$('#closeBook1').live('click', function() {
		$('#notificationPanelId').addClass('hide');
		$('#nameChangeDiv').addClass('hide');
		$('#firstImage').addClass('hide');
		$('#timerid').addClass('hide');
		$('#timerid1').addClass('hide');
		$('#slide35Container').addClass('hide');
		$('#problemContainer2').addClass('hide');
		$('#Slide32Container').addClass('hide');
		$('#ratingForwardContainer3').addClass('hide');

		for (var m = 0; m < pcount; m++) {
			var t1 = "#ratingContainer" + m;
			$(t1).addClass('hide');
		}
		$('#tcos').addClass('hide');
		$('#page1').addClass('hide');
		$('#sortingHatnextId').addClass('hide');
		$('#sortingHatnextId12').addClass('hide');
		$('#sortingHatnextId13').addClass('hide');
		$('#page1').siblings().addClass('hide');
		$('#diagonAlley').addClass('hide');
		$('#helpMessage1').addClass('hide');
		$('#grinCotts').addClass('hide');
		$('#store').addClass('hide');
		$('#gifClick').removeClass('hide');
		$('#closeBook1').addClass('hide');
		$('#owlMessage').addClass('hide');
		$('#problemContainer').addClass('hide');
		$('#afterProblemContainer').addClass('hide');
		$('#ProbelmListcontainer').addClass('hide');
		$('#keyContentContainer').addClass('hide');
		$('#problemContainer1').addClass('hide');
		$('#problemsIdentifiedContainerBack').addClass('hide');
		$('#commonRoom').addClass('hide');
		$('#slide9').addClass('hide');
		$('#slide10').addClass('hide');
	});

	$('#gotoOwlMessage').live('click', function() {
		$('#notificationPanelId').addClass('hide');
		$('#nameChangeDiv').addClass('hide');
		$('#gifClick').addClass('hide');
		$('#owlMessage').removeClass('hide');
		$('#timerid').addClass('hide');
		$('#timerid1').addClass('hide');
		$('#firstImage').addClass('hide');
		$('#sortingHatnextId').addClass('hide');
		$('#sortingHatnextId12').addClass('hide');
		$('#sortingHatnextId13').addClass('hide');
		$('#commonRoom').addClass('hide');
		$('#closeBook1').removeClass('hide');
		$('#slide9').addClass('hide');
		$('#slide10').addClass('hide');
	});

	$('#editName').live('click', function() {
		$('#notificationPanelId').addClass('hide');
		$('#nameChangeDiv').removeClass('hide');
		$('#firstImage').addClass('hide');
		$('#txtname').val('');
		$('#timerid').addClass('hide');
		$('#timerid1').addClass('hide');
		$('#slide35Container').addClass('hide');
		$('#problemContainer2').addClass('hide');
		$('#Slide32Container').addClass('hide');
		$('#ratingForwardContainer3').addClass('hide');
		for (var m = 0; m < pcount; m++) {
			var t1 = "#ratingContainer" + m;
			$(t1).addClass('hide');
		}

		$('#tcos').addClass('hide');
		$('#sortingHatnextId').addClass('hide');
		$('#sortingHatnextId12').addClass('hide');
		$('#sortingHatnextId13').addClass('hide');
		$('#page1').addClass('hide');
		$('#page1').siblings().addClass('hide');
		$('#diagonAlley').addClass('hide');
		$('#grinCotts').addClass('hide');
		$('#store').addClass('hide');
		$('#gifClick').addClass('hide');
		$('#owlMessage').addClass('hide');
		$('#problemContainer').addClass('hide');
		$('#afterProblemContainer').addClass('hide');
		$('#ProbelmListcontainer').addClass('hide');
		$('#keyContentContainer').addClass('hide');
		$('#problemContainer1').addClass('hide');
		$('#problemsIdentifiedContainerBack').addClass('hide');
		$('#commonRoom').addClass('hide');
		$('#slide9').addClass('hide');
		$('#slide10').addClass('hide');
	});

	$('#theGH').live('click', function() {
		$('#closeBook1').removeClass('hide');
		$('#slide9').removeClass('hide');
		$('#notificationPanelId').addClass('hide');
		$('#nameChangeDiv').addClass('hide');
		$('#timerid').addClass('hide');
		$('#timerid1').addClass('hide');
		$('#slide35Container').addClass('hide');
		$('#problemContainer2').addClass('hide');
		$('#Slide32Container').addClass('hide');
		$('#ratingForwardContainer3').addClass('hide');
		for (var m = 0; m < pcount; m++) {
			var t1 = "#ratingContainer" + m;
			$(t1).addClass('hide');
		}
		$('#helpMessage1').addClass('hide');
		$('#diagonAlley').addClass('hide');
		$('#tcos').addClass('hide');
		$('#page1').addClass('hide');
		$('#page1').siblings().addClass('hide');
		$('#gifClick').addClass('hide');
		$('#owlMessage').addClass('hide');
		$('#grinCotts').addClass('hide');
		$('#store').addClass('hide');
		$('#sortingHatnextId').addClass('hide');
		$('#sortingHatnextId12').addClass('hide');
		$('#sortingHatnextId13').addClass('hide');
		$('#firstImage').addClass('hide');
		$('#problemContainer').addClass('hide');
		$('#afterProblemContainer').addClass('hide');
		$('#ProbelmListcontainer').addClass('hide');
		$('#keyContentContainer').addClass('hide');
		$('#problemContainer1').addClass('hide');
		$('#problemsIdentifiedContainerBack').addClass('hide');
		$('#commonRoom').addClass('hide');

	});

	$('#nextsilde').live('click', function() {
		$('#slide9').addClass('hide');
		$('#slide10').removeClass('hide');
		$('#timerid').addClass('hide');
		$('#timerid1').addClass('hide');
	});

	$('#prevslide').live('click', function() {
		$('#slide9').removeClass('hide');
		$('#slide10').addClass('hide');
		$('#timerid').addClass('hide');
		$('#timerid1').addClass('hide');
	});

	$('#cmnRoom').live('click', function() {
		$('#closeBook1').removeClass('hide');
		$('#commonRoom').removeClass('hide');
		$('#nameChangeDiv').addClass('hide');
		$('#sortingHatnextId').addClass('hide');
		$('#sortingHatnextId12').addClass('hide');
		$('#sortingHatnextId13').addClass('hide');
		$('#notificationPanelId').addClass('hide');
		$('#timerid').addClass('hide');
		$('#timerid1').addClass('hide');
		$('#slide35Container').addClass('hide');
		$('#problemContainer2').addClass('hide');
		$('#Slide32Container').addClass('hide');
		$('#ratingForwardContainer3').addClass('hide');
		for (var m = 0; m < pcount; m++) {
			var t1 = "#ratingContainer" + m;
			$(t1).addClass('hide');
		}

		$('#helpMessage1').addClass('hide');
		$('#diagonAlley').addClass('hide');
		$('#tcos').addClass('hide');
		$('#page1').addClass('hide');
		$('#page1').siblings().addClass('hide');
		$('#gifClick').addClass('hide');
		$('#owlMessage').addClass('hide');
		$('#grinCotts').addClass('hide');
		$('#store').addClass('hide');
		$('#firstImage').addClass('hide');
		$('#problemContainer').addClass('hide');
		$('#afterProblemContainer').addClass('hide');
		$('#ProbelmListcontainer').addClass('hide');
		$('#keyContentContainer').addClass('hide');
		$('#problemContainer1').addClass('hide');
		$('#problemsIdentifiedContainerBack').addClass('hide');
		$('#slide9').addClass('hide');
		$('#slide10').addClass('hide');
	});

	$('#hatsDivId img').live('click', function() {
			alert("Colro selected:- "+$(this).attr('alt'));
			var color = $(this).attr('alt');
			var hatcolorNo=0;
			if(color == "red"){
				hatcolorNo=84;
			}else if(color == "black"){
				hatcolorNo=85;
			}else if(color == "yellow"){
				hatcolorNo=86;
			}else if(color == "green"){
				hatcolorNo=87;
			}else if(color == "white"){
				hatcolorNo=88;
			}
			var fform = document.hatsForm;
			fform.action = "hatsNext.jsp?hatcolor="+hatcolorNo;
			document.forms["hatsForm"].method = "POST";
			fform.submit();
	});

	$('#postthought')
			.live(
					'click',
					function() {
						var message = $(this).siblings('textarea').val();
						var imageSrc = $(this).siblings('img')[0].src;
						$('#thoughtgiven').val('');
						$('#thoughtbox')
								.append(
										'<div class="left" style="width:20%;"><img src='+ imageSrc +' alt="" style="width: 100px; height: 100px;" class=""/></div><div class="left"style="width: 66%;"><span style="left: 25%;" class="commentData">'
												+ message
												+ '</span></div><div class="clear"></div>');
					});

	var ratingCount1 = new Array();
	var ratingCount2 = new Array();
	var ratingCount3 = new Array();
	$('.rating img').live('click', function() {
		var idR = $(this)[0].id;
		var countArray = idR.split('_');
		var count = countArray[2];
		var rCount = countArray[1];
		ratingCount1[rCount] = count;
		var i;
		for (i = count; i >= 1; i--) {
			$('#rate_' + rCount + "_" + i).attr('src', 'images/Picture30.png');
		}
		;
		var j;
		for (j = Number(count) + 1; j <= 5; j++) {
			$('#rate_' + rCount + "_" + j).attr('src', 'images/Picture31.png');
		}
	});

	$('.frerating img').live(
			'click',
			function() {
				var idR = $(this)[0].id;
				var countArray = idR.split('_');
				var count = countArray[2];
				var fCount = countArray[1];
				ratingCount2[fCount] = count;
				var i;
				for (i = count; i >= 1; i--) {
					$('#frerate_' + fCount + "_" + i).attr('src',
							'images/Picture30.png');
				}
				;
				var j;
				for (j = Number(count) + 1; j <= 5; j++) {
					$('#frerate_' + fCount + "_" + j).attr('src',
							'images/Picture31.png');
				}
			});

	$('.frurating img').live(
			'click',
			function() {
				var idR = $(this)[0].id;
				var countArray = idR.split('_');
				var count = countArray[2];
				var frCount = countArray[1];
				ratingCount3[frCount] = count;
				var i;
				for (i = count; i >= 1; i--) {
					$('#frurate_' + frCount + "_" + i).attr('src',
							'images/Picture30.png');
				}
				;
				var j;
				for (j = Number(count) + 1; j <= 5; j++) {
					$('#frurate_' + frCount + "_" + j).attr('src',
							'images/Picture31.png');
				}
			});

	var xmlhttp;
	function GetXmlHttpObject() {
		if (window.XMLHttpRequest) {
			// code for IE7+, Firefox, Chrome, Opera, Safari
			return new XMLHttpRequest();
		}
		if (window.ActiveXObject) {
			// code for IE6, IE5
			return new ActiveXObject("Microsoft.XMLHTTP");
		}
		return null;
	}

	function stateChanged() {
		if (xmlhttp.readyState == 4) {

		}
	}

	function ratingFunction(oButton) {

		var i;
		var rating1 = "", rating2 = "", rating3 = "";
		for (i = 0; i < ratingCount1.length; i++) {
			rating1 = rating1 + ratingCount1[i] + ",";
		}
		for (i = 0; i < ratingCount2.length; i++) {
			rating2 = rating2 + ratingCount2[i] + ",";
		}
		for (i = 0; i < ratingCount3.length; i++) {
			rating3 = rating3 + ratingCount3[i] + ",";
		}

		xmlhttp = GetXmlHttpObject();
		if (xmlhttp == null) {
			alert("Your browser does not support AJAX!");
			return;
		}

		var finalrating = rating1 + "s" + rating2 + "s" + rating3;

		var url = "ratingsubmit.jsp";
		url = url + "?imprating1=" + finalrating;
		xmlhttp.onreadystatechange = stateChanged;
		xmlhttp.open("GET", url, true);
		xmlhttp.send(null);

		location.reload();
	}
</script>


<script type="text/javascript">
	function validateChangeName() {
		if (document.nameChangeForm.editName.value() == "") {
			alert("Enter name ");
			document.nameChangeForm.editName.focus();
			return false;
		} else {
			return true;
		}
	}
	function validatepostgiven() {
		if (document.postgiven.postprob.value() == "") {
			alert("Enter text");
			document.postgiven.postprob.focus();
			return false;
		} else {
			return true;
		}
	}
</script>

<script type="text/javascript">
	function thoughtValidate() {
		
		if (document.thoughtform.thoughtgiveName.value() == "") {
			alert("Please enter your thought desciption");
			document.thoughtform.thoughtgiveName.focus();
			return false;
		} else {
			return true;
		}
	}
</script>

<script type="text/javascript">
	$('.animate1 .key').live('mouseover', function() {
		$(this).addClass('sampAnimation');
		$(this).addClass('succAnimation');
	});
	$('.animate1 .key').live('mouseout', function() {
		$(this).removeClass('sampAnimation');
		$(this).removeClass('succAnimation');
	});
	$('.animate2').live('mouseover', function() {
		$(this).addClass('sampAnimation2');
	});
	$('.animate2').live('mouseout', function() {
		$(this).removeClass('sampAnimation2');
	});
	$('.locked1').live('mouseover', function() {
		$(this).siblings('img').addClass('sampAnimation2');
	});
	$('.locked1').live('mouseout', function() {
		$(this).siblings('img').removeClass('sampAnimation2');
	});
	$('.locked2').live('mouseover', function() {
		$(this).siblings('img').addClass('sampAnimation2');
	});
	$('.locked2').live('mouseout', function() {
		$(this).siblings('img').removeClass('sampAnimation2');
	});
	$('.forhover').live('mouseover', function() {
		$(this).addClass('succAnimation');
	});
	$('.forhover').live('mouseout', function() {
		$(this).removeClass('succAnimation');
	});
</script>

<script type="text/javascript">
	function item1Function(oButton) {
		var fform = oButton.form;
		fform.action = "itemBuy.jsp?itemValue=item1,30";
		
		document.forms["item1Form"].method = "POST";
		fform.submit();
	}
	function item2Function(oButton) {
		var fform = oButton.form;
		fform.action = "itemBuy.jsp?itemValue=item2,30";
		
		document.forms["item2Form"].method = "POST";
		fform.submit();
	}
	function item3Function(oButton) {
		var fform = oButton.form;
		fform.action = "itemBuy.jsp?itemValue=item3,20";

		document.forms["item3Form"].method = "POST";
		fform.submit();
	}
	function item4Function(oButton) {
		var fform = oButton.form;
		fform.action = "itemBuy.jsp?itemValue=item4,40";
		
		document.forms["item4Form"].method = "POST";
		fform.submit();
	}
	function item5Function(oButton) {
		var fform = oButton.form;
		fform.action = "itemBuy.jsp?itemValue=item5,15";
		
		document.forms["item5Form"].method = "POST";
		fform.submit();
	}
	function item6Function(oButton) {
		var fform = oButton.form;
		fform.action = "itemBuy.jsp?itemValue=item6,50";
		
		document.forms["item6Form"].method = "POST";
		fform.submit();
	}
	function item7Function(oButton) {
		var fform = oButton.form;
		fform.action = "itemBuy.jsp?itemValue=item7,50";
		
		document.forms["item7Form"].method = "POST";
		fform.submit();
	}
	function item8Function(oButton) {
		var fform = oButton.form;
		fform.action = "itemBuy.jsp?itemValue=item8,50";
		
		document.forms["item8Form"].method = "POST";
		fform.submit();
	}
</script>



<style type='text/css'>
span {
	color: white;
}

.dropdown-menu li {
	color: black;
	font-family: segoe UI;
	font-size: 12px;
}

.dropdown-menu {
	position: absolute;
	top: 100%;
	left: 0;
	z-index: 1000;
	display: none;
	float: left;
	min-width: 100px;
	padding: 5px 5px;
	margin: 2px 0 0;
	list-style: none;
	background-color: #ddd;
	-webkit-border-radius: 6px;
	-moz-border-radius: 6px;
	border-radius: 6px;
	-webkit-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
}
</style>


</head>

<body onload="TimerCountDown()">


	<div id="container">
		<img src="images1/backgroundImage.png" class="imgbg" />
		<div class="homeHeader">
			<div class='left'>
				<img src='<%=path%>' alt="" />
			</div>
			<div class='left'>
				<img src="images1/Picture52.png" alt="" class='pic52' /> <span
					class='topMenu'><span id="dynamicName" class='fontfam bold'>Hello
						<%=name%>
				</span> <br /> <br /> <img src='<%=stone%>' alt="" class='topMenuItem11' /><span
					class="fontfam bold"
					style="padding-left: 42px; padding-top: 18px; position: absolute; width: 86px;">
						<%=mp%></span> </span><span class='topMenu' style='left: 256px;'> <img
					id="flyInId" src="images1/Picture7.png"
					style="z-index: 3333; cursor: pointer" alt="" class='pic7HomeMenu' /><br />
					<span class="fontfam bold"
					style="padding-left: 50px; z-index: 4949; width: 65px; position: absolute;">Fly
						In</span></span><span class='topMenu' style='left: 415px;'> <img
					src='<%=symbol%>' alt="" class='pic7HomeMenu' /><br /> <span
					class="fontfam bold"
					style="padding-left: 5px; position: absolute; width: 75px;">
						Home points</span> <br /> <span class="fontfam"
					style="position: absolute; padding-left: 20px;"><%=hp%></span>
				</span><span class='topMenu' style='left: 571px;'> <img
					src='<%=flag%>' alt="" class='pic7HomeMenu' /><br /> <span
					class="fontfam bold"
					style="padding-left: 5px; position: absolute; width: 75px;">
						Team points</span> <br /> <span class="fontfam"
					style="position: absolute; padding-left: 20px;"><%=tp%></span>
				</span><span class='topMenu' style='left: 680px;'><a> <img
						id="NotificationId" src="images1/Picture10.png" alt=""
						class='pic7HomeMenu' /></a><br /> <span class='fontfam bold'
					style='padding-left: 140px;'>Settings</span> <span
					class="fontfam bold"
					style="padding-left: 35px; position: absolute; top: 80%;">Notification</span>
				</span><span class='topMenu' style='left: 819px;'>
					<div class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#"> <img
							src="images1/Picture11.png" alt="" class="pic7HomeMenu"
							style="height: 115px; margin-top: 20px; width: 115px;"></a>
						<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
							<a id="editName">
								<li>Edit Name</li>
							</a>
							<hr>
							<a>
								<li><a href="logout.jsp">Logout</a></li>
							</a>
						</ul>
					</div>
				</span>
			</div>
			<div class='clear'></div>
		</div>
		<div>
			<div class='left'>
				<img src="images1/Picture51.png" alt="" class='pic51' />
				<div class='leftMenu'>
					<a id="theGH"><img src="images1/Picture2.png" alt=""
						class='leftMenuItem1' /> <br /> <span class="fontfam bold"
						style='padding-left: 20px;'>The Great Hall</span></a><br /> <br /> <a
						id="cmnRoom"><img src="images1/Picture3.png" alt=""
						class='leftMenuItem2' /> <br /> <span class="fontfam bold"
						style='padding-left: 20px;'>Common Room</span></a><br /> <br /> <a
						id='dalleyMenu'><img src="images1/Picture4.png" alt=""
						class='leftMenuItem3' /> <br /> <span class="fontfam bold"
						style='padding-left: 20px;'>Diagon Alley</span></a><br /> <br /> <a
						id='tcosMenu'><img src="images1/Picture5.png" alt=""
						class='leftMenuItem4' /> <br /> <span class="fontfam bold"
						style='padding-left: 1px;'>The Chamber of Secrets</span></a>
				</div>
			</div>


			<div id='slide9' class='left pptslide9 hide'>
				<span style="position: absolute; left: 45%; top: 6%;"
					class='fontfam bold'>The Great Hall</span> <img
					src="images1/Picture30.png" alt=""
					style="height: 100px; padding-left: 220px;" /> <br /> <img
					src="images1/Picture29.png" alt="" width="760px;" />
				<div>
					<img src="images1/Picture28.png" alt=""
						style="height: 77px; position: absolute; top: 24%; left: 27%;" />
					<img src="images1/Picture28.png" alt=""
						style="height: 77px; position: absolute; top: 24%; left: 68%;" />
				</div>
				<div style="margin-left: 135px; margin-top: 60px;">
					<img src="images1/Picture23.png" alt=""
						style="height: 250px; margin-right: 50px;" /> <img
						src="images1/Picture24.png" alt=""
						style="height: 250px; margin-left: 50px;" />
				</div>
				<div
					style="position: absolute; top: 41%; left: 22%; width: 160px; color: black; text-align: center; overflow: auto; height: 244px;">
					<i class="fontfam bold">Gryffindor</i> <br> <br> <img
						src="images1/Picture25.png" alt="" class="left"
						style="width: 70px;"> <img src="images1/Picture6.png" alt=""
						class="left" style="width: 75px; height: 80px;"> <i
						class="clear fontfam">House points:<%=totpoints[0]%>
					</i><br>
					<hr style="width: 140px; margin: 0;">
					<br>
					<%
						for (int k = 0; k < count; k++) {
					%>
					<i class="fontfam"><%=tname[k]%>:<%=tscore[k]%></i><br>
					<%
						k++;
						}
					%>


				</div>
				<div
					style="position: absolute; top: 41%; left: 63%; width: 160px; color: black; text-align: center; overflow: auto; height: 244px;">
					<i class='fontfam bold'>Ravenclaw</i> <br> <br> <img
						src="images1/Picture26.png" alt="" class="left"
						style="width: 70px;"> <img src="images1/Picture27.png"
						alt="" class="left"
						style="width: 55px; height: 72px; padding-left: 10px;"> <i
						class="clear fontfam">House points:<%=totpoints[3]%></i><br />
					<hr style="width: 140px; margin: 0;">
					<br />
					<%
						for (int k = 0; k < count3; k++) {
					%>
					<i class="fontfam"><%=tname3[k]%>:<%=tscore3[k]%></i><br>
					<%
						k++;
						}
					%>
				</div>
				<a id='nextsilde'> <img src="images1/Picture31.png" alt=""
					style="position: absolute; height: 45px; top: 65%; right: 0%;" />
				</a>
			</div>
			<div class='clear'></div>
			<div id='slide10' class='left pptslide9 hide'>
				<span style="position: absolute; left: 45%; top: 6%;"
					class='fontfam bold'>The Great Hall</span> <img
					src="images1/Picture30.png" alt=""
					style="height: 100px; padding-left: 220px;" /> <br /> <img
					src="images1/Picture29.png" alt="" width="760px;" />
				<div>
					<img src="images1/Picture28.png" alt=""
						style="height: 77px; position: absolute; top: 24%; left: 27%;" />
					<img src="images1/Picture28.png" alt=""
						style="height: 77px; position: absolute; top: 24%; left: 68%;" />
				</div>
				<div style="margin-left: 135px; margin-top: 60px;">
					<img src="images1/Picture32.png" alt=""
						style="height: 250px; margin-right: 50px;" /> <img
						src="images1/Picture36.png" alt=""
						style="height: 250px; margin-left: 50px;" />
				</div>
				<div
					style="position: absolute; top: 41%; left: 22%; width: 160px; color: black; text-align: center; overflow: auto; height: 244px;">
					<i class="fontfam bold">Hufflepuff</i> <br /> <br /> <img
						src="images1/Picture34.png" alt="" class="left"
						style="width: 70px;" /> <img src="images1/Picture35.png" alt=""
						class="left"
						style="width: 61px; height: 73px; padding-left: 10px;" /> <i
						class="clear fontfam">House points:<%=totpoints[2]%>
					</i><br />
					<hr style="width: 140px; margin: 0;">
					<br />
					<%
						for (int k = 0; k < count2; k++) {
					%>
					<i class="fontfam"><%=tname2[k]%>:<%=tscore2[k]%></i><br>
					<%
						k++;
						}
					%>
				</div>
				<div
					style="position: absolute; top: 41%; left: 63%; width: 160px; color: black; text-align: center; overflow: auto; height: 244px;">
					<i class='fontfam bold'>Slytherin</i> <br /> <br /> <img
						src="images1/Picture37.png" alt="" class="left"
						style="width: 70px;" /> <img src="images1/Picture38.png" alt=""
						class="left"
						style="width: 55px; height: 75px; padding-left: 10px;" /> <i
						class="clear fontfam">House points: <%=totpoints[1]%></i><br />
					<hr style="width: 140px; margin: 0;">
					<br />
					<%
						for (int k = 0; k < count1; k++) {
					%>
					<i class="fontfam"><%=tname1[k]%>:<%=tscore1[k]%></i><br>
					<%
						k++;
						}
					%>
				</div>
				<a id='prevslide'> <img src="images1/Picture33.png" alt=""
					style="position: absolute; height: 45px; top: 65%; left: 0%;" />
				</a>
			</div>
			<div class='clear'></div>
			<div id="commonRoom" class='left pptslide9 hide'>
				<img src="images1/Picture46.png"
					style="position: absolute; height: 100px; left: 42%; top: 1%;">
				<span style="position: absolute; left: 62%; top: 6%;"
					class="fontfam bold">Head<br />Minerva Mc Gonagal
				</span> <img src="images1/Picture30.png" alt=""
					style="height: 100px; padding-left: 220px;" /> <br /> <img
					src="images1/Picture45.png" alt=""
					style="height: 365px; position: absolute; left: 19%;" alt="" />
				<div
					style="position: absolute; left: 20%; top: 100%; width: 565px; height: 360px;">
					<div class='left'>
						<img src='<%=tpath[1]%>' alt=""
							style="height: 100px; margin-top: 20px;" /> <br /> <span
							style="position: absolute; top: 25%; left: 8%;"
							class="fontfam bold"><%=nname[1]%><br /> points:<%=nscore[1]%></span>
					</div>
					<div class="right">
						<img src='<%=tpath[2]%>' alt=""
							style="height: 100px; margin-top: 20px;" /> <br /> <span
							style="position: absolute; top: 25%; right: 8%;"
							class="fontfam bold"><%=nname[2]%><br /> points:<%=nscore[2]%></span>
					</div>
					<div class="clear"></div>
					<div style="text-align: center;">
						<img src='<%=tpath[0]%>' alt="" style="height: 100px;" /> <br />
						<span style="position: absolute; top: 51%; right: 44%;"
							class="fontfam bold"><%=nname[0]%><br /> points:<%=nscore[0]%></span>
					</div>
					<br />
					<div class='left'>
						<img src='<%=tpath[3]%>' alt=""
							style="height: 100px; margin-top: 20px;" /> <br /> <span
							style="position: absolute; bottom: 1%; left: 8%;"
							class="fontfam bold"><%=nname[3]%><br /> points:<%=nscore[3]%></span>
					</div>
					<div class="right">
						<img src='<%=tpath[4]%>' alt=""
							style="height: 100px; margin-top: 20px;" /> <br /> <span
							style="position: absolute; bottom: 1%; right: 7%;"
							class="fontfam bold"><%=nname[4]%><br /> points:<%=nscore[4]%></span>
					</div>
					<div class="clear"></div>
				</div>
			</div>
			<div class='clear'></div>
		</div>



		<div id="notificationPanelId" class='hide' style="position: absolute">
			<img src="images1/Picture68.png"
				style="width: 200px; height: 300px; margin-left: 700px; margin-top: -711px;" />

			<span
				style="position: absolute; left: 80%; margin-top: -55%; width: 165px; height: 260px; overflow: auto;">
				<ul>
					<li>Notification 1</li>
					<li>Notification 2</li>
					<li>Notification 3</li>
					<li>Notification 4</li>
					<li>Notification 5</li>
					<li>Notification 6</li>
					<li>Notification 7</li>
					<li>Notification 8</li>
					<li>Notification 9</li>
					<li>Notification 10</li>
					<li>Notification 11</li>
					<li>Notification 12</li>

				</ul> <span>
		</div>

		<div id="nameChangeDiv" class='hide'
			style="position: absolute; top: 30%; left: 28%; z-index: 100000">
			<form name="nameChangeForm" method="post" action="changeName.jsp">
				<b class='fontfam'>Change Name:</b> <input id="txtname" type="text"
					name="editName" style="margin-top: 10px;"> &nbsp;<input
					onclick="return validateChangeName()" id=" " type="submit"
					value="Change" class='btn btn-info'>
			</form>
		</div>

		<img id="closeBook1" class='hide' src="images1/Picture14.png" alt=""
			class=''
			style="z-index: 10000000; cursor: pointer; position: absolute; right: 32%; top: 24%; width: 12px; height: 13px; background: white;" />

		<div class='hide' id='timerid'
			style='z-index: 100000; cursor: pointer; position: absolute; right: 32%; top: 20%; width: 100px; height: 100px; border-width: 2px; border-color: red"'>
			<br /> <b><p style='position: absolute; color: blue;'>HH:MM:SS</p></b>
			<h4>
				<span id="countdown"
					style='position: absolute; color: floralwhite; margin-top: 10px;'></span>
			</h4>
		</div>

		<div id="problemContainer" class='hide'>

			<div>
				<div class="step1Image">
					<span class="fontfam span2 step1Image keyHeading"
						style="margin-left: 10px;">Goblin's Challenge</span> <a
						class="animate1"> <img id="gcKey" src="images/Picture1.png"
						alt="keyopen" class="key" />
					</a> <img src="images/Picture6.png" alt="step1" class="forhover" />
				</div>
				<div class="step2Image">
					<span class="fontfam span2 step1Image"
						style="top: 13px; margin-left: 13px;"
						class="HowgwartExpressHeading"><i><b>Hogwarts
								Express</b></i></span> <img src="images/Picture6.png" alt="step2"
						class="animate2"> <img src="images/Picture2.png"
						alt="locked" class="locked1" style="cursor: not-allowed;" /> <span
						class="fontfam span2 step1Image"
						style="margin-right: auto; top: 78%; left: 22%;"><i><b>Locked</b></i></span>
					<br />
				</div>
				<div class="step3Image">
					<span class="fontfam span2 step3Image"
						style="margin-right: auto; top: 4%; left: 15%;"><i><b>Sorting
								Hat</b></i></span> <img src="images/Picture6.png" alt="step3" class="animate2">
					<img src="images/Picture3.png" alt="locked" class="locked2"
						style="cursor: not-allowed;" /> <span
						class="fontfam span2 step3Image" style="left: 22%; top: 122px;"><i><b>Locked</b></i></span>
				</div>
			</div>
		</div>

		<div id="keyContentContainer" class='hide'>
			<img src="images/Picture9.png" alt="" class="pic9" /> <img
				src="images/Picture11.png" alt="" class="pic11" /> <span
				class="fontfam span3 pic11Content"
				style="margin-top: 33px; margin-left: 6px;">Hello,<br />I am
				Goblin, head of Gringotts. You need to identify problems for the
				statement given by your Head Master to get your vault key… HURRY UP
			</span> <a><img src="images/Picture12.png" alt="" class="pic12"
				id="keyContentNext" /></a>
		</div>

		<div id="ProbelmListcontainer" class='hide'>
			<img src="images/Picture19.png" alt="" class="pic19" />

			<div style="position: absolute; bottom: 5%; left: 23%;">
				<hr style="width: 435px;">
				<form name="postgiven" method="post" action="posting.jsp">
					<img src='<%=path%>' class="left"
						style="width: 100px; height: 100px;">
					<textarea id="txt1" name="postprob" rows="2" class="txtarea left"
						style="resize: none; width: 260px;"></textarea>
					<input id="btnPost" type="submit" value="Post"
						class="btn btn-success"
						style="position: absolute; width: 60px; height: 29px; margin-top: 8px; margin-left: 2px;">
				</form>
				<div class="clear"></div>
			</div>
			<div class="members">
				<div id="boxid" style="border: 0px solid green;">
					<table>
						<%
							for (int h = 0; h < pcount; h++) {
						%>

						<tr style="height: 100px;">
							<td class="left" style="width: 20%;"><img
								src='<%=imgpath[h]%>'
								style="position: absolute; width: 100px; height: 100px;" /></td>
							<td valign=center class="left"
								style="width: 66%; margin-left: 108px"><span><%=msg[h]%></span></td>

						</tr>
						<%
							}
						%>
					</table>
				</div>

			</div>

		</div>



		<div id="afterProblemContainer" class='hide'>
			<img src="images/Picture9.png" alt="" class="pic9" /> <img
				src="images/Picture11.png" alt="" class="pic11" /> <span
				class="fontfam span3 pic11Content" style="margin-top: 44px;">
				<b style='margin-left: -30px;'>CONGRATULATIONS!!!!!! </b><br /> <b><p>You
						got 50 Galleons and 100 Points.</p></b> Your vault key is unlocked. Buy it
				from Diagon Alley to check your Balance.

			</span> <a><img id="ProblemListContainerId1" src="images/Picture12.png"
				alt="" class="" style="position: absolute; top: 51%; left: 666px;" /></a>
		</div>

		<div id="problemContainer1" class='hide'>

			<div>
				<div class="step1Image">
					<span class="fontfam span2 step1Image keyHeading"
						style="margin-left: 10px;">Goblin's Challenge</span> <a
						class="animate1"> <img id="gcKey1" src="images/Picture1.png"
						alt="keyopen" class="key" />
					</a> <img src="images/Picture6.png" alt="step1" class="forhover" />
				</div>
				<div class="step2Image">
					<span class="fontfam span2 step1Image"
						style="top: 13px; margin-left: 13px;"><i><b>Hogwarts
								Express</b></i></span> <a class="animate1"><img id="HEclickId"
						src="images/Picture6.png" alt="step2" class="animate1 forhover">
						<img src="images/Picture2.png" alt="locked"
						class="keyunlock forhover" /></a> <br />
				</div>
				<div class="step3Image">
					<span class="fontfam span2 step3Image"
						style="margin-right: auto; top: 4%; left: 15%;"><i><b>Sorting
								Hat</b></i></span> <img src="images/Picture6.png" alt="step3" class="animate2">
					<img src="images/Picture3.png" alt="locked" class="locked2"
						style="cursor: not-allowed;" /> <span
						class="fontfam span2 step3Image" style="left: 22%; top: 122px;"><i><b>Locked</b></i></span>
				</div>
			</div>
		</div>

		<div id="problemsIdentifiedContainerBack" class='hide'>

			<img src="images/Picture19.png" alt="" class="pic19">
			<div class="members">
				<center>
					<h4>List of Problems Identified</h4>
				</center>
				<table>

					<%
						for (int g = 0; g < pcount; g++) {
					%>
					<tr>
						<td><%=(g + 1)%>. <%=msg[g]%></td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
		</div>

		<div id="helpMessage1" class='hide'>

			<img src="images/Picture23.png" alt="" class="pic23" /> <img
				src="images/Picture24.png" alt="" class="pic24" /> <span
				class="fontfam span3 pic24Content" style="margin-left: -176px;">
				Hello again, I am now a slave of Malfoy’s Family…Master said he
				would free me by gifting a pair of socks if you would rate the
				following problems and buy things… </span> <a><img
				src="images/Picture25.png" alt="" class="pic25"
				id="ratingContainer1Id" /> </a>
		</div>

		<div class='hide' id='timerid1'
			style='z-index: 100000; cursor: pointer; position: absolute; right: 32%; top: 20%; width: 100px; height: 100px; border-width: 2px; border-color: red"'>
			<br /> <b><p style='position: absolute'>HH:MM:SS</p></b>
			<h4>
				<span id="countdown1"
					style='position: absolute; color: floralwhite; margin-top: 10px;'></span>
			</h4>
		</div>
		<%
			for (int m = 0; m < pcount; m++) {
				String idfordiv = "ratingContainer" + m;
				String forwardId = "forwardContainer" + (m + 1);
				String submitId = "submitId" + m;

				String backwardId = "";
				String impRate1 = "rate_" + m + "_1";
				String impRate2 = "rate_" + m + "_2";
				String impRate3 = "rate_" + m + "_3";
				String impRate4 = "rate_" + m + "_4";
				String impRate5 = "rate_" + m + "_5";

				String freRate1 = "frerate_" + m + "_1";
				String freRate2 = "frerate_" + m + "_2";
				String freRate3 = "frerate_" + m + "_3";
				String freRate4 = "frerate_" + m + "_4";
				String freRate5 = "frerate_" + m + "_5";

				String fruRate1 = "frurate_" + m + "_1";
				String fruRate2 = "frurate_" + m + "_2";
				String fruRate3 = "frurate_" + m + "_3";
				String fruRate4 = "frurate_" + m + "_4";
				String fruRate5 = "frurate_" + m + "_5";

				if (m == 0) {
					backwardId = "backwordContainer" + m;

				} else {
					backwardId = "backwordContainer" + (m - 1);

				}
		%>

		<div id='<%=idfordiv%>' class='hide'>
			<img src="images/Picture26.png" alt="" class="pic26"> <a
				class='forwardAnchor'><img src="images1/Picture31.png"
				alt="Forwar Image" class="Pic26Forward" id="<%=forwardId%>" /></a> <a><img
				src="images1/Picture33.png" alt="" class="ratingForwardBack"
				id="<%=backwardId%>" /></a>
			<div class="pic26Content">
				<center>
					<b class="fontfam"><%=msg[m]%></b>
				</center>
				<br /> <br />
				<div class="left fontfam"
					style="width: 45%; text-align: center; margin-top: 6px;">
					Important</div>
				<div class="left rating" style="width: 50%;">
					<img id="<%=impRate1%>" src="images/Picture31.png" alt="rating1"
						class="ratingimg" /> <img id="<%=impRate2%>"
						src="images/Picture31.png" alt="rating2" class="ratingimg" /> <img
						id="<%=impRate3%>" src="images/Picture31.png" alt="rating3"
						class="ratingimg" /> <img id="<%=impRate4%>"
						src="images/Picture31.png" alt="rating4" class="ratingimg" /> <img
						id="<%=impRate5%>" src="images/Picture31.png" alt="rating5"
						class="ratingimg" />
				</div>
				<div class="clear"></div>
				<br /> <br />
				<div class="left fontfam"
					style="width: 45%; text-align: center; margin-top: 6px;">
					Frequency</div>
				<div class="left frerating" style="width: 50%;">
					<img id="<%=freRate1%>" src="images/Picture31.png" alt="rating1"
						class="ratingimg" /> <img id="<%=freRate2%>"
						src="images/Picture31.png" alt="rating2" class="ratingimg" /> <img
						id="<%=freRate3%>" src="images/Picture31.png" alt="rating3"
						class="ratingimg" /> <img id="<%=freRate4%>"
						src="images/Picture31.png" alt="rating4" class="ratingimg" /> <img
						id="<%=freRate5%>" src="images/Picture31.png" alt="rating5"
						class="ratingimg" />
				</div>
				<div class="clear"></div>
				<br /> <br />
				<div class="left fontfam"
					style="width: 45%; text-align: center; margin-top: 6px;">
					Frustration</div>
				<div class="left frurating" style="width: 50%;">
					<img id="<%=fruRate1%>" src="images/Picture31.png" alt="rating1"
						class="ratingimg" /> <img id="<%=fruRate2%>"
						src="images/Picture31.png" alt="rating2" class="ratingimg" /> <img
						id="<%=fruRate3%>" src="images/Picture31.png" alt="rating3"
						class="ratingimg" /> <img id="<%=fruRate4%>"
						src="images/Picture31.png" alt="rating4" class="ratingimg" /> <img
						id="<%=fruRate5%>" src="images/Picture31.png" alt="rating5"
						class="ratingimg" />
				</div>
				<div class="clear"></div>
				<div id="<%=submitId%>" class='hide'>
					<input
						style="position: absolute; margin-left: 82%; margin-top: 20%;"
						type="submit" value="Submit Rating" class="btn btn-success"
						onclick="ratingFunction(this)" />
				</div>
				<br />

			</div>
		</div>
		<%
			}
		%>



		<div id="Slide29Container" class='hide'>
			<img src="images/Picture23.png" alt="" class="pic23"
				style="top: 61%;" /> <img src="images/Picture24.png" alt=""
				class="pic24" /> <span class="fontfam span3 pic24Content"
				style="margin-left: -172px;"> Hello again, I am now a slave
				of Malfoy’s Family…Master said he would free me by gifting a pair of
				socks if you would rate the following problems and buy things… </span> <a>
				<img src="images/Picture25.png" alt=""
				style="position: absolute; top: 41%; left: 36.5%; width: 40px; height: 35px;" />
			</a> <img src="images/Picture34.png" alt="" class=""
				style="position: absolute; left: 21%; top: 46%;" /> <span
				class="fontfam pic34Content"> On clicking here, it prompts to
				Diagon Alley where he can buy above mentioned items. After buying,
				it prompts to next slide </span>
		</div>


		<div id="Slide30Container" class='hide'>
			<a><img src="images/Picture12.png" alt="" class=""
				style="position: absolute; margin-left: 705px; margin-top: -345px; z-index: 100;" /></a>
			<img src="images/Picture23.png" alt="" class=""
				style="position: absolute; width: 170px; height: 169px; margin-left: 725px; margin-top: -229px;" />
			<img src="images/Picture14.png" alt="" class=""
				style="position: absolute; width: 114px; height: 127px; margin-left: 200px; margin-top: -250px;" />
			<img src="images/Picture35.png" alt="" class=""
				style="position: absolute; width: 257px; height: 180px; margin-left: 254px; margin-top: -427px;" />
			<img src="images/Picture36.png" alt="" class=""
				style="position: absolute; width: 218px; height: 251px; margin-left: 571px; margin-top: -416px;" />
			<span class="fontfam span2 pic35Content"
				style="margin-top: 84px; margin-left: -14px;"> By telling me
				way to get my ticket to hogwarts express </span> <span
				class="fontfam span2 pic36Content"
				style="margin-left: -33px; margin-top: 100px;"> Thank
				You!!Dobby got its pair of socks..How can Dobby help you SIR? </span>
		</div>

		<div id="Slide31Container" class='hide'>
			<img src="images/Picture23.png" alt="" class=""
				style="position: absolute; width: 166px; height: 194px; margin-left: 745px; margin-top: -223px;" />
			<img src="images/Picture24.png" alt="" class=""
				style="position: absolute; margin-left: 461px; margin-top: -450px; width: 300px; height: 302px;" />
			<span class="fontfam span3 pic24Content" style="top: 30%;"> Go
				to Diagon Alley to buy <br />your ticket to Hogwarts <br />
				Express
			</span> <a> <img src="images/Picture25.png" alt="" class=""
				style="position: absolute; margin-left: 564px; margin-top: -346px;" /></a>
			<img src="images/Picture34.png" alt="" class=""
				style="position: absolute; margin-left: 367px; margin-top: -317px;" />
			<span class="fontfam pic34Content" style="margin-left: 100px;">
				On clicking here, it prompts to Diagon Alley where he can buy
				ticket. After buying, it prompts to next slide </span>
		</div>

		<div id="Slide32Container1" class='hide' style="position: absolute">
			<img src="images/Picture39.png" alt="background" width="100%;"
				style="width: 765px; height: 449px; margin-left: 176px; margin-top: -500px;" />
		</div>

		<div id="Slide32Container" class='hide'>
			<img src="images1/Picture69.gif" alt="background" width="100%;"
				style="width: 765px; height: 449px; margin-left: 176px; margin-top: -500px;" />
			<a><img id="Picture70Id" src="images1/Picture70.png"
				alt="background" width="100%;"
				style="position: absolute; width: 114px; height: 62px; margin-left: -231px; margin-top: -79px;" /></a>
		</div>


		<div id="problemContainer2" class='hide'>
			<div>
				<div class="step1Image">
					<span class="fontfam span2 step1Image keyHeading"
						style="margin-left: 10px;">Goblin's Challenge</span> <a
						class="animate1"> <img id="gcKey11" src="images/Picture1.png"
						alt="keyopen" class="key" />
					</a> <img src="images/Picture6.png" alt="step1" class="forhover" />
				</div>
				<div class="step2Image" class='' id='HogExpId'>
					<span class="fontfam span2 step1Image"
						style="top: 13px; margin-left: 13px;"><i><b>Hogwarts
								Express</b></i></span> <a class="animate1"><img id="HogExpId11"
						src="images/Picture6.png" alt="step2" class="animate1 forhover">
						<img src="images/Picture2.png" alt="locked"
						class="keyunlock forhover" /></a> <br />
				</div>
				<div class="step3Image" id='hatsortId'>
					<span class="fontfam span2 step3Image"
						style="margin-right: auto; top: 4%; left: 15%;"><i><b>Sorting
								Hat</b></i></span> <a><img src="images/Picture6.png" alt="step3"
						class="animate1 forhover"> <img src="images/Picture3.png"
						alt="locked" class="keyunlock forhover" style="cursor: pointer;" /></a>
				</div>
			</div>
		</div>


		<div id="sortingHatnextId" class="hide">

			<span id="customertitleId"
				style="position: absolute; margin-left: 28%; margin-top: -36%;">
				Customer Title</span>
			<textarea rows="2" cols="25" readonly="readonly"
				style="position: absolute; margin-left: 41%; margin-top: -37%; resize: none;"><%=customerTitle%></textarea>

			<span id="problemDescriptionId"
				style="position: absolute; margin-left: 28%; margin-top: -31%;">Problem
				Description</span>
			<textarea rows="2" cols="250" readonly="readonly"
				style="position: absolute; margin-left: 41%; margin-top: -32%; resize: none;"><%=topProblemDescription%></textarea>

			<img src="images1/Picture79.gif"
				style="position: absolute; margin-left: 61%; margin-top: -37%; width: 100px; height: 100px;" />

			<span id="expressId"
				style="position: absolute; margin-left: 47%; margin-top: -28%;">Express
				Thoughts on Problem</span> <img src="images/Picture19.png" alt=""
				class="pic191" />
			<div id="thoughtbox" style="border: 0px solid green;">
				<div>
					<div id="boxid1"
						style="margin-top: -25%; margin-left: 41%; position: absolute; overflow: auto; width: 430px; height: 227px;">
						<table>
							<%
								Statement ssst = con.createStatement();
								ResultSet rsst = null;
								int member = 0;
								String memberPhoto = "";
								String memberPhotoPath = "";
								Statement stmt = con.createStatement();
								ResultSet rset = stmt.executeQuery("select * from sixthinking");
								while (rset.next()) {
									member = rset.getInt("memberID");
									rsst = ssst
											.executeQuery("select memberphoto from teammember where memberID="
													+ member + "");
									if (rsst.next()) {
										memberPhoto = rsst.getString("memberphoto");
									}
									memberPhotoPath = "images1/" + memberPhoto + ".png";
							%>

							<tr style="height: 50px;">
								<td class="left" style="width: 20%;"><img
									src='<%=memberPhotoPath%>'
									style="position: absolute; width: 77px; height: 65px;" /></td>

								<td valign=center class="left"
									style="width: 66%; margin-left: 108px"><span><%=rset.getString("thoughtDescription")%></span></td>
							</tr>
							<%
								}
							%>
						</table>
					</div>
				</div>
				<div class="clear"></div>
			</div>

			<div>
				<form name="thoughtform" action="sixthinking.jsp" method="post">
					<img src='<%=path%>' class="left"
						style="width: 77px; height: 65px; position: absolute; margin-left: 41%; margin-top: -72px;">
					<input type="hidden" value="<%=topProblemId%>"
						name="topRatedProblemName" />
					<textarea id="thoughtgiven" name="thoughtgiveName" rows="2"
						cols="250" class="txtarea left"
						style="resize: none; width: 260px; position: absolute; margin-left: 48%; margin-top: -80px;"></textarea>
					<input onclick="thoughtValidate()" id="btnPost" type="submit"
						value="Post" class="btn btn-success"
						style="position: absolute; margin-top: -70px; margin-left: 70%; z-index: 20;">
				</form>
				<div class="clear"></div>
			</div>


			<img src="images1/Picture83.png"
				style="position: absolute; width: 85px; height: 80px; margin-left: 14%; margin-top: -31%;">

			<img src='<%=path%>'
				style="position: absolute; width: 85px; height: 80px; margin-left: 14%; margin-top: -25%;">

			<span style="position: absolute; margin-top: -26%; margin-left: 26%;">
				Time Expires In</span> <img src="images1/Picture45.png"
				style="position: absolute; width: 128px; height: 52px; margin-left: 25%; margin-top: -24%;">

			<b><p
					style='position: absolute; margin-left: 27%; margin-top: -24%; color: burlywood;'>HH:MM:SS</p></b>
			<h4>
				<span id="countdown2"
					style='position: absolute; color: floralwhite; margin-left: 27%; margin-top: -22%;'></span>
			</h4>

			<span style="position: absolute; margin-top: -19%; margin-left: 15%;">Select
				Hat for Team Members</span>
			<div id="hatsDivId">
				<form name="hatsForm" method="post" action="hatsNext.jsp">
					<img id="red" class="imgclass" src="images1/Picture84.png"
						alt="red"
						style="position: absolute; cursor: pointer; width: 85px; height: 80px; margin-left: 14%; margin-top: -17%;">

					<img id="black" class="imgclass" src="images1/Picture85.png"
						alt="black"
						style="position: absolute; cursor: pointer; width: 85px; height: 80px; margin-left: 34%; margin-top: -20%;">

					<img id="yellow" class="imgclass" src="images1/Picture86.png"
						alt="yellow"
						style="position: absolute; cursor: pointer; width: 85px; height: 80px; margin-left: 24%; margin-top: -15%;">

					<img id="green" class="imgclass" src="images1/Picture87.png"
						alt="green"
						style="position: absolute; cursor: pointer; width: 85px; height: 80px; margin-left: 15%; margin-top: -10%;">

					<img id="white" class="imgclass" src="images1/Picture88.png"
						alt="white"
						style="position: absolute; cursor: pointer; width: 85px; height: 80px; margin-left: 32%; margin-top: -10%;">
				</form>
			</div>
			<span
				style="position: absolute; margin-top: -44px; margin-left: 17%;">You
				got a Request to Change hat to White.</span>
		</div>


		<div id="sortingHatnextId12" class="hide">

			<span id="customertitleId12"
				style="position: absolute; margin-left: 28%; margin-top: -36%;">
				Customer Title</span>
			<textarea rows="2" cols="25" readonly="readonly"
				style="position: absolute; margin-left: 41%; margin-top: -37%; resize: none;"><%=customerTitle%></textarea>

			<span id="problemDescriptionId12"
				style="position: absolute; margin-left: 28%; margin-top: -31%;">Problem
				Description</span>
			<textarea rows="2" cols="250" readonly="readonly"
				style="position: absolute; margin-left: 41%; margin-top: -32%; resize: none;"><%=topProblemDescription%></textarea>

			<img src="images1/Picture79.gif"
				style="position: absolute; margin-left: 61%; margin-top: -37%; width: 100px; height: 100px;" />

			<span id="expressId12"
				style="position: absolute; margin-left: 47%; margin-top: -28%;">Express
				Thoughts on Problem</span> <img src="images/Picture19.png" alt=""
				class="pic191" />
			<div id="thoughtbox12" style="border: 0px solid green;">
				<div>
					<div id="boxid112"
						style="margin-top: -25%; margin-left: 41%; position: absolute; overflow: auto; width: 430px; height: 227px;">
						<table>
							<%
								Statement ssst1 = con.createStatement();
								ResultSet rsst1 = null;
								int member1 = 0;
								String memberPhoto1 = "";
								String memberPhotoPath1 = "";

								Statement stmt123 = con.createStatement();
								ResultSet rset123 = stmt123
										.executeQuery("select * from sixthinking");
								while (rset123.next()) {
									member1 = rset123.getInt("memberID");
									rsst1 = ssst1
											.executeQuery("select memberphoto from teammember where memberID="
													+ member1 + "");
									if (rsst1.next()) {
										memberPhoto1 = rsst1.getString("memberphoto");
									}
									memberPhotoPath1 = "images1/" + memberPhoto1 + ".png";
							%>

							<tr style="height: 50px;">
								<td class="left" style="width: 20%;"><img
									src='<%=memberPhotoPath1%>'
									style="position: absolute; width: 77px; height: 65px;" /></td>

								<td valign=center class="left"
									style="width: 66%; margin-left: 108px"><span><%=rset123.getString("thoughtDescription")%></span></td>
							</tr>
							<%
								}
							%>
						</table>
					</div>
				</div>
				<div class="clear"></div>
			</div>

			<div>
				<form name="thoughtform12" action="sixthinking.jsp" method="post">
					<img src='<%=path%>' class="left"
						style="width: 77px; height: 65px; position: absolute; margin-left: 41%; margin-top: -72px;">
					<input type="hidden" value="<%=topProblemId%>"
						name="topRatedProblemName" />
					<textarea name="thoughtgiveName" rows="2" readonly="readonly"
						cols="250" class="txtarea left"
						style="resize: none; width: 260px; position: absolute; margin-left: 48%; margin-top: -80px;"></textarea>
					<input onclick="thoughtValidate()" id="btnPost12" type="submit"
						value="Post" class="btn btn-success" disabled="disabled"
						style="position: absolute; margin-top: -70px; margin-left: 70%; z-index: 20;">
				</form>
				<div class="clear"></div>
			</div>


			<img src='<%=hatColorPath%>'
				style="position: absolute; width: 85px; height: 80px; margin-left: 14%; margin-top: -31%;">

			<img src='<%=path%>'
				style="position: absolute; width: 85px; height: 80px; margin-left: 14%; margin-top: -25%;">

			<span style="position: absolute; margin-top: -26%; margin-left: 26%;">
				Time Expires In</span> <img src="images1/Picture45.png"
				style="position: absolute; width: 128px; height: 52px; margin-left: 25%; margin-top: -24%;">

			<b><p
					style='position: absolute; margin-left: 27%; margin-top: -24%; color: burlywood;'>HH:MM:SS</p></b>
			<h4>
				<span id="countdown31"
					style='position: absolute; color: floralwhite; margin-left: 27%; margin-top: -22%;'>00:00:00</span>
			</h4>

		</div>



		<div id="sortingHatnextId13" class="hide">

			<span id="customertitleId13"
				style="position: absolute; margin-left: 28%; margin-top: -36%;">
				Customer Title</span>
			<textarea rows="2" cols="25" readonly="readonly"
				style="position: absolute; margin-left: 41%; margin-top: -37%; resize: none;"><%=customerTitle%></textarea>

			<span id="problemDescriptionId13"
				style="position: absolute; margin-left: 28%; margin-top: -31%;">Problem
				Description</span>
			<textarea rows="2" cols="250" readonly="readonly"
				style="position: absolute; margin-left: 41%; margin-top: -32%; resize: none;"><%=topProblemDescription%></textarea>

			<img src="images1/Picture79.gif"
				style="position: absolute; margin-left: 61%; margin-top: -37%; width: 100px; height: 100px;" />

			<span id="expressId13"
				style="position: absolute; margin-left: 47%; margin-top: -28%;">Express
				Thoughts on Problem</span> <img src="images/Picture19.png" alt=""
				class="pic191" />
			<div id="thoughtbox13" style="border: 0px solid green;">
				<div>
					<div id="boxid113"
						style="margin-top: -25%; margin-left: 41%; position: absolute; overflow: auto; width: 430px; height: 227px;">
						<table>
							<%
								Statement ssst3 = con.createStatement();
								ResultSet rsst3 = null;
								int member3 = 0;
								String memberPhoto3 = "";
								String memberPhotoPath3 = "";

								Statement stmt1233 = con.createStatement();
								ResultSet rset1233 = stmt1233
										.executeQuery("select * from sixthinking");
								while (rset1233.next()) {
									member3 = rset1233.getInt("memberID");
									rsst3 = ssst3
											.executeQuery("select memberphoto from teammember where memberID="
													+ member3 + "");
									if (rsst3.next()) {
										memberPhoto3 = rsst3.getString("memberphoto");
									}
									memberPhotoPath3 = "images1/" + memberPhoto3 + ".png";
							%>

							<tr style="height: 50px;">
								<td class="left" style="width: 20%;"><img
									src='<%=memberPhotoPath3%>'
									style="position: absolute; width: 77px; height: 65px;" /></td>

								<td valign=center class="left"
									style="width: 66%; margin-left: 108px"><span><%=rset1233.getString("thoughtDescription")%></span></td>
							</tr>
							<%
								}
							%>
						</table>
					</div>
				</div>
				<div class="clear"></div>
			</div>

			<div>
				<form name="thoughtform13" action="sixthinking.jsp" method="post">
					<img src='<%=path%>' class="left"
						style="width: 77px; height: 65px; position: absolute; margin-left: 41%; margin-top: -72px;">
					<input type="hidden" value="<%=topProblemId%>"
						name="topRatedProblemName" />
					<textarea name="thoughtgiveName" rows="2" cols="250"
						class="txtarea left"
						style="resize: none; width: 260px; position: absolute; margin-left: 48%; margin-top: -80px;"></textarea>
					<input onclick="thoughtValidate()" id="btnPost13" type="submit"
						value="Post" class="btn btn-success"
						style="position: absolute; margin-top: -70px; margin-left: 70%; z-index: 20;">
				</form>
				<div class="clear"></div>
			</div>

			<img src='<%=hatColorPath%>'
				style="position: absolute; width: 85px; height: 80px; margin-left: 14%; margin-top: -31%;">

			<img src='<%=path%>'
				style="position: absolute; width: 85px; height: 80px; margin-left: 14%; margin-top: -25%;">

			<span style="position: absolute; margin-top: -26%; margin-left: 26%;">
				Time Expires In</span> <img src="images1/Picture45.png"
				style="position: absolute; width: 128px; height: 52px; margin-left: 25%; margin-top: -24%;">

			<b><p
					style='position: absolute; margin-left: 27%; margin-top: -24%; color: burlywood;'>HH:MM:SS</p></b>
			<h4>
				<span id="countdown3"
					style='position: absolute; color: floralwhite; margin-left: 27%; margin-top: -22%;'></span>
			</h4>

		</div>


		<div id="slide35Container" class='hide' style="position: absolute">
			<div>
				<a><img id="problemsListId" src="images1/Picture16.png"
					style="position: absolute; width: 42px; height: 43px; margin-left: 193px; margin-top: -461px;" /></a>
				<img src="images1/Picture104.png" alt="" class=""
					style="width: 765px; height: 450px; margin-left: 176px; margin-top: -500px;" />
				<div style="margin-left: 200px; margin-top: -472px;">
					<span class="pageImage34"><br />
						<h4>
							<center>Top Rated Problems</center>
						</h4> </span>
					<table>
						<%
							for (int q = 0; q < pcount; q++) {
						%>
						<tr>
							<td><%=(q + 1)%>. <%=topProblems[q]%></td>
						</tr>
						<%
							}
						%>
					</table>
				</div>
			</div>
		</div>

		<div id="CongratesoverId" class='hide'>
			<img src="images1/Picture90.png" alt="" class="pic92"
				style="position: absolute; margin-left: -203px; left: 32%; top: 63%; max-width: none; width: 187px; height: 189px;" />
			<img src="images1/Picture92.png" alt="" class=""
				style='position: absolute; top: 139px; left: 24%; max-width: none; width: 471px; height: 268px;' />
			<span class="fontfam span3 pic11Content"
				style="position: absolute; left: 34%; line-height: 20px;">CONGRATULATIONS
				!!!<br /> You have done a great Job… For successfully completing
				all tasks, you receive 200 Galleons and 400 points

			</span>
		</div>


		<div id="sortHatoverId" class='hide'>
			<img src="images1/Picture90.png" alt="" class="pic92"
				style="position: absolute; margin-left: -203px; left: 32%; top: 60%; max-width: none; width: 201px; height: 213px;" />
			<img src="images1/Picture92.png" alt="" class=""
				style='position: absolute; top: 141px; left: 25%; max-width: none; width: 449px; height: 258px;' />
			<img src="images1/Picture93.png" alt="" class=""
				style="position: absolute; top: 23%; left: 50%; width: 88px; height: 100px;" />
			<span class="fontfam span3 pic11Content"
				style="position: absolute; left: 34%;">Gryffindor Receives
				House Cup… CONGRATULATIONS!!; </span>
		</div>

		<div id="notcompleteContainer" class='hide'>
			<img src="images1/Picture94.png" alt="" class="pic92"
				style="position: absolute; display: inline; margin-left: 60%; margin-bottom: -7%; max-width: none; width: 182px; height: 189px; top: 64%;" />

			<img src="images1/Picture95.png" alt="" class="pic11 "
				style="display: inline; margin-left: 3%; margin-top: -2%;" /> <span
				style="position: absolute; top: 29%; left: 421px;"> Hello,
				Didn’t complete task in time?? Don’t worry <br />when Hagrid is
				here… Go and get Felics potion <br />from Diagon Alley.. <br /> <br />
				<br /> Ohh!! I should have not said that

			</span>
		</div>


		<div id="deductpointsContainer" class='hide'>
			<img src="images1/Picture96.png" alt="" class="pic92"
				style="position: absolute; margin-left: 10px; display: inline; top: 64%; left: 16%; max-width: none; width: 180px; height: 187px;" />
			<img src="images1/Picture92.png" alt="" class="anim1"
				style="position: absolute; top: 24%; left: 308px; height: 270px; width: 500px; display: inline; max-width: none;" />

			<span class="fontfam span3 pic11Content "
				style="position: absolute; margin-left: 6%; margin-top: 1%; display: inline;">I'm
				Lord Voldemort,<br /> Didn’t complete task in time?? Hahahahaa.. <br />

				50 points deducted..!!

			</span>
		</div>

		<div id="diagonAlley" class="hide">
			<div class="sliderContent">
				<a><img src="images1/Picture48.png" class="daPicture48"
					id="Picture48Id" /></a> <a><img src="images1/Picture49.png"
					class="daPicture49" id="Picture49Id" /></a>
			</div>
		</div>

		<div id="grinCotts" class='hide'>
			<img src="images1/Picture54.png" class='gcPicture54' /> <span
				style='position: absolute; width: 141px; height: 215px; margin-left: 35%; margin-top: -19%;'>My
				Balanace</span>
			<hr
				style="position: absolute; width: 96px; height: 215px; margin-left: 35%; margin-top: -17%;" />
			<span
				style="position: absolute; width: 141px; height: 215px; margin-left: 36%; margin-top: -16%; font-weight: bold; font-size: 30px; color: chartreuse;"><%=mybalance%></span>
		</div>

		<div id="store" class='hide'>
			<a href="#" data-toggle="tooltip" style=''
				title="Olivanders wand must be bought to enter into third phase">
				<img src="images1/Picture56.png" class='storePicture56' />
			</a>
			<form action="itemBuy.jsp" method="post" name="item1Form">
				<input type="hidden" id="hiddenItem1ID" name="hiddenItem1" /> <input
					type="submit" value="BUY" class='storebuy1' style="width: 100px"
					onclick="item1Function(this)" />
			</form>
			<img src="images1/Picture64.png" class='storebuy11' /> <span
				style="position: absolute; top: 45.5%; left: 25.5%;"
				class="fontfam bold">$30</span> <a href="#" data-toggle="tooltip"
				style='animation: true'
				title="This is ticket to get into hogwarts express"> <img
				src="images1/Picture57.png" class='storePicture57' /></a>
			<form action="itemBuy.jsp" method="post" name="item2Form">
				<input type="submit" value="BUY" class='storebuy2'
					style="width: 100px" onclick="item2Function(this)" />
			</form>
			<img src="images1/Picture64.png" class='storebuy21' /> <span
				style="position: absolute; top: 45.5%; left: 39.9%;"
				class="fontfam bold">$30</span> <a href="#" data-toggle="tooltip"
				style='animation: true'
				title="Felics potion is used to extend the  time for a task"> <img
				src="images1/Picture58.png" class='storePicture58' /></a>
			<form action="itemBuy.jsp" method="post" name="item3Form">
				<input type="submit" value="BUY" class='storebuy3'
					style="width: 100px" onclick="item3Function(this)" />
			</form>
			<img src="images1/Picture64.png" class='storebuy31' /> <span
				style="position: absolute; top: 45.5%; left: 54.5%;"
				class="fontfam bold">$20</span> <a href="#" data-toggle="tooltip"
				style='animation: true'
				title="Robes must be bought to enter into  Hogwarts"><img
				src="images1/Picture59.png" class='storePicture59' /></a>
			<form action="itemBuy.jsp" method="post" name="item4Form">
				<input type="submit" value="BUY" class='storebuy4'
					style="width: 100px" onclick="item4Function(this)" />
			</form>
			<img src="images1/Picture64.png" class='storebuy41' /> <span
				style="position: absolute; top: 45.5%; left: 67.5%;"
				class="fontfam bold">$40</span> <a href="#" data-toggle="tooltip"
				style='animation: true'
				title="Gringotts  key is used to unlock the gringotts account  for  buying things"><img
				src="images1/Picture60.png" class='storePicture60' /></a>
			<form action="itemBuy.jsp" method="post" name="item5Form">
				<input type="submit" value="BUY" class='storebuy5'
					style="width: 100px" onclick="item5Function(this)" />
			</form>
			<img src="images1/Picture64.png" class='storebuy51' /> <span
				style="position: absolute; top: 76%; left: 25.5%;"
				class="fontfam bold">$15</span> <a href="#" data-toggle="tooltip"
				style='animation: true'
				title="Toad must be bought to enter into third phase"><img
				src="images1/Picture61.gif" class='storePicture61' /></a>
			<form action="itemBuy.jsp" method="post" name="item6Form">
				<input type="submit" value="BUY" class='storebuy6'
					style="width: 100px" onclick="item6Function(this)" />
			</form>
			<img src="images1/Picture64.png" class='storebuy61' /> <span
				style="position: absolute; top: 76%; left: 39.8%;"
				class="fontfam bold">$50</span> <a href="#" data-toggle="tooltip"
				style='animation: true'
				title="Cat must be bought to enter into third phase"><img
				src="images1/Picture62.png" class='storePicture62' /></a>
			<form action="itemBuy.jsp" method="post" name="item7Form">
				<input type="submit" value="BUY" class='storebuy7'
					style="width: 100px" onclick="item7Function(this)" />
			</form>
			<img src="images1/Picture64.png" class='storebuy71' /> <span
				style="position: absolute; top: 76%; left: 54.8%;"
				class="fontfam bold">$50</span> <a href="#" data-toggle="tooltip"
				style='animation: true;'
				title="Owl must be bought to enter into third phase"><img
				src="images1/Picture63.png" class='storePicture63' /></a>
			<form action="itemBuy.jsp" method="post" name="item8Form">
				<input type="submit" value="BUY" class='storebuy8'
					style="width: 100px" onclick="item8Function(this)" />
			</form>
			<img src="images1/Picture64.png" class='storebuy81' /> <span
				style="position: absolute; top: 76%; left: 67.7%;"
				class="fontfam bold">$50</span>
		</div>

		<div id="firstImage" class=''
			style="position: absolute; width: 14%; text-align: center; margin-top: 10%;">

			<img id="firstImageId" src="images1/Picture121.png" alt=""
				style="position: absolute; left: 258%; margin-top: -270%;" /> <img
				id="firstImageId" src="images1/Picture13.png" alt=""
				style="position: absolute; left: 330%; margin-top: -188%; width: 139px; height: 90px;" />
			<span style="position: absolute; left: 360%; margin-top: -169%;">Click
				Here </span>
		</div>

		<div id="gifClick" class='sliderContent hide'
			style="width: 14%; text-align: center; margin-top: -105px;">

			<a data-toggle="tooltip" style='animation: true' title="Click Here"><img
				id="gotoOwlMessage" src="images1/Picture201.png" alt=""
				class='leftMenuItem1' style="margin-top: 48%; position: absolute;" /></a>

		</div>

		<div id="owlMessage" class='hide'>
			<img src="images1/Picture22.png" alt="" class='pic22 sliderContent'
				style="margin-top: 11px; margin-left: 6%; width: 312px;" />
			<div class='sliderContent'>
				<div class='pic22Content fontfam'
					style="position: absolute; margin-left: 27%; margin-top: 14%;">
					Hi,<br />
					<%=Customer%><br /> <br /> <br /> From,<br /> Albus Dumbledore
					<span style="float: right; margin-right: 11px;"><img
						src="images1/Picture21.png" alt=""
						style="float: right; margin-right: -60px; margin-top: -65px;"></span>
				</div>
			</div>
		</div>

		<div id="tcos" class='hide'>
			<img src="images1/pic.png" alt="" class='picSlide' /> <img
				id="closeBook" src="images1/Picture14.png" alt="" class='pic14close' />
			<div class='left sliderContent'>
				<div id="page1">
					<div class='left' style='width: 40%; text-align: center;'>
						<h3>
							Welcome to <br /> Chamber of Secrets
						</h3>
					</div>
					<div class='right'
						style='width: 40%; text-align: center; margin-left: -126px;'>
						<b>The Great Hall</b><br /> <img src="images1/Picture2.png"
							alt="" class='leftMenuItem1' /><br /> <span class='fontfam'>Welcome
							to Great Hall, here you can<br /> view points of allthe four<br />
							hogwarts houses and teams<br /> contribution to their respective
							houses.
						</span> <br /> <br /> <img src="images1/Picture15.png" alt=""
							class="pageimg_1_n bookpic15" name='next'
							style="margin-left: 97%" class='' /><br />
					</div>
				</div>
				<div id="page2" class='hide'>
					<div class='left' style='width: 40%; text-align: center;'>
						<b>Common Room</b> <img src="images1/Picture2.png" alt=""
							class='leftMenuItem1' /><br /> <span class='fontfam'>Welcome
							to Common Room, here you can see the details of all the teams in
							your house. </span> <br /> <br /> <br /> <br /> <br /> <img
							src="images1/Picture16.png" alt="" class="pageimg_2_p bookpic15"
							name="prev"
							style="margin-right: 190px; margin-left: 0 !important; margin-top: 45%" /><br />
					</div>
					<div class='right' style='width: 35%; text-align: center;'>
						<b>Diagon Alley</b><br /> <img src="images1/Picture4.png" alt=""
							class='leftMenuItem1' /><br /> <span class='fontfam'>Welcome
							to Diagon Alley, Here You’ve some items which are necessary to
							get into Hogwarts. For this purpose you’ve Gringotts Bank where
							you can check your vault and buy things </span> <br /> <img
							src="images1/Picture15.png" alt="" class="pageimg_2_n bookpic15"
							name="next" class='' /><br />
					</div>
				</div>
				<div id="page3" class='hide'>
					<div class='left' style='width: 40%; text-align: center;'>
						<b>Fly In</b> <img src="images1/Picture7.png" alt=""
							class='leftMenuItem1' /><br /> <span class='fontfam'>Welcome
							to Quidditch Fly In,Here you’ve three tasks to do. On doing so
							you’ll finish an academic year in Hogwarts. </span> <br /> <br /> <br />
						<br /> <img src="images1/Picture16.png" alt=""
							class="pageimg_3_p bookpic15" name="prev"
							style="margin-right: 190px; margin-left: 0 !important; margin-top: 55%" /><br />
					</div>
					<div class='right' style='width: 35%; text-align: center;'>
						<b>Goblin’s Challenge</b><br /> <img src="images1/Picture17.png"
							alt="" class='leftMenuItem1' /><br /> <span class='fontfam'>This
							is the input phase where you need to identify problems for the
							statement given by Head Master. If you complete this challenge
							you’ll get vault key to unlock Gringott’s Account. </span> <br /> <img
							src="images1/Picture15.png" alt="" class="pageimg_3_n bookpic15"
							name="next" class='' /><br />
					</div>
				</div>
				<div id="page4" class='hide'>
					<div class='left' style='width: 40%; text-align: center;'>
						<b>Hogwarts Express </b> <img src="images1/Picture18.png" alt=""
							class='leftMenuItem1' /><br /> <span class='fontfam'>This
							is the rating phase where you need to rate all the problems based
							on IFF Model to free dobby by gifting clothes to it. If you
							complete the task Hogwarts platform ticket gets unlocked. </span> <br />
						<br /> <img src="images1/Picture16.png" alt=""
							class="pageimg_4_p bookpic15" name="prev"
							style="margin-right: 190px; margin-left: 0 !important; margin-top: 43%" /><br />
					</div>
					<div class='right' style='width: 35%; text-align: center;'>
						<b>Sorting Hat</b><br /> <img src="images1/Picture19.png" alt=""
							class='leftMenuItem1' /><br /> <span class='fontfam'>This
							is the Six thinking Analysis phase where you need to analyze top
							rated problems by giving thoughts, agree (+) or disagree (-)
							others thoughts. </span> <br /> <br /> <br /> <img
							src="images1/Picture15.png" alt="" class="pageimg_4_n bookpic15"
							name="next" style="margin-top: 49%" class='' /><br />
					</div>
				</div>
				<div id="page5" class='hide'>
					<div class='left' style='width: 40%; text-align: center;'>
						<b class='fontfam'>How to get more points and Galleons (bank
							balance)…??? </b> <br /> <br /> <span class='fontfam'>
							<ul style='text-align: left;'>
								<li>Complete all tasks in time</li>
								<li>If your rating is nearer to average rating you’ll get
									Galleons</li>
								<li>If other teams agree your thoughts you’ll get points
									and vice-versa.</li>
								<li>If you’ve highest number of agrees you’ll gain
									Galleons.</li>
							</ul>
						</span> <br /> <img src="images1/Picture16.png" alt=""
							class="pageimg_5_p bookpic15" name="prev"
							style="margin-right: 190px; margin-left: 0 !important; margin-top: 34%" /><br />
					</div>
					<div class='right' style='width: 35%; text-align: center;'>
						<b class='fontfam'>Additional Info:</b><br /> <br /> <span
							class='fontfam'>
							<ul style='text-align: left;'>
								<li>If you can’t complete task in time, you can ask for
									extension at the cost of your Galleons</li>
								<li>You can ask extension for only three times
								<li>If you can’t complete the task for 4th time, Lord
									Voldemort gives you poison potion</li>
								<li>House with highest points will get wizard cup.</li>
							</ul>
						</span> <br /> <br />
						<center>
							<b>THE END</b>
						</center>
					</div>
				</div>

			</div>
		</div>
		<div class='clear'></div>
	</div>
	</div>


	<%
		Statement statement1 = con.createStatement();
		ResultSet resultSet1 = statement1
				.executeQuery("select * from Timer");
		java.util.Date startDate = new java.util.Date();
		java.util.Date today = new java.util.Date();

		int startHour = 0, startMinute = 0, startSecond = 0, duration = 0, endHour = 0, endMinute = 0;
		String firstPhase = "", secondPhase = "", thirdPhase = "";

		SimpleDateFormat parserSDF = new SimpleDateFormat(
				"EEE MMM d HH:mm:ss zzz yyyy");
		java.util.Date parseDate = parserSDF.parse(today + "");

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String dateStr = formatter.format(parseDate);

		if (resultSet1.next()) {
			firstPhase = resultSet1.getString(2);
			secondPhase = resultSet1.getString(3);
			thirdPhase = resultSet1.getString(4);
			startDate = resultSet1.getDate(5);
			startHour = resultSet1.getInt(6);
			startMinute = resultSet1.getInt(7);
			startSecond = resultSet1.getInt(8);
			duration = resultSet1.getInt(9);

			int minutes = startMinute + duration;
			if (minutes >= 60) {
				int hr = minutes / 60;
				int mm = minutes % 60;
				endHour = startHour + 1;
				endMinute = mm;
			} else {
				endHour = startHour;
				endMinute = minutes;
			}
		}

		String isToday = "";

		System.out.println(startDate.toString() + "-" + (dateStr));
		if (startDate.toString().equals(dateStr)) {
			isToday = "Yes";
		} else {
			isToday = "No";
		}
	%>
</body>
<script type="text/javascript">
	var timerCount;
	var timerCount1;
	var timerCount2;
	var timerCount3;
	var expectedTime = new (function TimerCountDown() {
		var $countdown, $form, // Form used to change the countdown time
		incrementTime = 70;
		var fPhase = "<%=firstPhase%>";
		var todayDate = "<%=isToday%>";
	
		var defhrs = 00;
		var defmm = 00;
		var defss = 00;

		var endhrs = 00;
		var endmm = 00;
		var endss = 00;		
		
		if(fPhase == "Yes")
		{
			if(todayDate == "Yes")
			{
				 defhrs = "<%=startHour%>";
				 defmm = "<%=startMinute%>";
				 defss = "<%=startSecond%>";

				 endhrs = "<%=endHour%>";
				 endmm = "<%=endMinute%>";
				 endss = "<%=startSecond%>";
			}
		}

		var today = new Date();
		var h = today.getHours();
		var m = today.getMinutes();
		var s = today.getSeconds();

		var counthr = 0;
		var countmm = 0;
		var countss =0;
		var extraMinute = 0;
		
		if(defhrs<=h)
		{
			if(endhrs>=h)
			{
				
				var t= Number(h)+1;
				if(endhrs == t){
					var pp = (60-m);
					extraMinute = Number(pp)+Number(endmm);
					counthr = 0;
					countmm = extraMinute;
				}else{
					ciounthr = (endhrs - (h+1));
				}
				
				if(extraMinute==0){
					if(defmm<=m)
					{
						if(endmm>=m){
							countmm = (endmm - m);	
						}else{
							countmm = 0;
						}
					}
					}
					
					
						if(defhrs<=h){
							if(endhrs>=h){
								if(endmm>=m){
									countss = (60 - s);				
								}
							}
						}

					
					if(fPhase == "Yes"){
						if(todayDate == "Yes"){
							countmm = (Number(countmm)-1);
						}else{
							countmm = 0;
						}
					}
					
			}
			else{
				counthr = 0;
			}
			
		}
		
	
		var totSec = (counthr * 60 * 60) + (countmm * 60) + countss;

		currentTime = totSec * 100, updateTimer = function() {
			$countdown.html(formatTime(currentTime));
			if (currentTime == 0) {
				$('#txt').attr('readonly', 'readonly');
				expectedTime.Timer.stop();
				timerComplete();
				expectedTime.resetCountdown();
				timerCount = currentTime;
				return;
			}
			currentTime -= incrementTime / 10;
			if (currentTime < 0)
				currentTime = 0;
		}, timerComplete = function() {

		}, init = function() {
			$countdown = $('#countdown');
			expectedTime.Timer = $.timer(updateTimer, incrementTime, true);
			$form = $('#example2form');
			$form.bind('submit', function() {
				expectedTime.resetCountdown();
				return false;
			});
		};
		this.resetCountdown = function() {
			var newTime = parseInt($form.find('input[type=text]').val()) * 100;
			if (newTime > 0) {
				currentTime = newTime;
			}
			this.Timer.stop().once();
		};
		$(init);
	});

	// Common functions
	function pad(number, length) {
		var str = '' + number;
		while (str.length < length) {
			str = '0' + str;
		}
		return str;
	}
	function formatTime(time) {
		var hrs = parseInt(time / 360000), min = parseInt((time - (hrs * 60 * 60 * 100)) / 6000), sec = parseInt(time / 100)
				- (((min + (hrs * 60))) * 60), hundredths = pad(time
				- (sec * 100) - (min * 6000), 2);
		return (hrs > 0 ? pad(hrs, 2) : "00") + ":"
				+ (min > 0 ? pad(min, 2) : "00") + ":" + pad(sec, 2);
	}

	document.getElementById('countdown').innerHTML = expectedTime;

	var expectedTime1 = new (function TimerCountDown1() {
		var $countdown1, $form1, // Form used to change the countdown time
		incrementTime1 = 70;
		var sPhase = "<%=secondPhase%>";
		var sDate  = "<%=isToday%>";
		
		var defhrs1 = 00;
		var defmm1 = 00;
		var defss1 = 00;

		var endhrs1 = 00;
		var endmm1 = 00;
		var endss1 = 00;
		
		if(sPhase == "Yes")
		{
			if(sDate == "Yes")
			{
				 defhrs1 = "<%=startHour%>";
				 defmm1 = "<%=startMinute%>";
				 defss1 = "<%=startSecond%>";

				 endhrs1 = "<%=endHour%>";
				 endmm1 = "<%=endMinute%>";
				 endss1 = "<%=startSecond%>";
			}
			
		}
		
		var today1 = new Date();
		var h1 = today1.getHours();
		var m1 = today1.getMinutes();
		var s1 = today1.getSeconds();

		var counthr1 = 0;
		var countmm1 = 0;
		var countss1 =0;
		var extraMinute1 = 0;
		
		if(defhrs1<=h1)
		{
			if(endhrs1>=h1)
			{
				
				var t1= Number(h1)+1;
				if(endhrs1 == t1){
					var pp1 = (60-Number(m1));
					extraMinute1 = Number(pp1)+Number(endmm1);
					counthr1 = 0;
					countmm1 = extraMinute1;
				}else{
					ciounthr1 = (endhrs1 - (Number(h1)+1));
				}
				
				if(extraMinute1==0){
					if(defmm1<=m1)
					{
						if(endmm1>=m1){
							countmm1 = (endmm1 - m1);	
						}else{
							countmm1 = 0;
						}
					}
					}
							
						if(defhrs1<=h1){
							if(endhrs1>=h1){
								if(endmm1>=m1){
									countss1 = (60 - Number(s1));				
								}
							}
						}
					
					if(sPhase == "Yes"){
						if(sDate == "Yes"){
							countmm1 = (Number(countmm1)-1);
						}else{
							countmm1 = 0;
						}
					}
					
			}
			else{
				counthr1 = 0;
			}
			
			
		}
		
		

		var totSec1 = (counthr1 * 60 * 60) + (countmm1 * 60) + countss1;

		currentTime1 = totSec1 * 100, updateTimer1 = function() {
			$countdown1.html(formatTime1(currentTime1));
			if (currentTime1 == 0) {
				expectedTime1.Timer.stop();
				timerComplete1();
				expectedTime1.resetCountdown();
				timerCount1 = currentTime1;
				return;
			}
			currentTime1 -= incrementTime1 / 10;
			if (currentTime1 < 0)
				currentTime1 = 0;
		}, timerComplete1 = function() {

		}, init1 = function() {
			$countdown1 = $('#countdown1');
			expectedTime1.Timer = $.timer(updateTimer1, incrementTime1, true);
			$form1 = $('#example2form');
			$form1.bind('submit', function() {
				expectedTime1.resetCountdown();
				return false;
			});
		};
		this.resetCountdown = function() {
			var newTime1 = parseInt($form1.find('input[type=text]').val()) * 100;
			if (newTime1 > 0) {
				currentTime1 = newTime1;
			}
			this.Timer.stop().once();
		};
		$(init1);
	});

	// Common functions
	function pad(number, length) {
		var str = '' + number;
		while (str.length < length) {
			str = '0' + str;
		}
		return str;
	}
	function formatTime1(time) {
		var hrs = parseInt(time / 360000), min = parseInt((time - (hrs * 60 * 60 * 100)) / 6000), sec = parseInt(time / 100)
				- (((min + (hrs * 60))) * 60), hundredths = pad(time
				- (sec * 100) - (min * 6000), 2);
		return (hrs > 0 ? pad(hrs, 2) : "00") + ":"
				+ (min > 0 ? pad(min, 2) : "00") + ":" + pad(sec, 2);
	}

	document.getElementById('countdown1').innerHTML = expectedTime1;

	var expectedTime2 = new (function TimerCountDown1() {
		
		var $countdown2,$form2,incrementTime2 = 70;
		
		
		var tPhase = "<%=thirdPhase%>";
		var tDate = "<%=isToday%>";		
		
		var defhrs2 = 00;
		var defmm2 = 00;
		var defss2 = 00;

		var endhrs2 = 00;
		var endmm2 = 00;
		var endss2 = 00;
		
		if(tPhase == "Yes")
		{
			if(tDate == "Yes")
			{

				 defhrs2 = "<%=startHour%>";
				 defmm2 = "<%=startMinute%>";
				 defss2 = "<%=startSecond%>";

				 endhrs2 = "<%=endHour%>";
				 endmm2 = "<%=endMinute%>";
				 endss2 = "<%=startSecond%>";

			}

		}

		var today2 = new Date();
		var h2 = today2.getHours();
		var m2 = today2.getMinutes();
		var s2 = today2.getSeconds();

		var counthr2 = 0;
		var countmm2 = 0;
		var countss2 = 0;
		var extraMinute2 = 0;

		if (defhrs2 <= h2) {
			if (endhrs2 >= h2) {

				var t2 = Number(h2) + 1;
				
				if (endhrs2 == t2) {
					var pp2 = (60 - m2);
					extraMinute2 = Number(pp2) + Number(endmm2);
					counthr2 = 0;
					countmm2 = extraMinute2;
				} else if(endhrs2 == h2) {
					
					counthr2 =0;
				}else{
					counthr2 = (endhrs2 - (h2 + 1));
				}
				
				if (extraMinute2 == 0) {
					if (defmm2 <= m2) {
						if (endmm2 >= m2) {
							countmm2 = (endmm2 - m2);
						} else {
							countmm2 = 0;
						}
					}
				}


					if (tPhase == "Yes") {
						if (tDate == "Yes") {
							if (defhrs2 <= h2) {
								if (endhrs2 >= h2) {
									if (endmm2 >= m2) {
										countss2 = (60 - s2);
									}
								}
							}
						}
					}
					
				if (tPhase == "Yes") {
					if (tDate == "Yes") {
						countmm2 = (Number(countmm2) - 1);
					} else {
						countmm2 = 0;
					}
				}
			} else {
				counthr2 = 0;
			}
		}

	

		var totSec2 = (counthr2 * 60 * 60) + (countmm2 * 60) + countss2;

		currentTime2 = totSec2 * 100, updateTimer2 = function() {
			$countdown2.html(formatTime2(currentTime2));
			if (currentTime2 == 0) {
				expectedTime2.Timer.stop();
				timerComplete2();
				expectedTime2.resetCountdown();
				timerCount2 = currentTime2;
				return;
			}
			currentTime2 -= incrementTime2 / 10;
			if (currentTime2 < 0)
				currentTime2 = 0;
		}, timerComplete2 = function() {

		}, init2 = function() {
			$countdown2 = $('#countdown2');
			expectedTime2.Timer = $.timer(updateTimer2, incrementTime2, true);
			$form2 = $('#example2form');
			$form2.bind('submit', function() {
				expectedTime2.resetCountdown();
				return false;
			});
		};
		this.resetCountdown = function() {
			var newTime2 = parseInt($form2.find('input[type=text]').val()) * 100;
			if (newTime2 > 0) {
				currentTime2 = newTime2;
			}
			this.Timer.stop().once();
		};
		$(init2);
	});

	// Common functions
	function pad(number, length) {
		var str = '' + number;
		while (str.length < length) {
			str = '0' + str;
		}
		return str;
	}
	function formatTime2(time) {
		var hrs = parseInt(time / 360000), min = parseInt((time - (hrs * 60 * 60 * 100)) / 6000), sec = parseInt(time / 100)
				- (((min + (hrs * 60))) * 60), hundredths = pad(time
				- (sec * 100) - (min * 6000), 2);
		return (hrs > 0 ? pad(hrs, 2) : "00") + ":"
				+ (min > 0 ? pad(min, 2) : "00") + ":" + pad(sec, 2);
	}


	document.getElementById('countdown2').innerHTML = expectedTime2;

	
	
var expectedTime3 = new (function TimerCountDown1() {
		
		var $countdown3,$form3,incrementTime3 = 70;
		
		
		var tPhase = "<%=thirdPhase%>";
		var tDate = "<%=isToday%>";		
		
		var defhrs2 = 00;
		var defmm2 = 00;
		var defss2 = 00;

		var endhrs2 = 00;
		var endmm2 = 00;
		var endss2 = 00;
		
		if(tPhase == "Yes")
		{
			if(tDate == "Yes")
			{

				 defhrs2 = "<%=startHour%>";
				 defmm2 = "<%=startMinute%>";
				 defss2 = "<%=startSecond%>";

				 endhrs2 = "<%=endHour%>";
				 endmm2 = "<%=endMinute%>";
				 endss2 = "<%=startSecond%>";

			}

		}

		var today2 = new Date();
		var h2 = today2.getHours();
		var m2 = today2.getMinutes();
		var s2 = today2.getSeconds();

		var counthr2 = 0;
		var countmm2 = 0;
		var countss2 = 0;
		var extraMinute2 = 0;

		if (defhrs2 <= h2) {
			if (endhrs2 >= h2) {

				var t2 = Number(h2) + 1;

				if (endhrs2 == t2) {
					var pp2 = (60 - m2);
					extraMinute2 = Number(pp2) + Number(endmm2);
					counthr2 = 0;
					countmm2 = extraMinute2;
				} else if (endhrs2 == h2) {
					counthr2 = 0;
				} else {
					counthr2 = (endhrs2 - (h2 + 1));
				}

				if (extraMinute2 == 0) {
					if (defmm2 <= m2) {
						if (endmm2 >= m2) {
							countmm2 = (endmm2 - m2);
						} else {
							countmm2 = 0;
						}
					}
				}

				if (tPhase == "Yes") {
					if (tDate == "Yes") {
						if (defhrs2 <= h2) {
							if (endhrs2 >= h2) {
								if (endmm2 >= m2) {
									countss2 = (60 - s2);
								}
							}
						}
					}
				}

				if (tPhase == "Yes") {
					if (tDate == "Yes") {
						countmm2 = (Number(countmm2) - 1);
					} else {
						countmm2 = 0;
					}
				}
			} else {
				counthr2 = 0;
			}
		}

		var totSec2 = (counthr2 * 60 * 60) + (countmm2 * 60) + countss2;

		currentTime3 = totSec2 * 100, updateTimer3 = function() {
			$countdown3.html(formatTime3(currentTime3));
			if (currentTime3 == 0) {
				expectedTime3.Timer.stop();
				timerComplete3();
				expectedTime3.resetCountdown();
				timerCount3 = currentTime3;
				return;
			}
			currentTime3 -= incrementTime3 / 10;
			if (currentTime3 < 0)
				currentTime3 = 0;
		}, timerComplete3 = function() {

		}, init3 = function() {
			$countdown3 = $('#countdown3');
			expectedTime3.Timer = $.timer(updateTimer3, incrementTime3, true);
			$form3 = $('#example2form');
			$form3.bind('submit', function() {
				expectedTime3.resetCountdown();
				return false;
			});
		};
		this.resetCountdown = function() {
			var newTime3 = parseInt($form3.find('input[type=text]').val()) * 100;
			if (newTime3 > 0) {
				currentTime3 = newTime3;
			}
			this.Timer.stop().once();
		};
		$(init3);
	});

	// Common functions
	function pad(number, length) {
		var str = '' + number;
		while (str.length < length) {
			str = '0' + str;
		}
		return str;
	}
	function formatTime3(time) {
		var hrs = parseInt(time / 360000), min = parseInt((time - (hrs * 60 * 60 * 100)) / 6000), sec = parseInt(time / 100)
				- (((min + (hrs * 60))) * 60), hundredths = pad(time
				- (sec * 100) - (min * 6000), 2);
		return (hrs > 0 ? pad(hrs, 2) : "00") + ":"
				+ (min > 0 ? pad(min, 2) : "00") + ":" + pad(sec, 2);
	}

	document.getElementById('countdown3').innerHTML = expectedTime3;

	$('#flyInId').live('click', function() {
		$('#sortingHatnextId').addClass('hide');
		$('#sortingHatnextId12').addClass('hide');
		$('#sortingHatnextId13').addClass('hide');
		$('#timerid').addClass('hide');
		$('#timerid1').addClass('hide');
		$('#notificationPanelId').addClass('hide');
		$('#firstImage').addClass('hide');
		$('#nameChangeDiv').addClass('hide');
		$('#slide35Container').addClass('hide');
		$('#Slide32Container').addClass('hide');
		$('#tcos').addClass('hide');
		$('#page1').addClass('hide');
		$('#page1').siblings().addClass('hide');
		$('#diagonAlley').addClass('hide');
		$('#helpMessage1').addClass('hide');
		$('#grinCotts').addClass('hide');
		$('#store').addClass('hide');
		$('#gifClick').addClass('hide');
		$('#owlMessage').addClass('hide');
		$('#closeBook1').removeClass('hide');
		if (timerCount == 0) {
			if (timerCount1 == 0) {
				$('#problemContainer2').removeClass('hide');
				$('#problemContainer1').addClass('hide');
				$('#problemContainer').addClass('hide');
			} else {
				$('#problemContainer1').removeClass('hide');
				$('#problemContainer').addClass('hide');
				$('#problemContainer2').addClass('hide');
			}
		} else {
			$('#problemContainer').removeClass('hide');
			$('#problemContainer1').addClass('hide');
			$('#problemContainer2').addClass('hide');
		}

		for (var m = 0; m < pcount; m++) {
			var t1 = "#ratingContainer" + m;
			$(t1).addClass('hide');
		}

		$('#afterProblemContainer').addClass('hide');
		$('#ProbelmListcontainer').addClass('hide');
		$('#keyContentContainer').addClass('hide');
		$('#problemsIdentifiedContainerBack').addClass('hide');
		$('#commonRoom').addClass('hide');
		$('#slide9').addClass('hide');
		$('#slide10').addClass('hide');
	});
</script>


</html>