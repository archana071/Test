<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
   <%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="java.lang.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">
<script type="text/javascript">
function validateFields(){
	if(document.loginForm.userName.value==""){
		alert("Enter User Name value.");
		document.loginForm.userName.focus();
		return false;
	}else if(document.loginForm.password.value==""){
		alert("Enter Password value.");
		document.loginForm.password.focus();
		return false;
	}else{
		return true;
	}
}


</script>
</HEAD>

<BODY>
 <img src="images1/backgroundImage.png" class="imgbg" />
<form name="loginForm" action="validatelogin.jsp" method="post">
<table style="position:absolute;margin-left:28%;margin-top:-28%;">
<tr>
<td>
<span style="color:white;">User Name</span>
</td>
<td style="padding:5px">
<input  style="width:200px;height=30px;" type="text" name="userName" />
</td>
</tr>

<tr>
<td>
<span style="color:white;">Password</span>
</td>
<td style="padding:5px">
<input style="width:200px;height=30px;" type="password" name="password" />
</td>
</tr>


<tr>
<td colspan="2" align="center">
<input type="submit" value="submit" style="background: cornflowerblue;" onclick="return validateFields()" />
</td>
</tr>
</table>

</form>
</BODY>
</HTML>
