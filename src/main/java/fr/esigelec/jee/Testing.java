package fr.esigelec.jee;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class Testing {

	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
		
		DBDAO code_retrieve = new DBDAO();
//		
		String name="javaee";
		String password = "esigelec2021";
		String email = "javaee@esigelec.com";
		code_retrieve.validateNewUserCredentials(name, password, email);
//		String name="Wasim";
//		String password = "Test123!";
//		String email = "wasim@esigelec.com";
//		String name="Uche";
//		String password = "Utest123!";
//		String email = "uche@esigelec.com";
//		code_retrieve.validateNewUserCredentials(name, password, email);
		
		
//		code_retrieve.setCountryNames();
//		
//		HashMap<String,String> list;
//		
//		list=code_retrieve.getCountryName();
		
		// Exporting the items from the map
//					for (Map.Entry<String, String> entry : list.entrySet()) {
//					    String key = entry.getKey();
//					    String value = entry.getValue();
//					    
//					    System.out.println(key +": "+ value);}
		//codes=code_retrieve.getCityName();
		//System.out.println(list);
		
		//System.out.println("///////////////////////////");
		
		//codes=code_retrieve.getCityName();
		//System.out.println(codes);
//		try {
//			codes=code_retrieve.retrieveCountryCodes();
//			System.out.println(codes);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		
//		System.out.println("//////////////////////////////");
//		
//		
//		HashMap<String,String> list;
//		
//		try {
//			list = code_retrieve.retrieveCountryName();
//			System.out.println(list);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		
//		
//		
//		System.out.println("//////////////////////////////");
//		
//		
//		HashMap<String, String> capitals;
//		
//		try {
//			capitals = code_retrieve.retrieveCityName();
//			System.out.println(capitals);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
	}

}
