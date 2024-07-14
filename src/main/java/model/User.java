package model;

public class User {
    private int id;
	private String name;
    private String username;
    private String email;
    private String password;
    private String role;
    private String clname;
	private String rerole;
	private String skill1;
	private String skill2;
	private String skill3;
	private String skill4;
	private String skill5;
	private String certi1;
	private String certi2;
	private String certi3;
	private String photo;
    
    public User() {
    	
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}

	public String getClname() {
		return clname;
	}

	public void setClname(String clname) {
		this.clname = clname;
	}

	public String getRerole() {
		return rerole;
	}

	public void setRerole(String rerole) {
		this.rerole = rerole;
	}

	public String getSkill1() {
		return skill1;
	}

	public void setSkill1(String skill1) {
		this.skill1 = skill1;
	}

	public String getSkill2() {
		return skill2;
	}

	public void setSkill2(String skill2) {
		this.skill2 = skill2;
	}

	public String getSkill3() {
		return skill3;
	}

	public void setSkill3(String skill3) {
		this.skill3 = skill3;
	}

	public String getSkill4() {
		return skill4;
	}

	public void setSkill4(String skill4) {
		this.skill4 = skill4;
	}

	public String getSkill5() {
		return skill5;
	}

	public void setSkill5(String skill5) {
		this.skill5 = skill5;
	}

	public String getCerti1() {
		return certi1;
	}

	public void setCerti1(String certi1) {
		this.certi1 = certi1;
	}

	public String getCerti2() {
		return certi2;
	}

	public void setCerti3(String certi3) {
		this.certi3 = certi3;
	}
	public String getCerti3() {
		return certi3;
	}

	public void setCerti2(String certi2) {
		this.certi2 = certi2;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public User(int id, String name, String username, String email, String password, String role, String clname,
			String rerole, String skill1, String skill2, String skill3, String skill4, String skill5, String certi1,
			String certi2, String certi3, String photo) {
		super();
		this.id = id;
		this.name = name;
		this.username = username;
		this.email = email;
		this.password = password;
		this.role = role;
		this.clname = clname;
		this.rerole = rerole;
		this.skill1 = skill1;
		this.skill2 = skill2;
		this.skill3 = skill3;
		this.skill4 = skill4;
		this.skill5 = skill5;
		this.certi1 = certi1;
		this.certi2 = certi2;
		this.certi3 = certi3;
		this.photo = photo;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", username=" + username + ", email=" + email + ", password="
				+ password + ", role=" + role + ", clname=" + clname + ", rerole=" + rerole + ", skill1=" + skill1
				+ ", skill2=" + skill2 + ", skill3=" + skill3 + ", skill4=" + skill4 + ", skill5=" + skill5
				+ ", certi1=" + certi1 + ", certi2=" + certi2 + ", certi3=" + certi3 + ", photo=" + photo + "]";
	}

	
	
    
    
}
