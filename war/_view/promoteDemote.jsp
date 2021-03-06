<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
	<head>		
		<title>Promote/Demote</title>
		<jsp:include page ="CSS/homePage.css"/>	<!-- ALTERNATIVE TO USEING HREFS-->			
 	</head>
	
	<body>
		<span class = "images">
			<a href = https://www.ted.com target = blank>
			<img src = "images/TedTalk.png" align = "left" width = 200 height = 150 >
			</a>
			<a href = https://my.ycp.edu target = blank>
			<img src = "images/YorkCollge.png" align = "right" width = 200 height = 150 >
			</a>			
		</span>
		<h1>Promote Demote Account</h1>
		<hr>		
		<form action = "${pageContext.servletContext.contextPath}/home" method="get">
		<input type = "Submit" name = "redirectProfile" class="button" value = "Home">
		</form>
		<form action = "${pageContext.servletContext.contextPath}/login" method = "get">
		<input type = "Submit" name = "logout" class="button" value = "Logout">
		</form>
		<form action = "${pageContext.servletContext.contextPath}/networkadminSetting" method = "get">
		<input type = "Submit" name = "settings" class="button" value = "Settings">
		</form>
		<br><br><br><br><br>

		<form action = "${pageContext.servletContext.contextPath}/promoteDemote" method = "post">
			<table>
					<tr>
						<td> <input type="text" name = "user" placeholder = "Username" required = "required" value="${user}"/> </td>
			 		</tr>
			 		<tr>
			 			<td> <input type="text" name = "promo" placeholder = "promote/demote" required = "required" value="${promo}"/> </td>
			 		</tr>	 	
			 </table>
			<input type = "Submit" class="button2" value = "Promote/Demote">
		</form>
	</body>
</html>