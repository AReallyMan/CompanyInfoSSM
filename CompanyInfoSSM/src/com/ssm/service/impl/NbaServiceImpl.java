package com.ssm.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.entity.NbaAdmin;
import com.ssm.entity.NbaPerson;
import com.ssm.entity.NbaTeam;
import com.ssm.mapper.PersonMapper;
import com.ssm.service.NbaService;
@Service
public class NbaServiceImpl implements NbaService {
	@Autowired
	private PersonMapper personMapper;
	public void addPerson(NbaPerson nbaPerson) {
		
		personMapper.addPerson(nbaPerson);
		
	}
	
	public boolean login(String name,String password) {
		boolean flag=false;
		List<NbaAdmin> list=new ArrayList<NbaAdmin>();
		NbaAdmin nbaAdmin=new NbaAdmin();
		nbaAdmin.setName(name);
		nbaAdmin.setPassword(password);
		list = this.personMapper.queryAdmin(nbaAdmin);
		if(list.size()>0) {
			flag=true;
		}
		return flag;
		
	}

	@Override
	public List<NbaPerson> getAll() {
		List<NbaPerson> list = personMapper.queryAll(null);
		return list;
	}

	@Override
	public void delPerson(int id) {
		personMapper.delPerson(id);
	}

	@Override
	public void editPerson(NbaPerson nbaPerson) {
		personMapper.editPerson(nbaPerson);
	}

	@Override
	public NbaPerson queryByid(int id) {
		NbaPerson nbaPerson = personMapper.queryAllById(id);
		return nbaPerson;
	}

	public List<NbaTeam> getAllDepts() {
		List<NbaTeam> dept = personMapper.queryDept(null);
		return dept;
	}

	

}
