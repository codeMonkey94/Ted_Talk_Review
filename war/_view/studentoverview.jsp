<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
	<head>
			<title>My Account</title>
			<jsp:include page ="CSS/homePage.css"/> <!-- ALTERNATIVE TO USEING HREFS-->
					
	</head>
	
	<body>
		<span class = "images">
			<a href = "https://www.ted.com" target = "blank" >
			<img src = "images/TedTalk.png" align = "left" width = 200 height = 150 >
			</a>
			<a href = "https://my.ycp.edu" target = "blank">
			<img src = "images/YorkCollge.png" align = "right" width = 200 height = 150 >
			</a>			
		</span>
		<h1>Network Admin Home</h1>
		<hr>		
		<form action = "${pageContext.servletContext.contextPath}/profile" method="get">
		<input type = "Submit" name = "redirectProfile" class="button" value = "Profile">
		</form>
		<form action = "${pageContext.servletContext.contextPath}/login" method = "get">
		<input type = "Submit" name = "logout" class="button" value = "Logout">
		</form>
		<br><br><br>
		<hr>
		<div class = "searchSection">
			<p>Search Page:</p>
			<form action="${pageContext.servletContext.contextPath}/result" method="get"> 
			<input type = "Submit" name = "searchPage" class="button2" value = "search">
			</form>
		</div>
		<hr>
		<c:forEach items="${tabs}" var="tabs">
      		<td><c:out value="${tabs}"/></td>
      		<p></p>
  		</c:forEach>  			
	</body>
</html>
