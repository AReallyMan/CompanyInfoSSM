package com.ssm.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mysql.jdbc.StringUtils;
import com.ssm.entity.Msg;
import com.ssm.entity.NbaAdmin;
import com.ssm.entity.NbaPerson;
import com.ssm.entity.NbaTeam;
import com.ssm.service.NbaService;
import com.ssm.util.CpachaUtil;
@RequestMapping("/view")
@Controller
public class NbaController {
	@Autowired
	private NbaService nbaService;
	//管理员登录
	@RequestMapping(value="/login",method=RequestMethod.POST)
	@ResponseBody
	public Map loginAct(NbaAdmin user,String name,String password,String cpacha,HttpServletRequest request) {
		Map<String,Object> map=new HashMap<String,Object>();
		if(user==null) {
			map.put("type", "error");
			map.put("msg", "输入信息不能为空");
			return map;
		}
		if(StringUtils.isEmptyOrWhitespaceOnly(user.getName())) {
			map.put("type", "error");
			map.put("msg", "输入姓名不能为空");
			return map;
		}
		if(StringUtils.isEmptyOrWhitespaceOnly(user.getPassword())) {
			map.put("type", "error");
			map.put("msg", "输入密码不能为空");
			return map;
		}
		Object loginCpacha = request.getSession().getAttribute("loginCpacha");
		if(loginCpacha==null) {
			map.put("type", "error");
			map.put("msg", "会话超时");
			return map;
		}
		if(!cpacha.toUpperCase().equals(loginCpacha.toString().toUpperCase())) {
			map.put("type", "error");
			map.put("msg", "验证码错误");
			return map;
		}
		
		if(nbaService.login(name, password)) {
			map.put("type", "success");
			map.put("msg", "登录成功");
			return map;
		}else {
			map.put("type", "error");
			map.put("msg", "用户名或者密码错误");
		}
		return map;
	}
	
	/**
	 * 本系统所有的验证码都来自这里
	 * @param vcodeLen
	 * @param width
	 * @param height
	 * @param cpacha用来区别验证码的类型，传入字符串
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/get_cpacha",method=RequestMethod.GET)
	public void generaeCpacha(
		@RequestParam(value="vcodeLen",required=false,defaultValue="4") Integer vcodeLen
		,@RequestParam(value="width",required=false,defaultValue="100") Integer width
		,@RequestParam(value="height",required=false,defaultValue="30") Integer height
		,@RequestParam(value="type",required=true,defaultValue="loginCpacha") String cpachaType
		,HttpServletRequest request,HttpServletResponse response
		) {
		CpachaUtil cpachaUtil=new CpachaUtil(vcodeLen,width,height);
		String generacpachas=cpachaUtil.generatorVCode();
		request.getSession().setAttribute(cpachaType,generacpachas);
		BufferedImage generatorVCodeImage = cpachaUtil.generatorVCodeImage(generacpachas, true);
		try {
			ImageIO.write(generatorVCodeImage, "gif", response.getOutputStream());
		} catch (IOException e) {
			e.printStackTrace();
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
		model.addAttribute("addmsg","插入成功");
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