package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.User;
import model.Vacancy;

public class UserDao {
     private Connection con;
     private String query;
     private PreparedStatement pst;
     private ResultSet rs;
     
     public UserDao(Connection con) {
		this.con=con;
	}
     public User userLogin(String username, String password) {
    	 User user=null;
    	 
    	 try {
			 query="select * from user where username=? and password=?";
			 pst=this.con.prepareStatement(query);
			 pst.setString(1, username);
			 pst.setString(2, password);
			 rs=pst.executeQuery();
			 if(rs.next()) {
				 user=new User();
				 user.setId(rs.getInt("id"));
				 user.setName(rs.getString("name"));
				 user.setUsername(rs.getString("username"));
				 user.setEmail(rs.getString("email"));
				 user.setPassword(rs.getString("password"));
				 user.setRole(rs.getString("role"));
				 user.setClname(rs.getString("clname"));
				 user.setRerole(rs.getString("workrole"));
				 user.setSkill1(rs.getString("skill1"));
				 user.setSkill2(rs.getString("skill2"));
				 user.setSkill3(rs.getString("skill3"));
				 user.setSkill4(rs.getString("skill4"));
				 user.setSkill5(rs.getString("skill5"));
				 user.setCerti1(rs.getString("certi1"));
				 user.setCerti2(rs.getString("certi2"));
				 user.setCerti3(rs.getString("certi3"));
				 user.setPhoto(rs.getString("photo"));
			 }
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
    	 return user;
     }
     public User userInfo() {
    	 User user=null;
    	 try {
			 query="select * from user";
			 pst=this.con.prepareStatement(query);
			 rs=pst.executeQuery();
			 if(rs.next()) {
				 user=new User();
				 user.setId(rs.getInt("id"));
				 user.setName(rs.getString("name"));
				 user.setUsername(rs.getString("username"));
				 user.setEmail(rs.getString("email"));
				 user.setPassword(rs.getString("password"));
				 user.setRole(rs.getString("role"));
			 }
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
    	 
    	 return user;
     }
     
     public boolean addUser(User u) {
    	  boolean f=false;
    	  try {
    		  String sql="insert into user(name,username,email,password,role) values(?,?,?,?,?)";
    		  pst=this.con.prepareStatement(sql);
    		  pst.setString(1, u.getName());
    		  pst.setString(2, u.getUsername());
    		  pst.setString(3, u.getEmail());
    		  pst.setString(4, u.getPassword());
    		  pst.setString(5, u.getRole());
    		  int i=pst.executeUpdate();
    		  if(i==1) {
    			  f=true;
    		  }
    	  }
    	  catch (Exception e) {
			e.printStackTrace();
		}
    	  return f;
     }
     public boolean editProfile(User v){
     	boolean f=false;
     	try {
     	String sql="update user set name=?,clname=?,workrole=?,photo=? where id=?";
     	pst=this.con.prepareStatement(sql);
     	pst.setString(1, v.getName());
     	pst.setString(2, v.getClname());
     	pst.setString(3, v.getRerole());
     	pst.setString(4, v.getPhoto());
     	pst.setInt(5, v.getId());
 		int i=pst.executeUpdate();
 		//con.commit();
     	if(i==1){
     		f=true;
     	}}catch (Exception e) {
 			e.printStackTrace();
 			System.out.println(e.getMessage());
 		}
     	
     	return f;
     }
     public boolean editSkills(User v){
      	boolean f=false;
      	try {
      	String sql="update user set skill1=?,skill2=?,skill3=?,skill4=?,skill5=? where id=?";
      	pst=this.con.prepareStatement(sql);
      	pst.setString(1, v.getSkill1());
      	pst.setString(2, v.getSkill2());
      	pst.setString(3, v.getSkill3());
      	pst.setString(4, v.getSkill4());
      	pst.setString(5, v.getSkill5());
      	pst.setInt(6, v.getId());
  		int i=pst.executeUpdate();
      	if(i==1){
      		f=true;
      	}}catch (Exception e) {
  			e.printStackTrace();
  			System.out.println(e.getMessage());
  		}
      	
      	return f;
      }
     public  int countUser() {
    	 int totalCount = 0;
   	  try {
   		  String sql=" select count(*) as usercount from user where role='Jobseeker'";
   		  pst=this.con.prepareStatement(sql);
   		  rs=pst.executeQuery();
   		 if (rs.next()) {
            totalCount = rs.getInt("usercount");
        }
   	  }
   	  catch (Exception e) {
			e.printStackTrace();
		}
   	  return totalCount;
    }
     public  int countRecruiter() {
    	 int totalCount = 0;
   	  try {
   		  String sql=" select count(*) as usercount from user where role='Recruiter'";
   		  pst=this.con.prepareStatement(sql);
   		  rs=pst.executeQuery();
   		 if (rs.next()) {
            totalCount = rs.getInt("usercount");
        }
   	  }
   	  catch (Exception e) {
			e.printStackTrace();
		}
   	  return totalCount;
    }
    
    public List<User> showDetailsUser() throws Exception {
    	List<User> v=new ArrayList<>();
    	 String sql=" select * from user where role='Jobseeker'";
  		 pst=this.con.prepareStatement(sql);
  		 rs=pst.executeQuery();
  		 while(rs.next()){
  			 User user=new User();
  			 user.setId(rs.getInt("id"));
			 user.setName(rs.getString("name"));
			 user.setRerole(rs.getString("workrole"));	
			 v.add(user);
  		 }
    	return v;
    }
    public List<User> showDetailsRecruiter() throws Exception {
    	List<User> v=new ArrayList<>();
    	 String sql=" select * from user where role='Recruiter'";
  		 pst=this.con.prepareStatement(sql);
  		 rs=pst.executeQuery();
  		 while(rs.next()){
  			 User user=new User();
  			 user.setId(rs.getInt("id"));
			 user.setName(rs.getString("name"));
			 user.setEmail(rs.getString("email"));
			 v.add(user);
  		 }
    	return v;
    }
    public boolean editCourse(User v){
      	boolean f=false;
      	try {
      	String sql="update user set certi1=?,certi2=?,certi3=? where id=?";
      	pst=this.con.prepareStatement(sql);
      	pst.setString(1, v.getCerti1());
      	pst.setString(2, v.getCerti2());
      	pst.setString(3, v.getCerti3());
      	pst.setInt(4, v.getId());
  		int i=pst.executeUpdate();
      	if(i==1){
      		f=true;
      	}}catch (Exception e) {
  			e.printStackTrace();
  			System.out.println(e.getMessage());
  		}
      	
      	return f;
      }
}
