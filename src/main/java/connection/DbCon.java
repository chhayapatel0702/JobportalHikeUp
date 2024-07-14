package connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbCon {
  private static Connection connection=null;
  
  public static Connection getConnection()throws Exception {
	  if(connection==null) {
		  Class.forName("com.mysql.cj.jdbc.Driver");
		  connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","root");
		  System.out.println("connected");
	  }
	  return connection;
  }
  
  
  
  
}
