<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
	<head>
		<title>Login Page</title>
		<style type = "text/css">
		body{
		background-color: #ADD8E6;
		}
		h1{
		text-align: center;
		color: purple;
		} 
		</style>
	</head>
	
	<body>
		<h1> Test Login Page </h1>
		<form action="${pageContext.servletContext.contextPath}/home" method="get"> 
			<input type = "Submit" name = "redirectLogin" value = "Home">
		</form>
		<hr>
		<form action="${pageContext.servletContext.contextPath}/login" method="post">
			<table>
				<tr>
					<td> <input type="text" name = "u" placeholder = "Username" required = "required"> </td>
		 		</tr>
		 		<tr>
		 			<td> <input type="text" name = "p" placeholder = "Password" required = "required"> </td>
		 		</tr>
	 		</table>
	 		<button type="submit" name="submit" value = "Login">Login</button>
		 </form>
		<hr>
		
	</body>
</html>