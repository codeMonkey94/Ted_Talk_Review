<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
	<head>
		<title>TedTalkReviews</title>
		<jsp:include page = "CSS/homePage.css"/> <!-- ALTERNATIVE TO USEING HREFS-->
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
		<h1> Review </h1>
		<hr>
		<form action = "${pageContext.servletContext.contextPath}/home" method = "get">
		<input type = "Submit" name = "redirectHome" class="button" value = "Home">
		</form>
		<form action = "${pageContext.servletContext.contextPath}/login" method = "get">
		<input type = "Submit" name = "logout" class="button" value = "Logout">
		</form>
		<br><br><br>
		<hr>		
		<div class = "reviewSection">
		<form action = "${pageContext.servletContext.contextPath}/review" method = "post">
			<table>
				<tr>
					<td>Review Title:<input type="text" name = "title" placeholder = "e.g. Art of listening" required = "required" size = "40" value="${name}"> </td>
		 		</tr>
		 		<tr>
		 			<td>Presenter's Name:<input type="text" name = "presenterName" placeholder = "e.g. John Appleseed" required = "required"size = "40" value="${presenterName}"> </td>
		 		</tr>
		 		<tr>
		 			<td>URL:<input type="text" name = "url" placeholder = "e.g. https://www.ted.com/talks" required = "required" size = "40" value="${url}"> </td>
		 		</tr>
		 		<tr><!-- consider having click to input rather than user entering asterisk -->
		 			
		 		</tr>			 	
	 		</table>
	 		<a href = "http://${url}" target = "blank"> ${url} </a>

		 				 <%--This is the textfield for the review's description --%> 
			<div id="cct_embed_counts" align ="center">
			 <%--the form action will call the post method in the review servlet, then it will redirect it to the profile servlet --%> 
			
			<textarea id="cct_embed_input_text" name="description" rows="4" cols="50" maxlength="250" placeholder="Enter Description here max of 250 characters" spellcheck="true"></textarea>
			   
			<p>Rating</p> 
							<select name="rating">
   						 		<option value="1">1</option>
    							<option value="2">2</option>
    							<option value="3">3</option>
    							<option value="4">4</option>
    							<option value="5">5</option>
  							</select>
  			<p>Tags</p>
  							<select name = "tags">
  								<option value = "Mechanical Engineering"> Mechanical Engineering </option>
  								<option value = "Civil Engineering"> Civil Engineering </option>
  								<option value = "Software Engineering"> Software Engineering </option>
  								<option value = "Computer Science"> Computer Science </option>
  								<option value = "Psychology"> Psychology </option>
  							</select>
  							<input  type="submit" value="Submit">
			<div id="cct_embed_result"></div>
			<div id="cct_powered_by">Powered by <a href="https://charactercounttool.com">Character Counter</a></div>
	
			<script type="text/javascript" src="https://charactercounttool.com/cct_embed.min.js"></script>
			</div>
		
		</form>

			</div>
		<hr>
		<p> average rating: ${avgRating}</p>
		<c:forEach var="i" begin = "0" end = "${listSize}">
			<div class = "reviewSection">
				<table>
			 		<tr><!-- consider having click to input rather than user entering asterisk -->
			 			<td>Rating: ${ratings.get(i)} </td>
			 		</tr>	
			 		<tr>
			 			<td>Description: ${descriptions.get(i)} </td>
			 		</tr>		 	
		 		</table>
			</div>
		</c:forEach>

	</body>
</html>
