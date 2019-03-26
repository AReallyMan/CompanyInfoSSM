package com.ssm.service;

import java.util.List;

import com.ssm.entity.NbaAdmin;
import com.ssm.entity.NbaPerson;
import com.ssm.entity.NbaTeam;

public interface NbaService {
	public void addPerson(NbaPerson nbaPerson);
	public boolean login(String name,String password);
	public List<NbaPerson> getAll();
	public void delPerson(int id);
	public void editPerson(NbaPerson nbaPerson);
	public NbaPerson queryByid(int id);
	public List<NbaTeam> getAllDepts();
}
