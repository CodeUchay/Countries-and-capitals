<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.util.HashMap, java.util.Map, fr.esigelec.jee.DBDAO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>



<!DOCTYPE html>

<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
<meta charset="UTF-8">
<title>World Capitals Web Application</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	 integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>

	<div>


		<nav
			style="padding: 20px 10rem 20px 10rem; display: flex; justify-content: space-between;">
			<div>
				<i class="fa-solid fa-user"> </i> <span> <%
 out.println(session.getAttribute("UserName"));
 %>
				</span>
			</div>
			<div style="color: #1d71f0">
				<a href="${pageContext.request.contextPath}/logout">LogOut</a> <i
					class="fa-solid fa-power-off"></i>
			</div>
		</nav>
	</div>
	<section style="margin-left: 20%; margin-right: 20%;"
		class="text-center">
		<h1>World Capitals Web Application</h1>

		<%
		DBDAO db = new DBDAO();
		Cookie[] cookies = request.getCookies();
		Cookie newCookie = null;
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("CountryName")) {
			newCookie = cookie;

			System.out.println("Cookie IS ADDED...");
			break;
				}
			}
		}

		String c = request.getParameter("c");
		//////////////////////////////////////////////////////////
		System.out.println("From COUNTRY CAPITAL PAGE:" + c);

		if (newCookie != null) {
			newCookie.setValue(c);
		} else {
			System.out.println("NEW COOKIE IS NULL.....");
		}

		System.out.println("The Sessin VALUE IS: " + session.getAttribute("UserName"));
		////////////////////////////////////////////////////////
		if (session.getAttribute("UserName") == null) {
			response.sendRedirect("LoginForm.jsp");
		} else {

			if (c != null) {
			
			System.out.println("The value of C is: "+c);
			HashMap<String,String> countryh = db.getCountryName();
			String country = countryh.get(c);
			HashMap<String, String> cityh = db.getCityName();
			String city = cityh.get(c);
		%>

		<h1>
			The Capital of
			<%=country%>
			is
			<%=city%></h1>
		<div style="padding: 30px; margin-left: 35%; margin-right: 35%;"
			class=" d-flex justify-content-center"></div>
		<%
			DBDAO code_retrieve = new DBDAO();
			
			code_retrieve.setCountryNames();
			
			HashMap<String,String> list;
			
			list=code_retrieve.getCountryName();
			
			for (Map.Entry<String, String> entry : list.entrySet()) {
			    String coun_code = entry.getKey();
			    String coun_name = entry.getValue();
			
			    %>

				<a href="CountryCapitalName.jsp?c=<%=coun_code%>"><button
						type="button" style="margin-left: 30%; margin-right: 30%;"
						class="btn btn-primary"><%=coun_name%></button></a>
				<%

			}
		}
		}
		%>

<%////////////////The below is to create a new country and capital %>

<div style="padding: 30px; margin-left: 50%; margin-right: 50%;"
			class=" d-flex justify-content-center">
			<a href="NewCountryForm.jsp"><button
						type="button" style=""
						class="btn btn-primary">"Add new Country and Capital"</button></a></div>
				
<%////////////////////////////////////////////////////////////////////////////// %>


<%////////////////The below is to edit country details %>
<div style="padding: 30px; margin-left: 50%; margin-right: 50%;"
			class=" d-flex justify-content-center">
			<a href="EditCountryPage.jsp"><button
						type="button" style="margin-left: 20%; margin-right: 20%;"
						class="btn btn-primary">"Edit Country Details"</button></a></div>
<%////////////////////////////////////////////////////////////////////////////// %>



<%////////////////Adding the footer %>
		<%@ include file="footer.jsp"%>
	</section>



</body>
</html>