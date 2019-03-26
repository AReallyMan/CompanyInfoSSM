<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 获取到项目的路径 -->
<% request.setAttribute("app_path", request.getContextPath()); %>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 导入jQuery，bootstrap -->
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<font color="red">
<!-- 登录信息错误时的提示 -->
${loginFlag}
<!-- 添加信息错误时的提示 -->
${add}
</font>
<!-- 增加一个下拉模态框新增员工 -->
<div align="right">
<button  type="button" id="new_depts" class="btn btn-info btn-lg active btn btn-primary btn-lg " data-toggle="modal" data-target="#myModal3">NBA新增</button>
<button type="button" id="new-login"class="btn btn-warning btn-lg active btn btn-primary btn-lg " data-toggle="modal" data-target="#myModal2">admin管理员</button>
</div>
<!-- 员工新增模态框 -->
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">球员新增</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" action="${app_path}/add" onsubmit="return checkForm();">
		  <div class="form-group">
		    <label  class="col-sm-2 control-label">Name</label>
		    <div class="col-sm-10">
		      <input type="text" name="name" class="form-control" id="inputName" >
		    </div>
		  </div>
		  <div class="form-group">
		    <label  class="col-sm-2 control-label">height</label>
		    <div class="col-sm-10">
		      <input type="text" name="height" class="form-control" id="inputHeight" >
		    </div>
		  </div>
		  <div class="form-group">
		    <label  class="col-sm-2 control-label">address</label>
		    <div class="col-sm-10">
		      <input type="text" name="address" class="form-control" id="inputAddress" >
		    </div>
		  </div>
		  <div class="form-group">
		    <label  class="col-sm-2 control-label">age</label>
		    <div class="col-sm-10">
		      <input type="text" name="age" class="form-control" id="inputAge" >
		    </div>
		  </div>
		  <div class="form-group">
		    <label  class="col-sm-2 control-label">email</label>
		    <div class="col-sm-10">
		      <input type="text" name="email" class="form-control" id="inputEmail" onkeyup="checkEmail();">
		    </div>
		   <td colspan="2"><scan id="emailMsg"></scan>
		    	<font></font>
		    </td>
		  </div>
		  <div class="form-group">
		    <label  class="col-sm-2 control-label">team</label>
		    <div class="col-sm-4">
		    <!-- 下拉列表的部门值通过方法遍历取出 -->
		      <select class="form-control" name="team_id" id="select_option">
			  </select>
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-9 col-sm-10">
		      <button type="submit" class="btn btn-default">保存</button>
		      <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		    </div>
		  </div>
		</form>
      </div>
    </div>
  </div>
</div>
<!-- 登录模态框 -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">管理员登录！</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" action="${app_path}/login">
		  <div class="form-group">
		    <label  class="col-sm-2 control-label">adminName:</label>
		    <div class="col-sm-10">
		      <input type="text" name="name" class="form-control" id="adminName" placeholder="username">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
		    <div class="col-sm-10">
		      <input type="password" name="password" class="form-control" id="inputPassword" placeholder="Password">
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <div class="checkbox">
		      </div>
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-8 col-sm-10">
		      <button type="submit" class="btn btn-default" id="login-btn">登录</button>
		      <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		    </div>
		  </div>
		</form>
      </div>
    </div>
  </div>
</div>

<div class="container">
	<div class="row clearfix">
		<div class="col-md-2 column">
		</div>
		<div class="col-md-6 column">
		</div>
	</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="carousel slide" id="carousel-856864">
				<ol class="carousel-indicators">
					<li class="active" data-slide-to="0" data-target="#carousel-856864">
					</li>
					<li data-slide-to="1" data-target="#carousel-856864">
					</li>
					<li data-slide-to="2" data-target="#carousel-856864">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="item active">
						<img alt="" src="imgs/t1.jpg" />
						<div class="carousel-caption">
							<h4>
								Kobe Bryant
							</h4>
							<p>
								科比·布莱恩特（Kobe Bryant），1978年8月23日出生于美国宾夕法尼亚州费城，前美国职业篮球运动员，司职得分后卫/小前锋（锋卫摇摆人），绰号“黑曼巴”/“小飞侠”
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="imgs/t2.jpg" />
						<div class="carousel-caption">
							<h4>
								LeBron James
							</h4>
							<p>
								詹姆斯在2003年NBA选秀中于首轮第1顺位被克利夫兰骑士队选中，在2009年与2010年蝉联NBA常规赛最有价值球员（MVP）
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="imgs/t3.jpg" />
						<div class="carousel-caption">
							<h4>
								Joe Johnson
							</h4>
							<p>
								乔·约翰逊于2001年通过选秀进入NBA，先后效力于凯尔特人、太阳、老鹰、篮网、热火、爵士和火箭等球队，新秀赛季入选最佳新秀阵容第二阵容，2009-10赛季入选最佳阵容第三阵容，7次入选全明星阵容
							</p>
						</div>
					</div>
				</div> <a class="left carousel-control" href="#carousel-856864" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-856864" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
			</div>
			<div class="jumbotron">
				<h2>
					欢迎使用NBA球员信息管理系统!
				</h2>
				<p>
					美国职业篮球联赛（National Basketball Association），简称NBA，于1946年6月6日在纽约成立，是由北美三十支队伍组成的男子职业篮球联盟，汇集了世界上最顶级的球员，是美国四大职业体育联盟之一。诞生了：迈克尔·乔丹，比尔·拉塞尔，卡里姆·阿布杜尔-贾巴尔，威尔特·张伯伦，埃尔文·约翰逊，拉里·伯德，奥斯卡·罗伯特森，约翰·哈弗利切克，里克·巴里，约翰·斯托克顿，卡尔·马龙，埃尔金·贝勒，沙奎尔·奥尼尔，科比·布莱恩特，文斯·卡特，麦克格雷迪，勒布朗·詹姆斯等著名球员，是世界水平最高篮球赛事
				</p>
				<p>
					 <a class="btn btn-primary btn-large" href="https://baike.baidu.com/item/NBA">Learn more</a>
				</p>
			</div>
		</div>
	</div>
</div>
<!-- 以下的代码是为了在新增功能中，在下拉列表中显示部门值 -->
<script>
	//获取到部门信息，发送的ajax请求
	$("#new_depts").click(function(){
		//先查询出部门信息，之后再去调用下拉框
		$("#myModal1 select").empty();
		getDepts();
		//弹出模态框
		$("#myModal1").modal({
			backdrop:"static"
		});
	});
	function getDepts(){
		$.ajax({
			url:"${app_path}/dept",
			type:"GET",
			success:function(result){
				//console.log(result);
				//$("#myModal1 select")
				$.each(result.extend.dept,function(){
					var optionEle=$("<option></option>").append(this.team_name).attr("value",this.team_id);
					optionEle.appendTo("#myModal1 select");
				});
			}
		});
	}
	//登录表单校验
	var emailMsg;
	var inputEmail;
	window.onload=function(){
		inputEmail=document.getElementById("inputEmail");
		emailMsg=document.getElementById("emailMsg");
	}
	function checkForm(){
		
		var bEmail=checkEmail();
		
		return bEmail;
	}
	function checkEmail(){
		var regx=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
		var value=inputEmail.value;
		var msg="";
		if(!value){
			msg="邮箱不能为空";
		}
		else if(!regx.test(value)){
			msg="邮箱必须合法";
		}
		emailMsg.innerHTML=msg;
		inputEmail.parentNode.parentNode.style.color=msg=="" ? "black" : "red";
		return msg=="";
	}
	
	
</script>
</body>
</html>