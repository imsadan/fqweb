<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>番茄官网</title>
<style>
* { margin: 0; padding: 0; color: #000;}
a{text-decoration:none;}
#flag_txt{text-align:center;font:24px 'Microsoft YaHei';}
#page_se{width:180px;margin-left:80px;}
</style>
<link rel="stylesheet" href="css/index.css"/>
<link rel="stylesheet" href="css/style.css"/>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/functional.css">
<link rel="icon" type="image/png" href="image/flag.png">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.scrollify.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- 导航 -->
<script src="js/jquery.easing.min.js"></script>
<script src="js/main2.js"></script>
<!-- 视频 -->
<script src="js/flowplayer.min.js"></script>

<script>
$(function() {
	$('.panel').css({'height': $(window).height()});
	$.scrollify({
		section: '.panel',
		scrollbars: false
	});
});
</script>
<style>
    #txt_phone{ font-family: "Microsoft Yahei"; font-size: 18px; color:#000;padding-top:10px;}
    #container {
      overflow: hidden;
      position: absolute;
      top: 0; left: 0; right: 0; bottom: 0;
    }

    #background_video {
      position: absolute;

      top: 50%; left: 50%;
      transform: translate(-50%, -50%);

      object-fit: cover;
      height: 100%; width: 100%;
    }


    #container {
      height: 100%;
    }

    #overlay {
      position: absolute;
      top: 0; right: 0; left: 0; bottom: 0;
      background: rgba(0,0,0,0.5);
    }
	#main_content {
      z-index: 2;
      display: inline-block;
    }
	 #video_controls {
      position: absolute;
      left:0;
      bottom:0;
    }
	
	#play img {
      width: 100px;
    }
    #pause img {
      width: 90px;
    }
    #play {
      display: none;
    }
</style>
  <script>try{Typekit.load({ async: true });}catch(e){}</script>
</head>

<body>
<div class="panel" data-section-name="page1" id="home">
	<div id="wrapper">
        <nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation">		
				<div style="height:20%;"></div>
				<ul class="nav navbar-nav">	
				
					<li class="page-scroll" id="page_se">
						<a href="#home" id="flag_txt">首页</a>
					</li>
					<li class="page-scroll" id="page_se">
						<a href="#aboutUs" id="flag_txt">关于我们</a>
					</li>
					<li class="page-scroll" id="page_se">
						<a href="#services" id="flag_txt">产品中心</a>
					</li>
					<li class="page-scroll" id="page_se">
						<a href="#support" id="flag_txt">服务与支持</a>
					</li>
					<li class="page-scroll" id="page_se">
						<a href="#contont" id="flag_txt">联系我们</a>
					</li>
				</ul> 
				<!-- 底部 -->
				<!-- 微信 -->	   
				<div style="width:20%;height:7%;position:absolute;bottom:7%;right:180px;" id="1">
				  <img src="image/weixin.png" style="width:100%;height:100%;"/>
				</div>
				<div style="border:1px solid red;right:30%;height:150px;width:150px;bottom:15%;position:absolute;display:none;" id="1_pic">
				  <img src="" style="width:100%;height:100%;"/>
				</div>
				<!-- 淘宝 -->	   
				<div style="width:20%;height:7%;position:absolute;bottom:7%;right:100px;" id="2">
				  <img src="image/taobao.png" style="width:100%;height:100%;"/>
				</div>
				<div style="border:1px solid red;right:6%;height:150px;width:150px;bottom:15%;position:absolute;display:none;" id="2_pic">
				  <img src="" style="width:100%;height:100%;"/>
				</div>
				<!-- 电话 -->	   
				<div style="width:20%;height:7%;position:absolute;bottom:7%;right:20px;" id="3">
				  <img src="image/phone.png" style="width:100%;height:100%;"/> 
				</div>
				<div style="bottom:15%;right:6%;height:150px;width:150px;position:absolute;display:none;" id="3_pic">
				  <div style="width:100%;height:50px;background-color:#5bc0de;text-align:center;">
					<p id="txt_phone">联系电话</p>
				  </div>
				  <div style="background-color:#FFE4C4;height:100px;text-align:center;">
					<p id="txt_phone">0573-8888888</p>
				  </div>
				</div>	
        </nav>
        <script type="text/javascript">
		     /*微信*/
		     $("#1").mousemove(function(){
				$("#1_pic").css("display", "block");
			 });
			 $("#1").mouseleave(function(){
				$("#1_pic").css("display", "none");
			 });
			 /*淘宝链接*/
			 $("#2").mousemove(function(){
				$("#2_pic").css("display", "block");
			 });
			 $("#2").mouseleave(function(){
				$("#2_pic").css("display", "none");
			 });
			 /*联系电话*/
			 $("#3").mousemove(function(){
			 $("#3_pic").css("display", "block");
			 });
			 $("#3").mouseleave(function(){
			 $("#3_pic").css("display", "none");
			 });
		</script>
        <div id="page-content-wrapper">
          <button type="button" class="hamburger is-closed animated fadeInRight" data-toggle="offcanvas">
            <span class="hamb-top"></span>
            <span class="hamb-middle"></span>
            <span class="hamb-bottom"></span>
          </button>
          
        </div>

    </div>
	<div id="container">
		<video id="background_video" loop ></video>
		<div id="video_cover">
		  <img src="image/body_pic.png" style="width:100%;height:100%;position:absolute;">
		</div>
		<div id="overlay"></div>
    </div>
    <div id="video_controls">
      <span id="pause">
        <img src="image/pause.png">
      </span>
	  <span id="play">
        <img src="image/play.png">
      </span>
    </div>
    <section id="main_content">	   
	   <div style="width:200px;height:200px;margin:0 auto;position:absolute;margin-left:40%;margin-top:10%;">
	      <img src="image/flag.png" style="width:100%;height:100%;"/>
	   </div>
	   <div style="width:80%;height:120px;position:absolute;margin-left:10%;margin-top:20%;text-align: center;">
         <img src="image/in_txt.png" style="width:80%;height:100%;"/>
	   </div>
	   <div style="width:40%;height:50px;position:absolute;margin-left:30%;margin-top:28%;text-align: center;">
         <img src="image/in_txt2.png" style="width:80%;height:100%;"/>
	   </div>
	  
    </section>
	<script src="js/bideo.js"></script>
	<script src="js/main.js"></script>
</div>
<div class="panel" style="background:url('image/bg.png');" data-section-name="page2" id="aboutUs">
	<div id="sec_left">
	    <img src="image/fq.png" style="width:100%;height:100%;" id="about"/>
	</div>
	<div id="sec_about">
	    <img src="image/about.png" style="width:100%;height:100%;" id="about_text"/>
	</div>
	<div id="sec_txt">
	    <p id="sec_fot">是一家以物联网产品研发、销售、维护一体<br>的多样化公司，是嘉兴市物联网协会会员单位。<br>
		 番茄科技致力于将物联网技术运用到农业、校园、<br>工业等领域，以科技创新、自主研发为目标，研发<br>
		 了多参数水质探头、电子鼻、溯源系统、智能开关<br>等产品。
		</p>
	</div>
	<div id="more">
	   <p align="center"><a href="/about"style="text-decoration:none"><font style="color:#fff;">了解更多</font></a></p>
	</div>

</div>
<div class="panel" style="background:url('image/bg.png');" data-section-name="page3" id="services">
	<div id="three_pic01">
	  <img src="image/water.png" style="width:100%;height:100%;"/>
	</div>
	<div id="three_pic02">
     <b><p id="pic02_txt">极光升级款浴霸5键开关</p></b>
	</div>
	<div id="three_num01">
	   <p id="num01">01</p>
	</div>
	<div id="three_pic03">
	 <p style="color:#fff;font:20px 'Courier New'">Events</p>
	 <p style="color:#fff;font:25px 'Microsoft Yahei';">
	   Lorem ipsum wecomes<br>new fashion brand
	 </P><br>
	 <p><div style="width:30%;height:5px; background:#fff;"></div></p><br>
	 <p style="color:#ddd;font:15px 'Microsoft Yahei';">
	   Lorem ipsum dolor sit amet,consectetur adipiscing elit nullam congue<br>
	   libero erat,eget aliquam dolor fermentum at.
	 </p>
	</div>
	<div id="tr_more">
	   <p align="center"><a href="/about"style="text-decoration:none"><font style="color:#fff;">了解更多</font></a></p>
	</div>	
	<div id="three_pic04">
	   <p style="color:#fff;font:40px 'Microsoft Yahei';">Best outfit</p>
	</div>
	<div id="three_pic05"></div>
    <div id="three_pic06">
	 <img src="" />
	</div>	
	<div id="three_num02">
	   <p id="num01">02</p>
	</div>	
</div>
<div class="panel" style="background:url('image/bg.png');" data-section-name="page4" id="support">
   <div id="four_txt">
     <p style="color:#fff;font: 40px 'Microsoft Yahei';">服务与支持</p><br>
	 <p id="f_txt2">我们希望看到你不断向前移动，我们被你们的成就和信的欲望所鼓动，我们希望与您共同发展！</p>
   </div>  
   <div class="flowplayer" data-swf="flowplayer.swf" data-ratio="0.4167" style="width:60%;margin-top:20%;margin-left:20%;border:1px solid #fff;">
      <video style="with:100%;">       
         <source type="video/mp4" src="https://upfiles.heclouds.com/other_files/OneNet++.mp4">
      </video>
   </div> 
</div>
<div class="panel" style="background:url('image/bg.png');" data-section-name="page5" id="contont">
	<div id="five_bg">
	  <div id="bg_txt">
	    <p style="color:#CD853F;font:50px 'Microsoft Yahei';">Contact</p><br>
		<div style="width:15%;height:5px; background:#CD853F;"></div>
		 <form method="post" id="formMail">
		    <div id="bg_white"></div>
		    <table border="0" style="width:100%;height:100%;">
			<tr>
			<td style="width:50%;">
			  <p id="foot_wr">Your name</p>
			  <p><input type="text" id="fot_bord" name="username"/></p>
			</td>
			<td>
			  <p id="foot_wr">Your email</p>
			  <p><input type="text" id="fot_bord" name="email"/></p>
			</td>
			</tr>
			<tr>
			<td style="padding-top:4%;">
			   <p id="foot_wr">Message</p><br><br>
			   <p><input type="text" id="fot_bord" name="message"/></p>
			</td>			   
			</tr>
			<tr>
			  <td style="padding-top:4%;">
			    <button type="button" class="btn btn-default btn-sm" style="width:200px;height:50px;border:1px solid #CD853F" id="mailsubmit" onclick="send_pop(this)"><p id="foot_wr2">SEND MESSAGE</p></button>
			  </td>
			</tr>
			</table>			
		</form>	
	  </div>
	</div>
	<div id="five_pic">
	  <img src="image/footer.png" style="width:100%;height:100%;"/>
	</div>
</div>
	<script src="js/email.js"></script>
	<!-- 发送邮件确认表 -->
	<div class="pop2">
		<div class="popMain2">
			<div class="popTop2"></div>
			<div class="popMiddle2">
				<p>是否确认发送？</p>
			</div>
			<div class="popBottom2">
				<span class="confirm">确认</span>
				<span class="cancel">取消</span>
			</div>
		</div>
	</div>
<script type="text/javascript">
$(document).ready(function () {
  var trigger = $('.hamburger'),
      overlay = $('.overlay'),
     isClosed = false;

    trigger.click(function () {
      hamburger_cross();      
    });

    function hamburger_cross() {

      if (isClosed == true) {          
        overlay.hide();
        trigger.removeClass('is-open');
        trigger.addClass('is-closed');
        isClosed = false;
      } else {   
        overlay.show();
        trigger.removeClass('is-closed');
        trigger.addClass('is-open');
        isClosed = true;
      }
  }
  
  $('[data-toggle="offcanvas"]').click(function () {
        $('#wrapper').toggleClass('toggled');
  });  
});
</script>
</script>	
</body>
</html>