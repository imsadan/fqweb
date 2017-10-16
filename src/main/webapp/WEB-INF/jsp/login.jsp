<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"> 
	<title>番茄登录</title>
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="css/bootstrap.min.css"> 
	<link rel="icon" type="image/png" href="image/flag.png"> 
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
    <p style="font-size:30px;text-align:center;">账户密码登录</p><br>
	<form class="form-horizontal" role="form" id="formlogin" onsubmit="return false;">
		<div class="form-group" style="width:400px;">
			<div class="col-sm-10">
				<input type="text" class="form-control" name="username" 
					   placeholder="账户" id="username" style="width:300px;height:50px;">
			</div>
		</div>
		<div class="form-group" style="width:400px;">
			<div class="col-sm-10">
				<input type="password" class="form-control" name="password" 
					   placeholder="密码" id="password" style="width:300px;height:50px;"
					   >
			</div>
		</div>
		<div class="form-group" style="width:400px;">
			<div class=" col-sm-10">				
				   <input type="checkbox"><a style="font-size:15px;color:#000;text-decoration:none;">Remember me</a>
			       &nbsp;&nbsp;&nbsp;&nbsp;	&nbsp;&nbsp;	&nbsp;&nbsp;	&nbsp;&nbsp;			
                   <a href="" style="font-size:15px;text-decoration:none;">忘记密码?</a>&nbsp;&nbsp;&nbsp;<a href="/fqweb/reg" style="font-size:15px;text-decoration:none;">注册</a>						   
			</div>
		</div>
		<div class="form-group" style="width:400px;">
			<div class="col-sm-10">
				<button type="submit" class="btn btn-primary" style="width:300px;height:50px;" id="loginsubmit">登录</button>
			</div>
		</div>
	</form>
</div>
<script>
 var redirectUrl = "${redirect}";      
	  var LOGIN = {
              doLogin:function() {
					$.post("/fqweb/user/login", $("#formlogin").serialize(),function(data){
						if (data.status == 200) {
							alert("登录成功！");
							if (redirectUrl == "") {
								location.href = "http://localhost:8080/fqweb";
							} else {
								location.href = redirectUrl;
							}
						} else {
							alert("登录失败，原因是：" + data.msg);
							$("#username").select();
						}
					});
				},
				login:function() {			
						this.doLogin();
				}
			
		};
		$(function(){
			$("#loginsubmit").click(function(){
				LOGIN.login();
			});
		});
</script>
</body>
</html>