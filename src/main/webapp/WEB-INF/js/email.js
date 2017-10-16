		//邮件发送
     function send_pop(temp){
    	 $(".pop2").fadeIn('fast');
         $(".popBottom2").on('click', 'span', function(event) {
             event.preventDefault();
             if($(this).hasClass('confirm')){
            	 $.post("/fqweb/send/mail", $("#formMail").serialize(),function(data){
	          			if (data.status == 200) {
	          				alert("感谢您的信赖！");
	          			} else {
	          				alert("抱歉，邮件服务器未开启!");
	          			}
	          		});
                 $(".pop2").fadeOut();
             }else{
                 $(".pop2").fadeOut();
             }
         });
     }
	