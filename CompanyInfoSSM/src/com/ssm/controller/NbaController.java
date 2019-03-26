package com.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.entity.Msg;
import com.ssm.entity.NbaAdmin;
import com.ssm.entity.NbaPerson;
import com.ssm.entity.NbaTeam;
import com.ssm.service.NbaService;

@Controller
public class NbaController {
	@Autowired
	private NbaService nbaService;
	
	//管理员登录
	@RequestMapping("/login")
	public String login(String name,String password,Model model) {
		if(nbaService.login(name, password)) {
			
			return "redirect:/query";
		}else {
			model.addAttribute("loginFlag", "请正确输入用户名或者密码");
			return "forward:/index.jsp";
		}
	}
	//球员添加
	@RequestMapping("/add")
	public String addPerson(String name, int height,String address,int age,String email,int team_id,Model model) {
		NbaPerson n=new NbaPerson();
		n.setName(name);
		n.setHeight(height);
		n.setAddress(address);
		n.setAge(age);
		n.setEmail(email);
		n.setTeam_id(team_id);
		nbaService.addPerson(n);
		model.addAttribute("add","插入成功");
		return "forward:/index.jsp";
	}
	//用json方式的分页
	@RequestMapping("/json")
	@ResponseBody
	public Msg getPageWithJSON(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model) {
		PageHelper.startPage(pn, 5);
		List<NbaPerson> emy=nbaService.getAll();
		PageInfo page=new PageInfo(emy,5);
		//构造的一个MSG方法用于对服务器相应后的结果的一个现实，pageinfo-k,page-v
		return Msg.success().add("pageInfo", page);
	}
	@RequestMapping(value="/query")
	//普通的分页界面
	public String query(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model) {
		PageHelper.startPage(pn, 5);
		List<NbaPerson> emy=nbaService.getAll();
		PageInfo page=new PageInfo(emy,5);
		model.addAttribute("pageInfo", page);
		return "list";
	}
	//删除方法
	@ResponseBody
	@RequestMapping(value="/json/{id}",method=RequestMethod.DELETE)
	public Msg delPerson(@PathVariable("id") int id) {
		nbaService.delPerson(id);
		return Msg.success();
	}
	//更新球员信息
	@ResponseBody
	@RequestMapping(value="/edit/{id}",method=RequestMethod.GET)
	public Msg editPerson(NbaPerson nbaPerson) {
		nbaService.editPerson(nbaPerson);
		return Msg.success();
		
	}
	//根据id查询员工在编辑框里
	@RequestMapping(value= "/emy/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg queryById(@PathVariable("id") int id) {
		NbaPerson nbaPerson = nbaService.queryByid(id);
		return Msg.success().add("person", nbaPerson);
		
	}
	
	@ResponseBody
	@RequestMapping("/dept")
	public Msg depts() {
		List<NbaTeam> depts=nbaService.getAllDepts();
		return Msg.success().add("dept", depts);
	}
	
}