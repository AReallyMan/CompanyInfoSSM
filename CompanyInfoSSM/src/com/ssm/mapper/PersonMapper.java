package com.ssm.mapper;

import java.util.List;

import com.ssm.entity.NbaAdmin;
import com.ssm.entity.NbaPerson;
import com.ssm.entity.NbaTeam;

public interface PersonMapper {
	public int addPerson(NbaPerson nbaPerson);
	public List<NbaAdmin> queryAdmin(NbaAdmin nbaAdmin);
	public List<NbaPerson> queryAll(NbaPerson nbaPerson);
	public void delPerson(int id);
	public int editPerson(NbaPerson nbaPerson);
	public NbaPerson queryAllById(int id);
	List<NbaTeam> queryDept(NbaTeam example);
}
