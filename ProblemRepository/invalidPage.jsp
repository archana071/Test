<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>Invalid Page</title>
<head>
<link rel="stylesheet" href="styles/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="styles/style.css" type="text/css" />
<link rel="stylesheet" href="styles/bootstrap-responsive.css"
	type="text/css" />
<script src="scripts/jquery-1.8.1.min.js"></script>
<script src="scripts/bootstrap.js"></script>
<script src="scripts/jquery.timer.js"></script>

<script>
function goBack()
  {
  window.history.back();
  }
</script>

</head>
<body>
	<div id="container">
		<img src="images1/backgroundImage.png" class="imgbg" /> <span style="color: white; position: absolute; margin-top: -29%; font-size: 30px; margin-left: 19%;">Please
			wait,. something went wrong.</span>
			<button class="btn btn-warning" onclick="goBack()" style="position: absolute;margin-top: -25%;margin-left: 33%;">Go Back</button>
	</div>
</body>
<html>