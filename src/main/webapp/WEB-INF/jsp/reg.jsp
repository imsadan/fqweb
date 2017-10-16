<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"> 
	<title>番茄注册</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">  
	<link rel="icon" type="image/png" href="image/flag.png">
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<style>
	 * { margin: 0; padding: 0; color: #000;}
	 a{text-decoration:none;}
	 #topflag{
	   width:100%;
	   height:100px;
	   background-color:#000;
	 }
	 #flag{
	   width:100px;
	   height:100px;
	   position:absolute;
	   margin-left:15%;
	 }
	 #flag_txt{
	   width:450px;
	   height:100px;	   
	   margin-left:25%;
	   position:absolute;
	 }
	</style>
</head>
<body>
<div id="topflag">
  <div id="flag">
    <img src="image/flag.png" style="width:100%;height:100%;">
  </div>
  <div id="flag_txt">
    <p style="color:#fff;font:35px 'Microsoft Yahei';margin-top:20px;">嘉兴番茄智能科技有限公司</p>
  </div>
</div><br><br>
<div style="margin-left:40%;width:300px;height:auto;">
    <p style="font-size:30px;text-align:center;">新账号注册</p><br>
	<form id="personRegForm" class="form-horizontal" role="form" onsubmit="rerurn false;" onsubmit="return sub('click')">
		<div class="form-group" style="width:400px;">
			<div class="col-sm-10">
				<input type="text" class="form-control" name="username" 
					   placeholder="账户" style="width:300px;height:50px;" id="regName">
			</div>
		</div>
		<div class="form-group" style="width:400px;">
			<div class="col-sm-10">
				<input type="text" class="form-control" name="email" 
					   placeholder="邮箱" style="width:300px;height:50px;" id="email">
			</div>
		</div>
		<div class="form-group" style="width:400px;">
			<div class="col-sm-10">
				<input type="password" class="form-control" name="password" 
					   placeholder="密码" style="width:300px;height:50px;" id="pwd">
			</div>
		</div>
		<div class="form-group" style="width:400px;">
			<div class="col-sm-10">
				<input type="password" class="form-control" id="password2" 
					   placeholder="重复密码" style="width:300px;height:50px;" id="pwdRepeat">
			</div>
		</div>
		<div class="form-group" style="width:400px;">
			<div class="col-sm-10">
				<button type="button" class="btn btn-primary" style="width:300px;height:50px;" onclick="REGISTER.reg();">注册</button>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript">
var REGISTER={
	param:{
			
			surl:""
      },
		 inputcheck:function(){
				//不能为空检查
				if ($("#regName").val() == "") {
					alert("用户名不能为空");
					$("#regName").focus();
					return false;
				}
				if ($("#pwd").val() == "") {
					alert("密码不能为空");
					$("#pwd").focus();
					return false;
				}
				if ($("#email").val() == "") {
					alert("邮箱不能为空");
					$("#email").focus();
					return false;
				}
				//密码检查
				if ($("#pwd").val() != $("#pwdRepeat").val()) {
					alert("确认密码和密码不一致，请重新输入！");
					$("#pwdRepeat").select();
					$("#pwdRepeat").focus();
					return false;
				}
				return true;
		}, 
		beforeSubmit:function() {
				//检查用户是否已经被占用
				$.ajax({
	            	url : REGISTER.param.surl + "/fqweb/user/check/"+escape($("#regName").val())+"/1?r=" + Math.random(),
	            	success : function(data) {
	            		if (data.data) {
	            			//检查是否存在
	            			$.ajax({
	            				url : REGISTER.param.surl + "/fqweb/user/check/"+$("#email").val()+"/2?r=" + Math.random(),
				            	success : function(data) {
				            		if (data.data) {
					            		REGISTER.doSubmit();
				            		} else {
				            			alert("此邮箱已经被注册！");
				            			$("#email").select();
				            		}
				            	}
	            			});
	            		} else {
	            			alert("此用户名已经被占用，请选择其他用户名");
	            			$("#regName").select();
	            		}	
	            	}
				});
	            	
		},
		doSubmit:function() {
			$.post("/fqweb/user/register",$("#personRegForm").serialize(), function(data){
				if(data.status == 200){
					alert('用户注册成功！');
					REGISTER.login();
				} else {
					alert("注册失败！");
				}
			});
		},
		login:function() {
			 location.href = "http://localhost:8080/fqweb/login";
			 return false;
		},
		reg:function() {
				if (this.inputcheck()) {
				this.beforeSubmit();
			}
		}
	};
</script>
</body>
</html>