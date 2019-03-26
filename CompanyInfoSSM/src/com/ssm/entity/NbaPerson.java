package com.ssm.entity;

public class NbaPerson {
	private int id;
	private String name;
	private int height;
	private String address;
	private int age;
	private String email;
	private int team_id;
	private NbaTeam nbaTeam;
	public NbaPerson() {
		super();
	}
	public NbaPerson(int id, String name, int height, String address, int age, String email, int team_id) {
		super();
		this.id = id;
		this.name = name;
		this.height = height;
		this.address = address;
		this.age = age;
		this.email = email;
		this.team_id = team_id;
	}
	public NbaTeam getNbaTeam() {
		return nbaTeam;
	}
	public void setNbaTeam(NbaTeam nbaTeam) {
		this.nbaTeam = nbaTeam;
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
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getTeam_id() {
		return team_id;
	}
	public void setTeam_id(int team_id) {
		this.team_id = team_id;
	}
	
	
}
