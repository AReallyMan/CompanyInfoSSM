package com.ssm.entity;

import java.util.HashMap;
import java.util.Map;
public class Msg {
	//状态码 100--success 200-失败
		private int code;
		//提示信息
		private String msg;
		//用户返回给服务器的数据
		private Map<String,Object> extend=new HashMap<String,Object>();
		//写一个方法更直观显示信息
		public static Msg success() {
			Msg result = new Msg();
			result.setCode(100);
			result.setMsg("保存成功！");
			return result;
		}
		public static Msg faile() {
			Msg result = new Msg();
			result.setCode(200);
			result.setMsg("保存失败！");
			return result;
		}
		//方便进行链式操作
		public Msg add(String key,Object value) {
			this.getExtend().put(key, value);
			return this;
		}
		public int getCode() {
			return code;
		}
		public void setCode(int code) {
			this.code = code;
		}
		public String getMsg() {
			return msg;
		}
		public void setMsg(String msg) {
			this.msg = msg;
		}
		public Map<String, Object> getExtend() {
			return extend;
		}
		public void setExtend(Map<String, Object> extend) {
			this.extend = extend;
		}
		
	}


