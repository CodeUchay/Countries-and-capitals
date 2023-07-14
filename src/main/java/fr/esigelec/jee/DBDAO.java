package fr.esigelec.jee;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class DBDAO {

	private List<String> countryCodes = new ArrayList<String>();
	private HashMap<String,String> countryName = new HashMap<>();
	private HashMap<String,String> cityName = new HashMap<>();
	private String user;
	private String pass;

	private String url = "jdbc:mysql://localhost/capitals";
	private String username = "ccodes";
	private String password = "javaee2021";
	Connection conn = null;

	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");		
		} catch(ClassNotFoundException ex) {
			ex.printStackTrace();
		}
	}


	public DBDAO () {
		try {
			this.setCountryCodes();
			this.setCountryNames();
			this.setCityNames();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println("This is DBDAO, I have"+ this.countryCodes.size()+" elements...");
	}


	//	public List<String> getCountryCode(){
	//
	//		return countryCodes;
	//
	//	}

	public HashMap<String, String> getCountryName() {
		return countryName;

	}

	public HashMap<String, String> getCityName() {
		return cityName;

	}

	//	public void setCountryCode() {
	//		this.countryCodes.add("FR");
	//		this.countryCodes.add("ES");
	//		this.countryCodes.add("PT");
	//	}


	public List<String> getCountryCodes() {
		return countryCodes;
	}


	//	public void setCountryNamee() {
	//		this.countryName.put("FR","France");
	//		this.countryName.put("PT","Portugal");
	//		this.countryName.put("ES","Spain");
	//
	//	}

	//	public void setCityName() {
	//		this.cityName.put("FR","Paris");
	//		this.cityName.put("PT","Lisbon");
	//		this.cityName.put("ES","Madrid");
	//
	//	}

//	public boolean validateUserCredentials(String user, String pass) {
//
//		if (user.equals("javaee") && pass.equals("esigelec2021")) {
//
//			return true;
//		}
//
//		else {
//			return false;	
//		}
//	}
	private void dbConnect() throws SQLException {

		conn = DriverManager.getConnection(url,username, password);
	}

	private void dbClose() {
		if(conn!=null) {
			try {
				conn.close();
			} catch(SQLException ex) {
				ex.printStackTrace();
			}
		}
	}



	////////////Creating public methods to Retrieve Data from DataBase//////////////////

	public void setCountryCodes() throws SQLException{

		String code;

		dbConnect();
		String query = "SELECT ccode FROM country_capitals";

		try {

			PreparedStatement ps = conn.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				code = rs.getString("ccode");
				//ccodes.add(code);
				this.countryCodes.add(code);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			dbClose();			
		}
	}


	public void setCountryNames() throws SQLException {

		dbConnect();
		String query = "SELECT ccode, cname FROM country_capitals";

		try {

			PreparedStatement ps = conn.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				String code = rs.getString("ccode");
				String country = rs.getString("cname");
				this.countryName.put(code,country);
			}

		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			dbClose();			
		}
	}


	public void setCityNames() throws SQLException {

		dbConnect();
		String query = "SELECT ccode, ccapital FROM country_capitals";

		try {

			PreparedStatement ps = conn.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				String code = rs.getString("ccode");
				String city = rs.getString("ccapital");
				this.cityName.put(code, city);
			}

		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			dbClose();			
		}

	}
	
	
	public boolean loginValidation(String user, String pass) throws SQLException {

			dbConnect();

			String query = "select * from user where name=? and password=?";
			try {
				
			
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, user);
			ps.setString(2,pass);
			ResultSet rs = ps.executeQuery();
			return rs.next();
		
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			dbClose();			
		}
		
		return false;	      
}
	
	
	
	
	public Boolean validateNewUserCredentials(String name, String password, String email) throws SQLException {
		dbConnect();
		String hash_pass = "SHA2('"+password+"', 256)";
		String query = "INSERT INTO user (name, password, email) VALUES ('" +name + "'," + hash_pass + ",'" + email + "')";
		System.out.println(query);
		try {
			PreparedStatement ps = conn.prepareStatement(query);
			ps.executeUpdate();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}finally {
			dbClose();			
		}
		return true;
	}
	
	public void addCountryDetails(String name, String capital, String code) throws SQLException {
		dbConnect();
		String query = "INSERT INTO country_capitals (cname, ccapital, ccode) VALUES('"+name+"','"+capital+"','"+code+"')";
		System.out.println(query);
		PreparedStatement ps = conn.prepareStatement(query);
		ps.executeUpdate();
		
		dbClose();
	}

}
