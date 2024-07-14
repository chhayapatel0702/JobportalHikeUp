package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Vacancy;

public class VacancyDao {
    private Connection con;
    private String query;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public VacancyDao(Connection con) {
		this.con=con;
	}
    
    public boolean addVacancy(Vacancy v) throws Exception {
    	boolean f=false;
    	String sql="insert into vacancy(cname,title,place,descri,sal,sdate,edate,status,recrui) values(?,?,?,?,?,?,?,?,?)";
    	ps=this.con.prepareStatement(sql);
    	ps.setString(1, v.getCname());
		ps.setString(2, v.getTitle());
		ps.setString(3, v.getPlace());
		ps.setString(4, v.getDesc());
		ps.setInt(5, v.getSalary());
		ps.setString(6, v.getSdate());
		ps.setString(7, v.getEdate());
		ps.setString(8, v.getStatus());
		ps.setInt(9, v.getPostid());
		int i=ps.executeUpdate();
    	if(i==1){
    		f=true;
    	}
    	return f;
    }
    public List<Vacancy> getAllVacancy(){ 
    	List<Vacancy> v=new ArrayList<>();
    	try {
    	query ="select * from  vacancy";
    	ps=this.con.prepareStatement(query);
    	rs=ps.executeQuery();
    	while (rs.next()) {
			Vacancy vadd=new Vacancy();
			vadd.setVid(rs.getInt(1));
			vadd.setCname(rs.getString(2));
			vadd.setTitle(rs.getString(3));
			vadd.setPlace(rs.getString(4));
			vadd.setDesc(rs.getString(5));
			vadd.setSalary(rs.getInt(6));
			vadd.setSdate(rs.getString(7));
			vadd.setEdate(rs.getString(8));
			vadd.setStatus(rs.getString(9));
			vadd.setPostid(rs.getInt(10));
			v.add(vadd);
		}
    	}
    	catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
    	return v;
    }
    
    public Vacancy getVacancyById(int vid)throws Exception {
    	Vacancy c=new Vacancy();
    		String sql="select * from vacancy where vid=?";
    		ps=this.con.prepareStatement(sql);
    		ps.setInt(1, vid);
    		rs=ps.executeQuery();
    		while(rs.next()) 
    		{ 
    			c.setVid(rs.getInt("vid"));
    			c.setCname(rs.getString("cname"));
    			c.setTitle(rs.getString("title"));
    			c.setPlace(rs.getString("place"));
    			c.setDesc(rs.getString("descri"));
    			c.setSalary(rs.getInt("sal"));
    			c.setSdate(rs.getString("sdate"));
    			c.setEdate(rs.getString("edate"));
    			c.setStatus(rs.getString("status"));
    			c.setPostid(rs.getInt("recrui"));
    		}
    		return c;
    }
    
    public boolean updateVacancy(Vacancy v){
    	boolean f=false;
    	try {
    	String sql="update vacancy set cname=?,title=?,place=?,descri=?,sal=?,sdate=?,edate=?,status=? where vid=?";
    	ps=this.con.prepareStatement(sql);
    	ps.setString(1, v.getCname());
		ps.setString(2, v.getTitle());
		ps.setString(3, v.getPlace());
		ps.setString(4, v.getDesc());
		ps.setInt(5, v.getSalary());
		ps.setString(6, v.getSdate());
		ps.setString(7, v.getEdate());
		ps.setString(8, v.getStatus());
		ps.setInt(9, v.getVid());
		int i=ps.executeUpdate();
    	if(i==1){
    		f=true;
    	}}catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
    	
    	return f;
    }
    public boolean deleteVacancy(int id)throws Exception{
    	boolean f=false;
    	String sql="delete from vacancy where vid=?";
    	ps=this.con.prepareStatement(sql);
    	ps.setInt(1, id);
    	int i=ps.executeUpdate();
    	if(i==1){
    		f=true;
    	}
    	return f;
    }
    
    public List<Vacancy> getAllVacancyUser(int id){ 
    	List<Vacancy> v=new ArrayList<>();
    	try {
    	query ="select * from vacancy where vid not in (select vid from appliedvacancy where uid =?) and status='Active';" ;
    	ps=this.con.prepareStatement(query);
    	ps.setInt(1, id);
    	rs=ps.executeQuery();
    	while (rs.next()) {
			Vacancy vadd=new Vacancy();
			vadd.setVid(rs.getInt(1));
			vadd.setCname(rs.getString(2));
			vadd.setTitle(rs.getString(3));
			vadd.setPlace(rs.getString(4));
			vadd.setDesc(rs.getString(5));
			vadd.setSalary(rs.getInt(6));
			vadd.setSdate(rs.getString(7));
			vadd.setEdate(rs.getString(8));
			vadd.setStatus(rs.getString(9));
			vadd.setPostid(rs.getInt(10));
			vadd.setClick(rs.getString(11));
			v.add(vadd);
		}
    	}
    	catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
    	return v;
    }
    
    public List<Vacancy> getAllVacancyUserOR(int id,String title,String place, String descri){ 
    	List<Vacancy> v=new ArrayList<>();
    	try {
    	query ="SELECT * FROM vacancy WHERE vid NOT IN (SELECT vid FROM appliedvacancy WHERE uid = ?) AND (title = ? or place = ? or descri = ?);";
    	ps=this.con.prepareStatement(query);
    	ps.setInt(1, id);
        ps.setString(2, title);
        ps.setString(3, place);
        ps.setString(4, descri);
    	rs=ps.executeQuery();
    	while (rs.next()) {
			Vacancy vadd=new Vacancy();
			vadd.setVid(rs.getInt(1));
			vadd.setCname(rs.getString(2));
			vadd.setTitle(rs.getString(3));
			vadd.setPlace(rs.getString(4));
			vadd.setDesc(rs.getString(5));
			vadd.setSalary(rs.getInt(6));
			vadd.setSdate(rs.getString(7));
			vadd.setEdate(rs.getString(8));
			vadd.setStatus(rs.getString(9));
			vadd.setPostid(rs.getInt(10));
			v.add(vadd);
		}
    	}
    	catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
    	return v;
    }
    
    public List<Vacancy> getAllVacancyUserAND(int id,String title,String place, String descri){ 
    	List<Vacancy> v=new ArrayList<>();
    	try {
    	query ="SELECT * FROM vacancy WHERE vid NOT IN (SELECT vid FROM appliedvacancy WHERE uid = ?) AND (title = ? and place = ? and descri = ?)";
    	ps=this.con.prepareStatement(query);
    	ps.setInt(1, id);
        ps.setString(2, title);
        ps.setString(3, place);
        ps.setString(4, descri);
    	rs=ps.executeQuery();
    	while (rs.next()) {
			Vacancy vadd=new Vacancy();
			vadd.setVid(rs.getInt(1));
			vadd.setCname(rs.getString(2));
			vadd.setTitle(rs.getString(3));
			vadd.setPlace(rs.getString(4));
			vadd.setDesc(rs.getString(5));
			vadd.setSalary(rs.getInt(6));
			vadd.setSdate(rs.getString(7));
			vadd.setEdate(rs.getString(8));
			vadd.setStatus(rs.getString(9));
			vadd.setPostid(rs.getInt(10));
			v.add(vadd);
		}
    	}
    	catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
    	return v;
    }
    public  int countCompany() {
   	 int totalCount = 0;
  	  try {
  		  String sql="SELECT COUNT(DISTINCT cname) AS count FROM vacancy";
  		  ps=this.con.prepareStatement(sql);
  		  rs=ps.executeQuery();
  		 if (rs.next()) {
           totalCount = rs.getInt("count");
       }
  	  }
  	  catch (Exception e) {
			e.printStackTrace();
		}
  	  return totalCount;
   }
    
    public boolean appliedVacancy(Vacancy v){
    	boolean f=false;
    	try {
    	String sql="update vacancy set click=? where vid=?";
    	ps=this.con.prepareStatement(sql);
		ps.setString(1, v.getClick());
		ps.setInt(2, v.getVid());
		int i=ps.executeUpdate();
    	if(i==1){
    		f=true;
    	}}catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
    	
    	return f;
    }
    public List<Vacancy> getAllVacancyRUser(int recrui){ 
    	List<Vacancy> v=new ArrayList<>();
    	try {
    	query ="select * from  vacancy where recrui=?";
    	ps=this.con.prepareStatement(query);
    	ps.setInt(1,recrui);
    	rs=ps.executeQuery();
    	while (rs.next()) {
			Vacancy vadd=new Vacancy();
			vadd.setVid(rs.getInt(1));
			vadd.setCname(rs.getString(2));
			vadd.setTitle(rs.getString(3));
			vadd.setPlace(rs.getString(4));
			vadd.setDesc(rs.getString(5));
			vadd.setSalary(rs.getInt(6));
			vadd.setSdate(rs.getString(7));
			vadd.setEdate(rs.getString(8));
			vadd.setStatus(rs.getString(9));
			vadd.setPostid(rs.getInt(10));
			vadd.setClick(rs.getString(11));
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
