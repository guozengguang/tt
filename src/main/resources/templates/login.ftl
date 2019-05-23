<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>登陆</title>
	<link rel="stylesheet" href="../static/lr/libs/particles/css/style.css">
	<link rel="stylesheet" href="../static/lr/css/base.css">
	<link rel="stylesheet" href="../static/lr/css/login.css" />
    <script type="text/javascript" src="../static/js/angularjs/angular.min.js"></script>
    <script type="text/javascript" src="../static/js/base.js"></script>
    <script type="text/javascript" src="../static/js/service/articleService.js"></script>
    <script type="text/javascript" src="../static/js/controller/baseController.js"></script>
    <script type="text/javascript" src="../static/js/controller/articleController.js"></script>
</head>
<body ng-app="ttblog" ng-controller="articleController">
	<!-- particles.js container -->
	<div id="particles-js"></div>
	<div id="wrapper">
		<div>
			<img src="../static/lr/img/zhihu_logo.png" />
			<h2>与世界分享你的知识、经验和见解</h2>
		</div>
		<nav class="switch_nav">
			<a href="showRegister" id="switch_signup" class="switch_btn">注册</a>
			<a href="javascript:;" id="switch_login" class="switch_btn on">登陆</a>
			<div class="switch_bottom" id="switch_bottom"></div>
		</nav>
		<div id="login">
			<form method="post" action="">
				<ul class="group_input">
					<li>
						<input type="text" class="mobile required" id="mobile" placeholder="手机号" name="phone" />
					</li>
					<li>
						<input type="password" class="psd required" id="psd" placeholder="密码" name="password" />
					</li>
				</ul>
				<button type="button" class="submit_btn" id="btnSubmit" onclick="login()">登陆</button>
			</form>
			<div class="states">
				<span class="left"><a href="javascript:;">手机验证码登陆</a></span>
				<span class="right"><a href="javascript:;">无法登陆？</a></span>
			</div>
			<div class="states">
				<a href="javascript:;" class="social_account">QQ账号登陆</a>
				<div class="states three_MinIcon">
					<a href="javascript:;" class="MinIcon_weixin"><img src="../static/lr/img/icon_weixin.jpg" style="width:20px;height:18px" /></a>
					<a href="javascript:;" class="MinIcon_weibo"><img src="../static/lr/img/icon_weibo.jpg" style="width:20px;height:18px" /></a>
					<a href="javascript:;" class="MinIcon_qq"><img src="../static/lr/img/icon_qq.jpg" style="width:20px;height:18px" /></a>
				</div>
			</div>
		</div>
		<div class="QRcode_btn">
			<div type="submit" class="submit_btn download_btn">下载瓜皮App</div>

		</div>
		<div id="footer">
			<span>&copy;2017</span><span>·</span><a href="javascript:;">圆桌</a><span>·</span><a href="javascript:;">发现</a><span>·</span><a href="javascript:;">移动应用</a><span>·</span><a href="javascript:;">使用机构账号登录</a><span>·</span><a href="javascript:;">联系我们</a><span>·</span><a href="javascript:;">工作来</a><br />
			<span>·</span><a href="javascript:;">赣ICP备18017077号-1</a><span>·</span><span>京公网安备11010802010035号</span><span>·</span><a href="javascript:;">出版物经营许可证</a>
		</div>
	</div>
	<script src="../static/lr/libs/jquery-1.12.4/jquery.min.js"></script>
	<script src="../static/lr/libs/particles/particles.min.js"></script>
	<script src="../static/lr/libs/particles/js/app.js"></script>
	<!-- <script src="../assets/libs/particles/js/lib/stats.js"></script> -->
	<#--<script>-->
		<#--var count_particles, stats, update;-->
		<#--stats = new Stats;-->
		<#--stats.setMode(0);-->
		<#--stats.domElement.style.position = 'absolute';-->
		<#--stats.domElement.style.left = '0px';-->
		<#--stats.domElement.style.top = '0px';-->
		<#--document.body.appendChild(stats.domElement);-->
		<#--count_particles = document.querySelector('.js-count-particles');-->
		<#--update = function() {-->
			<#--stats.begin();-->
			<#--stats.end();-->
			<#--if (window.pJSDom[0].pJS.particles && window.pJSDom[0].pJS.particles.array) {-->
				<#--count_particles.innerText = window.pJSDom[0].pJS.particles.array.length;-->
			<#--}-->
			<#--requestAnimationFrame(update);-->
		<#--};-->
		<#--requestAnimationFrame(update);-->
	<#--</script>-->

	<script>
		$(function(){
		//为表单的必填文本框添加提示信息（选择form中的所有后代input元素）
        // $("form :input.required").each(function () {
        //     //通过jquery api：$("HTML字符串") 创建jquery对象
        //     var $required = $("<strong class='high'>*</strong>");
        //     //添加到this对象的父级对象下
        //     $(this).parent().append($required);
        // });
			// var errorMsg = $(".error-msg").text();
		//为表单元素添加失去焦点事件
		$("form :input").blur(function(){
			var $parent = $(this).parent();
			$parent.find(".msg").remove(); //删除以前的提醒元素（find()：查找匹配元素集中元素的所有匹配元素）		
			//验证手机号
			if($(this).is("#mobile")){
				var mobileVal = $.trim(this.value);
				// var regMobile = /^1[3|4|5|7|8][0-9]{9}$/;
				if(mobileVal == ""){
					var errorMsg = " 请输入手机号或账号！";
					$parent.append("<span class='msg onError'>" + errorMsg + "</span>");
				} else{
					var okMsg=" 输入正确";
                    $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
				}
			}
			//验证密码
            if($(this).is("#psd")){
                var psdVal = $.trim(this.value);
                var regPsd = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$/;
                if(psdVal== "" || !regPsd.test(psdVal)){
                    var errorMsg = " 密码为6-20位字母、数字的组合！";
                    $parent.append("<span class='msg onError'>" + errorMsg + "</span>");
                }
                else{
                    var okMsg=" 输入正确";
                    $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
                }
            }
		}).keyup(function(){
			//triggerHandler 防止事件执行完后，浏览器自动为标签获得焦点
			$(this).triggerHandler("blur"); 
		}).focus(function(){
			$(this).triggerHandler("blur");
		});

				//点击重置按钮时，通过trigger()来触发文本框的失去焦点事件
//		$("#btnSubmit").click(function(){
//    		//trigger 事件执行完后，浏览器会为submit按钮获得焦点
//    		$("form .required:input").trigger("blur");
//    		var numError = $("form .onError").length;
//    		if(numError){
//    			return false;
//    		}
//    		alert('登陆成功！')
//
//    	});
		})
		
	</script>
	<script src="../static/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
        function login() {
            var password = $("input[name='password']").val();
            var phone = $("input[name='phone']").val();
            $.ajax({
                url:"/login",
                type:'post',
                data:{"password":password,"phone":phone},
                dataType:"json",
                success:function (data) {
                    if(data.flag){
                        location="/user/root";
                    }else {
                        alert(data.message);
                    }
                }
            });
        }
	</script>
</body>
</html>
