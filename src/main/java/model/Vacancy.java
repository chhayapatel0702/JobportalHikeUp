package model;

public class Vacancy {
  private int vid;
  private String cname;
  private String title;
  private String place;
  private String descri;
  private int sal;
  private String sdate;
  private String edate;
  private String status;
  private int postid;
  private String click;
  
  public Vacancy() {
	// TODO Auto-generated constructor stub
}

public int getVid() {
	return vid;
}

public void setVid(int vid) {
	this.vid = vid;
}

public String getCname() {
	return cname;
}

public void setCname(String cname) {
	this.cname = cname;
}

public String getTitle() {
	return title;
}

public void setTitle(String title) {
	this.title = title;
}

public String getPlace() {
	return place;
}

public void setPlace(String place) {
	this.place = place;
}

public String getDesc() {
	return descri;
}

public void setDesc(String descri) {
	this.descri = descri;
}

public int getSalary() {
	return sal;
}

public void setSalary(int salary) {
	this.sal = salary;
}

public String getSdate() {
	return sdate;
}

public void setSdate(String sdate) {
	this.sdate = sdate;
}

public String getEdate() {
	return edate;
}

public void setEdate(String edate) {
	this.edate = edate;
}

public String getStatus() {
	return status;
}

public void setStatus(String status) {
	this.status = status;
}

public int getPostid() {
	return postid;
}

public void setPostid(int postid) {
	this.postid = postid;
}

public String getClick() {
	return click;
}

public void setClick(String click) {
	this.click = click;
}

public Vacancy(int vid, String cname, String title, String place, String descri, int sal, String sdate, String edate,
		String status, int postid, String click) {
	super();
	this.vid = vid;
	this.cname = cname;
	this.title = title;
	this.place = place;
	this.descri = descri;
	this.sal = sal;
	this.sdate = sdate;
	this.edate = edate;
	this.status = status;
	this.postid = postid;
	this.click = click;
}

@Override
public String toString() {
	return "Vacancy [vid=" + vid + ", cname=" + cname + ", title=" + title + ", place=" + place + ", descri=" + descri
			+ ", sal=" + sal + ", sdate=" + sdate + ", edate=" + edate + ", status=" + status + ", postid=" + postid
			+ ", click=" + click + "]";
}

}
