package model;

public class AppliedVacancy {
    private int uid;
    private String jobseekname;
    private String email;
	private int aid;
	private int vid;
	private int postid;
	private String company;
	private String jobrole;
	private String location;
	private String descr;
	private String avail;
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public int getVid() {
		return vid;
	}
	public void setVid(int vid) {
		this.vid = vid;
	}
	public int getPostid() {
		return postid;
	}
	public void setPostid(int postid) {
		this.postid = postid;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getJobrole() {
		return jobrole;
	}
	public void setJobrole(String jobrole) {
		this.jobrole = jobrole;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	public String getAvail() {
		return avail;
	}
	public void setAvail(String avail) {
		this.avail = avail;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getJobseekname() {
		return jobseekname;
	}
	public void setJobseekname(String jobseekname) {
		this.jobseekname = jobseekname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public AppliedVacancy(int uid, String jobseekname, String email, int aid, int vid, int postid, String company,
			String jobrole, String location, String descr, String avail) {
		super();
		this.uid = uid;
		this.jobseekname = jobseekname;
		this.email = email;
		this.aid = aid;
		this.vid = vid;
		this.postid = postid;
		this.company = company;
		this.jobrole = jobrole;
		this.location = location;
		this.descr = descr;
		this.avail = avail;
	}
	public AppliedVacancy() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "AppliedVacancy [uid=" + uid + ", jobseekname=" + jobseekname + ", email=" + email + ", aid=" + aid
				+ ", vid=" + vid + ", postid=" + postid + ", company=" + company + ", jobrole=" + jobrole
				+ ", location=" + location + ", descr=" + descr + ", avail=" + avail + "]";
	}
	
}
