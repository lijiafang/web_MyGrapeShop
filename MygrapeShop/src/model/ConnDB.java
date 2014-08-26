package model;
import java.sql.*;
public class ConnDB {
	private Connection connection=null;
	public Connection getConn(){
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/grapeshop","root","lijiafang");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return connection;
		
	}
}
