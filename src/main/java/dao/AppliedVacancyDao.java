package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.AppliedVacancy;
import model.User;

public class AppliedVacancyDao {
	 private Connection con;
     private String query;
     private PreparedStatement pst;
     private ResultSet rs;
     
     public  AppliedVacancyDao(Connection con){
    	 this.con=con;
 	}
     
     public boolean addAppliedApplication(AppliedVacancy u) {
   	  boolean f=false;
   	  try {
   		  String sql="insert into appliedvacancy(vid,postid,company,jobrole,locaton,descr,available,uid,jobseeker,email) values(?,?,?,?,?,?,?,?,?,?)";
   		  pst=this.con.prepareStatement(sql);
   		  pst.setInt(1, u.getVid());
   		  pst.setInt(2, u.getPostid());
   		  pst.setString(3, u.getCompany());
   		  pst.setString(4, u.getJobrole());
   		  pst.setString(5, u.getLocation());
   		  pst.setString(6, u.getDescr());
   		  pst.setString(7, u.getAvail());
   		  pst.setInt(8, u.getUid());
   		  pst.setString(9, u.getJobseekname());
   		  pst.setString(10, u.getEmail());
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
     public List<AppliedVacancy> getApplication(int recrui){ 
     	List<AppliedVacancy> v=new ArrayList<>();
     	try {
     	query ="select * from  appliedvacancy where postid=?";
     	pst=this.con.prepareStatement(query);
     	pst.setInt(1,recrui);
     	rs=pst.executeQuery();
     	while (rs.next()) {
 			AppliedVacancy vadd=new AppliedVacancy();
 			vadd.setAid(rs.getInt(1));
 			vadd.setVid(rs.getInt(2));
 			vadd.setPostid(rs.getInt(3));
 			vadd.setCompany(rs.getString(4));
 			vadd.setJobrole(rs.getString(5));
 			vadd.setLocation(rs.getString(6));
 			vadd.setDescr(rs.getString(7));
 			vadd.setAvail(rs.getString(8));
 			vadd.setUid(rs.getInt(9));
 			vadd.setJobseekname(rs.getString(10));
 			vadd.setEmail(rs.getString(11));
 			v.add(vadd);
 		}
     	}
     	catch (Exception e) {
 			e.printStackTrace();
 			System.out.println(e.getMessage());
 		}
     	return v;
     }
     public List<AppliedVacancy> getApplicationUser(int uid){ 
      	List<AppliedVacancy> v=new ArrayList<>();
      	try {
      	query ="select * from  appliedvacancy where uid=?";
      	pst=this.con.prepareStatement(query);
      	pst.setInt(1,uid);
      	rs=pst.executeQuery();
      	while (rs.next()) {
  			AppliedVacancy vadd=new AppliedVacancy();
  			vadd.setAid(rs.getInt(1));
  			vadd.setVid(rs.getInt(2));
  			vadd.setPostid(rs.getInt(3));
  			vadd.setCompany(rs.getString(4));
  			vadd.setJobrole(rs.getString(5));
  			vadd.setLocation(rs.getString(6));
  			vadd.setDescr(rs.getString(7));
  			vadd.setAvail(rs.getString(8));
  			vadd.setUid(rs.getInt(9));
  			vadd.setJobseekname(rs.getString(10));
  			vadd.setEmail(rs.getString(11));
  			v.add(vadd);
  		}
      	}
      	catch (Exception e) {
  			e.printStackTrace();
  			System.out.println(e.getMessage());
  		}
      	return v;
      }
}
