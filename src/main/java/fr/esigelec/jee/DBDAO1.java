package fr.esigelec.jee;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;

public class DBDAO1 {
	
	private List<String> countryCodes = new ArrayList<String>();
	private HashMap<String,String> countryName = new HashMap<>();
	private HashMap<String,String> cityName = new HashMap<>();
	private String user;
	private String pass;
	
	public DBDAO1 () {
		this.setCountryCode();
		this.setCountryNamee();
		this.setCityName();
	}
	
	
	public List<String> getCountryCode(){
		
		return countryCodes;
		
	}
	
	public String getCountryName(String countryCode) {
        String value="AUCUN RESULTAT";
        for(Entry<String, String> element :this.cityName.entrySet()) {
                  if(element.getKey().substring(0, 2).equals(countryCode)) {
                             value=element.getKey();
                  }
        }
        return value;
}
public String getCityName(String countryCode) {
        String value="AUCUN RESULTAT";
        for(Entry<String, String> element :this.cityName.entrySet()) {
                  if(element.getKey().substring(0, 2).equals(countryCode)) {
                             value= element.getValue();
                  }

        }
        return value;

}

	
	public void setCountryCode() {
		this.countryCodes.add("FR");
		this.countryCodes.add("ES");
		this.countryCodes.add("PT");
	}
	
	public List<String> getCountryCodes() {
		return countryCodes;
	}


	public void setCountryNamee() {
		this.countryName.put("FR","France");
		this.countryName.put("PT","Portugal");
		this.countryName.put("ES","Spain");
		
	}
	
	public void setCityName() {
		this.cityName.put("FR","Paris");
		this.cityName.put("PT","Lisbon");
		this.cityName.put("ES","Madrid");
		
	}
	
	public boolean validateUserCredentials(String user, String pass) {
		
		if (user.equals("javaee") && pass.equals("esigelec2021")) {
			
		return true;
		}
		
		else {
			return false;	
	}
}
}
