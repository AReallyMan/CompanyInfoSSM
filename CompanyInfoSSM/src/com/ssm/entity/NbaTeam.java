package com.ssm.entity;

public class NbaTeam {
	private int team_id;
	private String team_name;
	private NbaTeam nbaTeam;
	public NbaTeam getNbaTeam() {
		return nbaTeam;
	}
	public void setNbaTeam(NbaTeam nbaTeam) {
		this.nbaTeam = nbaTeam;
	}
	public NbaTeam() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NbaTeam(int team_id, String team_name) {
		super();
		this.team_id = team_id;
		this.team_name = team_name;
	}
	public int getTeam_id() {
		return team_id;
	}
	public void setTeam_id(int team_id) {
		this.team_id = team_id;
	}
	public String getTeam_name() {
		return team_name;
	}
	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}
	
}
