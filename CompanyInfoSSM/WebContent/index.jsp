<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 获取到项目的路径 -->
<% request.setAttribute("app_path", request.getContextPath()); %>
<meta charset="UTF-8">
<title>company</title>
<!-- 导入jQuery，bootstrap -->
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<font color="red">
${addmsg}
</font>
<!-- 增加一个下拉模态框新增员工 -->
<div align="right">
<form action="${app_path}/view/login.jsp">
	<button  type="button" id="new_depts" class="btn btn-info btn-lg active btn btn-primary btn-lg " data-toggle="modal" data-target="#myModal3">员工新增</button>
	<button  type="submit" id="new-login"class="btn btn-warning btn-lg active btn btn-primary btn-lg login-button" >admin登录</button>
</form>
</div>
<!-- 员工新增模态框 -->
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">员工新增</h4>
      </div>
      <div class="modal-body">
      <!-- 当点击增加时还会触发checkForm()函数，此函数是为了校验邮箱，校验其他的field功能我没有实现 -->
        <form class="form-horizontal" action="${app_path}/view/add" onsubmit="return checkForm();">
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
		  </div>
		  <!-- 这个div中是包含员工的部门信息，下拉列表供新增员工选择 -->
		  <div class="form-group">
		    <label  class="col-sm-2 control-label">department</label>
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
						<a href="http://localhost:8080/CompanyInfoSSM/view/login.jsp"><img style="cursor:pointer;" title="公司倡导合作共赢方针"  src="imgs/new1.jpg" /></a>
						<div class="carousel-caption">
							<h4>
								合作共赢
							</h4>
							<p>
								始终坚持“创新驱动、特色发展”战略，凭借“敢作为、善作为、快作为、大作为”的创新创业精神，着力突出“产业培育、科技创新、区域带动、生态环境、行政效能”等建设，纺织服装、电子电气及装备、特色食品三大传统产业不断改造提升
							</p>
						</div>
					</div>
					<div class="item">
						<a href="http://localhost:8080/CompanyInfoSSM/view/login.jsp"><img style="cursor:pointer;" title="合理利用创新科技"  src="imgs/new2.jpg" /></a>
						<div class="carousel-caption">
							<h4>
								创新科技技术提升
							</h4>
							<p>
								研发经验是科技人员及本单位从事某一领域科技攻关研究和开发的成功经验和成果；研发经历是科技人员及本单位从事某一领域科技攻关研究和开发的时间和空间；科研设备是本单位开展科研试验需要的硬件设施；经济势力是本单位开展科研试验和相关活动需要的经费来源；创新精神是科技人员本身和集体具备的创造力、创作灵感、奉献精神等思想境界。
							</p>
						</div>
					</div>
					<div class="item">
						<a href="http://localhost:8080/CompanyInfoSSM/view/login.jsp"><img style="cursor:pointer;" title="创新科技的魔力"  src="imgs/new3.jpg" /></a>
						<div class="carousel-caption">
							<h4>
								合理应用科技
							</h4>
							<p>
							负面方向应用科技无论起到了压榨人类劳动，还是起到了引入战争甚至毁灭世界的作用，错误地认为能找到世界本源，抑或能掌握绝对的世界的真理等等这些都是对科技的不恰当应用。科技是一种工具，它本身是中性的，即不善，也不恶，所以，人类需要往善的方面发挥科技的拓展力，限制人类恶的方面应用科技。
							</p>
						</div>
					</div>
				</div> <a class="left carousel-control" href="#carousel-856864" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-856864" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
			</div>
			<div class="jumbotron">
				<h2>
					欢迎使用公司员工管理网站!
				</h2>
				<p>
					（1）数据增加功能。包括数据收集和输入、数据传输、数据存储；<br>
					（2）数据更改功能。运用现代信息合理化，对存储的员工进行修改<br>
					（3）数据删除功能。根据企业提供的约束条件，合理地删除员工信息；<br>
					（4）分页控制功能。根据各职能部门提供的数据，对数据进行合理化分页，方便查看；<br>
					（5）待开发功能。采用各种数学模型和所存储的大量数据，及时推倒出有关问题的最优解或满意解，辅助各级管理人员进行决策，以期合理利用人财物和信息资源，取得较大的经济效益。<br>
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
		//清除上次选择后遗留的选择历史
		$("#myModal1 select").empty();
		//先查询出部门信息，之后再去调用下拉框
		getDepts();
		//弹出模态框
		$("#myModal1").modal({
			//当点击模态框以外的部分不会自动退出模态框
			backdrop:"static"
		});
	});
	//获取部门信息（得到下拉部门列表的值，此时从后端获取的信息就存储在这个result中
	function getDepts(){
		$.ajax({
			url:"${app_path}/view/dept",
			type:"GET",
			success:function(result){
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