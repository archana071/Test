<%
session.setAttribute("loginUser",null);
session.invalidate();

%>
<jsp:forward page="login.jsp"/>

