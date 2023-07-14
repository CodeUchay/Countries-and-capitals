<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.HashMap, fr.esigelec.jee.DBDAO"%>


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
			response.sendRedirect("LoginForm.html");
		} else {

			if (c != null) {

				switch (c) {

				case "FR":
			HashMap<String, String> countryh = db.getCountryName();
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
			class=" d-flex justify-content-center">
			<a href="CountryCapitalName2.jsp?c=ES"><button type="button"
					style="margin-left: 30%; margin-right: 30%;"
					class="btn btn-primary">Spain</button></a> <a
				href="CountryCapitalName2.jsp?c=PT"><button type="button"
					style="margin-left: 30%; margin-right: 30%;"
					class="btn btn-primary">Portugal</button></a>
		</div>

		<%
		break;

		case "ES":
			HashMap<String, String> countryh2 = db.getCountryName();
			String country2 = countryh2.get(c);
			HashMap<String, String> cityh2 = db.getCityName();
			String city2 = cityh2.get(c);
		%>
		<h1>
			The Capital of
			<%=country2%>
			is
			<%=city2%></h1>
		<div style="padding: 30px; margin-left: 35%; margin-right: 35%;"
			class=" d-flex justify-content-center">
			<a href="CountryCapitalName2.jsp?c=FR"><button type="button"
					style="margin-left: 30%; margin-right: 30%;"
					class="btn btn-primary">France</button></a> <a
				href="CountryCapitalName2.jsp?c=PT"><button type="button"
					style="margin-left: 30%; margin-right: 30%;"
					class="btn btn-primary">Portugal</button></a>
		</div>

		<%
		break;

		case "PT":
			HashMap<String, String> countryh3 = db.getCountryName();
			String country3 = countryh3.get(c);
			HashMap<String, String> cityh3 = db.getCityName();
			String city3 = cityh3.get(c);
		%>
		<h1>
			The Capital of
			<%=country3%>
			is
			<%=city3%></h1>
		<div style="padding: 30px; margin-left: 35%; margin-right: 35%;"
			class=" d-flex justify-content-center">
			<a href="CountryCapitalName2.jsp?c=ES"><button type="button"
					style="margin-left: 30%; margin-right: 30%;"
					class="btn btn-primary">Spain</button></a> <a
				href="CountryCapitalName2.jsp?c=FR"><button type="button"
					style="margin-left: 30%; margin-right: 30%;"
					class="btn btn-primary">France</button></a>
		</div>

		<%
		break;

		}
		}
		}
		%>

		<%@ include file="footer.jsp"%>
	</section>



</body>
</html>