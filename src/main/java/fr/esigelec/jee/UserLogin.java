package fr.esigelec.jee;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




/**
 * Servlet implementation class UserLogin
 */
@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	DBDAO db = new DBDAO();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserLogin() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String c = null;
		//String c = request.getParameter("c");

		System.out.println(c);


		String userId = request.getParameter("user");
		String password = request.getParameter("pass");
		// To verify whether entered data is printing correctly or not
		System.out.println("userId.." + userId);
		System.out.println("password.." + password);
		// Here the business validations goes. As a sample,
		// we can check against a hardcoded value or pass
		// the values into a database which can be available in local/remote  db
		// For easier way, let us check against a hardcoded value


		//Retreaving the cookie if it is available
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie tempCookie : cookies) {
				if("CountryCode".equals(tempCookie.getName())) {
					c = tempCookie.getValue();
					System.out.println("c from cookie: "+c);
					List<String> countryCodeList = db.getCountryCodes();
					System.out.println(countryCodeList);
				}
			}
		}
		else {
			//Getting the list of the country codes and getting the first code and set it to the cookie
			System.out.println("No cookies, lets create one..");
			List<String> countryCodeList = db.getCountryCodes();
			System.out.println(countryCodeList);
			c = countryCodeList.get(0);
			System.out.println("c from DBDAO: "+c);


			//        	//Creating Cookies
			Cookie cc = new Cookie("CountryName",c);
			System.out.println("Created cookie "+ cc.toString()+":'CountryCode'= "+c);
			cc.setMaxAge(1*60*60*365); //this is not a session cookie
			System.out.println("Set up MaxAge");
			response.addCookie(cc);
			System.out.println("Just added to response object");

		}
		
////////////////////////////////////////////////////////		
		try {
			if (db.loginValidation(userId,password) == true) {
			    HttpSession session = request.getSession();
			    session.setAttribute("UserName", userId);
			    if (c == null) {response.sendRedirect("CountryCapitalName.jsp?c=FR");}
				else {response.sendRedirect("CountryCapitalName.jsp?c="+c);}
			    }
			else {
			    request.setAttribute("errorMessage", "Invalid UserID or Password");
			    request.getRequestDispatcher("/LoginForm.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
         
////////////////////////////////////////////////
//		if (userId != null && userId.isEmpty() || password != null && password.isEmpty()) {
////			
//			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "BAD REQUEST!");
////		
//		}
//
//		if(db.validateUserCredentials(userId,password) == true) {
//			HttpSession session = request.getSession();
//			session.setAttribute("UserName", userId);
////
//			if (c == null) {response.sendRedirect("CountryCapitalName2.jsp?c=FR");}
//			else {response.sendRedirect("CountryCapitalName2.jsp?c="+c);}}
	

//		else if(db.validateUserCredentials(userId,password) == false) {
//			response.sendError(HttpServletResponse.SC_FORBIDDEN, "FORBIDDEN!");
//		}


	}
}


