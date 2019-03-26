<%@page import="javax.servlet.descriptor.TaglibDescriptor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<% request.setAttribute("app_path", request.getContextPath()); %>
<meta charset="UTF-8">
<title>球员信息</title>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css"></link>
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body style="background: url(imgs/timg11.jpg)">
<div class="row">
		<div class="col-md-offset-1">
			<h1>球员详细信息-NBA</h1>
		</div>
	</div>

<!-- 表格 -->
<div class="row">
	<table class="table table-hover  col-md-offset-1" id="table_ajax">
 		<thead>
	 		<tr>
	 			<th>#</th>
	 			<th>Name</th>
	 			<th>height</th>
	 			<th>Address</th>
	 			<th>Age</th>
	 			<th>Email</th>
	 			<th>team</th>
	 			<th>操作</th>
	 		</tr>
 		</thead>
 		<tbody>
 		</tbody>
	</table>
</div>
<!-- 分页 -->
<div class="row">
<!-- 分页左信息 -->
	<div class="col-md-offset-1" id="table_page_left">
	</div>
<!-- 分页条右信息 -->
	<div class="col-md-offset-9" id="table_page_right">
	</div>
</div>
<!-- 模态框编辑的 -->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">球员修改</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" ><%-- action="${app_path}/edit/{id}" --%>
		  <div class="form-group">
		    <label  class="col-sm-2 control-label">Name</label>
		    <div class="col-sm-10">
		      <input type="text" name="name" class="form-control" id="editName" >
		    </div>
		  </div>
		  <div class="form-group">
		    <label  class="col-sm-2 control-label">height</label>
		    <div class="col-sm-10">
		      <input type="text" name="height" class="form-control" id="editHeight" >
		    </div>
		  </div>
		  <div class="form-group">
		    <label  class="col-sm-2 control-label">address</label>
		    <div class="col-sm-10">
		      <input type="text" name="address" class="form-control" id="editAddress" >
		    </div>
		  </div>
		  <div class="form-group">
		    <label  class="col-sm-2 control-label">age</label>
		    <div class="col-sm-10">
		      <input type="text" name="age" class="form-control" id="editAge" >
		    </div>
		  </div>
		  <div class="form-group">
		    <label  class="col-sm-2 control-label">email</label>
		    <div class="col-sm-10">
		      <input type="text" name="email" class="form-control" id="editEmail" >
		    </div>
		  </div>
		  <div class="form-group">
		    <label  class="col-sm-2 control-label">team</label>
		    <div class="col-sm-4">
		      <!-- <input type="text" name="team_id" class="form-control" id="inputTeam_id" > -->
		      <select class="form-control" name="team_id" id="select_id">
				 <!--  <option>1</option>
				  <option>2</option> -->
			  </select>
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-9 col-sm-10">
		      <button type="button" class="btn btn-default" id="edit_person">更新</button>
		      <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		    </div>
		  </div>
	</form> 
      </div>
    </div>
  </div>
</div>
	<script type="text/javascript">
	//声明一个变量为当前页。
	var currentPage;
	//页面发送请求，获取到ajax的请求数据。
		$(function(){
			to_page(1);
		}); 
		//抽取的方法，单击则去相应的页码数页面
		function to_page(pn){
			$.ajax({
				url:"${app_path}/json",
				type:"GET",
				data:"pn="+pn,
				success:function(result){
					//console.log(result);
					//1解析表格里的数据,并进行方法的调用
					bulid_table_json(result);
					//2解析分页条里的左信息，下有方法
					bulid_page_left(result);
					//3解析分页的右信息
					bulid_page_right(result);
				}
			  });
		}
	 	//解析表格里的数据的方法
	 	function bulid_table_json(result){
	 		$("#table_ajax tbody").empty();
	 		//获取解析的json数据，因为之前把page页面的数据存放在了extend.pageInfo.list依次去拿
	 		var tabPerson=result.extend.pageInfo.list;
	 		//console.log(tabPerson);
	 		//遍历表格里的员工信息，index,是索引，item是存放的数据值
	 		$.each(tabPerson,function(index,item){
	 			//把遍历取到的数据值放到table表格中
	 			var id=$("<td></td>").append(item.id);
	 			var name=$("<td></td>").append(item.name);
	 			var height=$("<td></td>").append(item.height);
	 			var address=$("<td></td>").append(item.address);
	 			var age=$("<td></td>").append(item.age);
	 			var email=$("<td></td>").append(item.email);
	 			/* var team_id=$("<td></td>").append(item.team_id); */
	 			   var team_name=$("<td></td>").append(item.nbaTeam.team_name);
	 			//以上是把内容遍历加入到表格中，下是把按钮加入表格中
	 			var editBtn=$("<button></button>").addClass("btn btn-info  edit_btn")
	 											  .append($("<scan></scan>").addClass("glyphicon glyphicon-pencil"))
	 											  .append("编辑");
	 			
	 			editBtn.attr("edit-button",item.id);
	 			//editBtn.attr("id","editID");
	 			var delBtn=$("<button></button>").addClass("btn btn-danger")
												  .append($("<scan></scan>").addClass("glyphicon glyphicon-trash"))
												  .append("删除");
	 			//为这个删除按钮增加一个class属性，
	 			delBtn.addClass("delete_class");
	 			//加一个属性，value值为id，方便删除
	 			delBtn.attr("del-btn",item.id);
	 			$("<tr></tr>").append(id)
	 						  .append(name)
	 						  .append(height)
	 						  .append(address)
	 						  .append(age)
	 						  .append(email)
	 						  .append(team_name)
	 						  .append(editBtn)
	 						  .append(delBtn)
	 						  .appendTo("#table_ajax tbody");
	 		});
	 	}
	 	//2解析分页条里数据的方法
		function bulid_page_left(result){
			$("#table_page_left").empty();
	 		$("#table_page_left").append("当前第"+result.extend.pageInfo.pageNum+"页，共有"+result.extend.pageInfo.pageSize+"页,总共有"+result.extend.pageInfo.total+"条")
	 		//此处犯了一个错误，在 currentPage声明好的变量前又加了一次var错误
	 		currentPage=result.extend.pageInfo.pageNum;
	 	}
		//3解析分页的右信息
		function bulid_page_right(result){
			$("#table_page_right").empty();
			//把这些首页前后页加入到ul中
			var ul=$("<ul></ul>").addClass("pagination");
			//首页末页
			var firstPage=$("<li></li>").append($("<a></a>").append("首页").attr("href",""));
			//前一页后一页
			var prePage=$("<li></li>").append($("<a></a>").append("&laquo;"));
			//点击来到前一页
			prePage.click(function(){
				if(result.extend.pageInfo.hasPreviousPage==true){
					to_page(result.extend.pageInfo.pageNum-1);
				}
			});
			
			//判断有无前一页
			if(result.extend.pageInfo.hasPreviousPage==false){
				firstPage.addClass("disabled");
				prePage.addClass("disabled");
			}
			//先把首页，前一页加入ul
			ul.append(firstPage).append(prePage);
			var nextPage=$("<li></li>").append($("<a></a>").append("&raquo;"));
			var lastPage=$("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
			//去首页
			firstPage.click(function(){
				to_page(-9);
			});
			//去末页
			lastPage.click(function(){
				to_page(9999);
			});
			//点击来到后一页
			nextPage.click(function(){
				if(result.extend.pageInfo.hasNextPage==true){
					to_page(result.extend.pageInfo.pageNum+1);
				}
			});
			//判断有无前一页
			if(result.extend.pageInfo.hasNextPage==false){
				nextPage.addClass("disabled");
				lastPage.addClass("disabled");
			}
			//遍历取出页码1,2,3,4
			$.each(result.extend.pageInfo.navigatepageNums,function(index,item){
				var eachNum=$("<li></li>").append($("<a></a>").append(item));
				//在对页码进行遍历的时候，先判断遍历的页码是不是当前页码，如果是则不可点击
				if(result.extend.pageInfo.pageNum==item){
					eachNum.addClass("active");
				}
				//onclick是绑定事件 (告诉浏览器在鼠标点击的时候要做什么)
				//click是触发事件 (模拟了鼠标点击操作)
				eachNum.click(function(){
						to_page(item);
				});
						ul.append(eachNum);
			});
			
			ul.append(nextPage).append(lastPage);
			var nav=$("<nav></nav>").append(ul);
			//切记把装配好的nav装入到自己定义的分页条的id里！！
			nav.appendTo("#table_page_right");
		}
		//删除
		$(document).on("click",".delete_class",function(){
			var id=$(this).attr("del-btn");
			var name=$(this).parents("tr").find("td:eq(1)").text();
			//发送ajax请求删除
			if(confirm("确认删除"+name+"吗！")){
				$.ajax({
					url:"${app_path}/json/"+id,
					type:"DELETE",
					success:function(result){
						//对删除操作做出信息反馈
						alert(result.msg);
						to_page(currentPage);
					}
				});
			}
		});
		//编辑更新操作
		$(document).on("click",".edit_btn",function(){
			//弹出下拉模态框
			var id=$(this).attr("edit-button");
			//获得下拉框中信息的值
			getPer(id);
			//清除掉每次下拉部门选择框的记录
			$("#updateModal select").empty();
			//调用获取部门方法
			getDepts();
			//进行编辑更新
			//更新按钮传递一个id值
			$("#edit_person").attr("edit-id",$(this).attr("edit-button"));
			//获取到id值为updateModal的这个模态框
			$("#updateModal").modal({
				//static表示下拉模态框，当你点击框外是不会消失,backdrop只是一个属性，可有可无
				backdrop:"static"
			});
		});
		//查询信息显示在模态框总
		function getPer(id){
			$.ajax({
				url:"${app_path}/emy/"+id,
				type:"GET",
				success:function(result){
					console.log(result);
					var data=result.extend.person;
					$("#editName").val(data.name);
					$("#editHeight").val(data.height);
					$("#editAddress").val(data.address);
					$("#editAge").val(data.age);
					$("#editEmail").val(data.email);
					$("#select_id").val([data.team_id]);
				}
			});
		}
		//点击更新实现更新的方法
		$("#edit_person").click(function(){
			var id=$(this).attr("edit-id");
			$.ajax({
				url:"${app_path}/edit/"+id,
				type:"GET",
				//表单序列化
				data:$("#updateModal form").serialize(),
				success:function(result){
					alert(result.msg);
					to_page(currentPage);
					//下拉模态框在更新操作之后关闭弹窗
					$("#updateModal").modal("hide");
				}
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
					optionEle.appendTo("#select_id");
				});
			}
		});
	}  
	</script>
</body>
</html>