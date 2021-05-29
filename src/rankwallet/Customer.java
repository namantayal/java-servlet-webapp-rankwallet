package rankwallet;
import java.util.UUID;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Customer {
	public static boolean register(String name, String phone, String dob, String pass) {
		try{
			
			Class.forName("com.mysql.cj.jdbc.Driver");  
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/","root","root");  
            Statement st= con.createStatement();
            st.execute("CREATE DATABASE IF NOT EXISTS rankwallet");
            st.execute("USE rankwallet");
            st.execute("CREATE TABLE IF NOT EXISTS customer(Phone varchar(11) PRIMARY KEY,Name varchar(20),Dob varchar(15),Pass varchar(40),Bal Int)");
            String query=String.format("Select *  FROM customer WHERE phone='%s'", phone);
            ResultSet rs=st.executeQuery(query);
            if(rs.next()) {
            	st.close();
            	con.close();
            	return false;
            }
            else {
            	query=String.format("Insert INTO customer(Phone,Name,Dob,Pass,Bal) VALUES('%s','%s','%s','%s',0)", phone,name,dob,Encrypt.getMd5(pass));
            	st.executeUpdate(query);
            	st.close();
            	con.close();
            	return true;
            }
        }
		catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
	}
	
	public static boolean auth(String phone, String pass) {
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");  
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/","root","root");  
            Statement st= con.createStatement();
            st.execute("USE rankwallet");
            String query=String.format("Select *  FROM customer WHERE phone='%s'", phone);
            ResultSet rs=st.executeQuery(query);
            if(!rs.next()) {
            	st.close();
            	con.close();
            	return false;
            }
            else {
            	String storedPass=rs.getString("Pass");
            	if(storedPass.equalsIgnoreCase(Encrypt.getMd5(pass))) {
            		st.close();
                	con.close();
            		return true;
            	}
            	else {
            		st.close();
                	con.close();
            		return false;
            	}
            }
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
		
	}
	
	public static String getInfo(String phone, String info) {
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");  
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/","root","root");  
            Statement st= con.createStatement();
            st.execute("USE rankwallet");
            String query=String.format("Select *  FROM customer WHERE phone='%s'", phone);
            ResultSet rs=st.executeQuery(query);
            rs.next();
            String data=rs.getString(info);
            st.close();
        	con.close();
            return data;
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
		
	}
	public static void delete(String phone) {
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");  
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/","root","root");  
            Statement st= con.createStatement();
            st.execute("USE rankwallet");
            String query=String.format("DELETE FROM customer WHERE Phone='%s'",phone);
            st.executeUpdate(query);
            st.close();
        	con.close();
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public static boolean checkExist(String phone) {
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");  
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/","root","root");  
            Statement st= con.createStatement();
            st.execute("USE rankwallet");
            String query=String.format("Select *  FROM customer WHERE phone='%s'", phone);
            ResultSet rs=st.executeQuery(query);
            boolean flag=(!rs.next());
            st.close();
        	con.close();
            if(flag)
            	return false;
            else
            	return true;
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
	}
	
	public static void addBalance(String phone,String amount,UUID uuid, String sendphone) {
		try{
			LocalDateTime myDateObj = LocalDateTime.now();
		    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
		    String formattedDate = myDateObj.format(myFormatObj);
			Class.forName("com.mysql.cj.jdbc.Driver");  
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/","root","root");  
            Statement st= con.createStatement();
            st.execute("USE rankwallet");
            String query=String.format("CREATE TABLE IF NOT EXISTS c%s(Id INT PRIMARY KEY AUTO_INCREMENT,T_ID varchar(40) ,Mode varchar(20),sendphone varchar(20),Amount INT,time varchar(30))",phone);
            st.execute(query);
            query=String.format("Update customer SET Bal= bal + %s WHERE Phone='%s'",amount,phone);
            st.executeUpdate(query);
            query=String.format("Insert INTO c%s(T_ID,Mode,sendphone,Amount,time) VALUES('%s','%s','%s','%s','%s')",phone,uuid,"Added from",sendphone,amount,formattedDate);
            st.executeUpdate(query);
            st.close();
        	con.close();
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public static boolean sendBalance(String phone,String amount,UUID uuid, String sendphone) {
		try{
			LocalDateTime myDateObj = LocalDateTime.now();
		    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
		    String formattedDate = myDateObj.format(myFormatObj);
			Class.forName("com.mysql.cj.jdbc.Driver");  
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/","root","root");  
            Statement st= con.createStatement();
            st.execute("USE rankwallet");
            String query=String.format("Select *  FROM customer WHERE phone='%s'", phone);
            ResultSet rs=st.executeQuery(query);
            rs.next();
            String data=rs.getString("Bal");
            if(Integer.parseInt(data)<Integer.parseInt(amount)) {
            	return false;
            }
            else {
            	String query1=String.format("CREATE TABLE IF NOT EXISTS c%s(Id INT PRIMARY KEY AUTO_INCREMENT,T_ID varchar(40),Mode varchar(20),sendphone varchar(20),Amount INT,time varchar(30))",phone);
                st.execute(query1);
            	query=String.format("Update customer SET Bal= bal - %s WHERE Phone='%s'",amount,phone);
            	st.executeUpdate(query);
            	query=String.format("Insert INTO c%s(T_ID,Mode,sendphone,Amount,time) VALUES('%s','%s','%s','%s','%s')",phone,uuid,"Sent to",sendphone,amount,formattedDate);
            	st.executeUpdate(query);
            }
            st.close();
        	con.close();
        	return true;
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
	}
	
	public static ResultSet transaction(String phone) {
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");  
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/","root","root");  
            Statement st= con.createStatement();
            st.execute("USE rankwallet");
            String query=String.format("Select *  FROM c%s", phone);
            ResultSet rs=st.executeQuery(query);
            return rs;
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
}
