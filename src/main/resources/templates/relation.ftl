<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>QQ关联</title>
<link rel="stylesheet" href="../static/view/default/css/common.css" />
<link rel="stylesheet" href="../static/view/default/css/loginregister.css" />
<link rel="stylesheet" href="../static/view/default/css/valifrom.css" />
<style>
.form-box .input-box {
	overflow: hidden;
}
</style>
</head>

<body
	<div class="ny-header">
		<div class="nb">
			<div class="logo">
				<a href="/user/root"><img src="../static/view/default/images/c.jpg"
					alt="" style="width: 200px; height: 60px" /></a>
			</div>
			<div class="right login-right">
				<span>您好！欢迎光临TT的技术博客 ！</span>
			</div>
		</div>
	</div>
	<div class="nb">
		<div class="ny-body ny-zsy">
			<div class="left">
				<img src="../static/view/default/images/a.jpg" alt="" />
			</div>
			<div class="right">
				<div class="form-box">

						<h3>TT博客QQ关联账户</h3>
						<div class="input-box input-box1 onfocusstyle user-word">
							<label for="loginname" class="icon-user"></label> <input
								type="text" name="phone" id="loginname" value=""
								placeholder="手机号码" class="position-input" maxlength="20"
								datatype="*" autocomplete="off" />
							<div class="Validform_checktip formtip">
								<span class=""><i></i><label></label></span>
							</div>
						</div>
						<div class="input-box onfocusstyle passw-word">
							<label for="passw" class="icon-passw"></label> <input
								type="password" name="password" id="passw" value=""
								placeholder="密码" class="position-input" maxlength="20"
								datatype="*" autocomplete="off" />
							<div class="Validform_checktip formtip">
								<span class=""><i></i><label></label></span>
							</div>
						</div>

						<div class="input-box sub-box">
							<input type="button"  value="关联账号" onclick="binding()"/>
						</div>

					
				</div>
			</div>
		</div>
		<div class="ny-footer">
			<div class="link">
				<a href="/" target="_blank">首页</a>| <a href="/n-help.html">关于我们</a>
				| <a href="/n-help.html">联系我们</a>| <a href="/user.html">会员中心</a> | <a href="/n-help.html">帮助中心</a>
			</div>
			<div class="copyright">
				<p>
				<p>
					Copy@2019 <a href="http://www.yunec.cn/" target="_blank">TT博客系统</a>
					<a href="http://www.yunec.cn/" target="_blank">www.yunec.cn</a>&nbsp;All
					Rights Reserved 赣ICP备18017077号-1
				</p>
				</p>
			</div>
		</div>
	</div>
	<script src="../static/view/default/js/jquery-1.9.1.min.js"
		type="text/javascript"></script>
	<script src="../static/view/default/js/main.js" type="text/javascript"></script>
	<script src="../static/view/default/js/users.js" type="text/javascript"></script>


	<#--<script>-->
		<#--$(function() {-->
			<#--loadLayer();-->
		<#--});-->
		<#--var return_url = '';-->

		<#--$(".hezuo li:last-child").css("margin-right", 0);-->
		<#--$(".position-input").focus(function() {-->
			<#--$(this).parent(".onfocusstyle").css({-->
				<#--"border-color" : "#abcdef"-->
			<#--}).siblings().css({-->
				<#--"border-color" : "#dedede"-->
			<#--});-->
		<#--});-->
		<#--$(".position-input").blur(function() {-->
			<#--$(this).parent(".onfocusstyle").css({-->
				<#--"border-color" : "#dedede"-->
			<#--}).siblings().css({-->
				<#--"border-color" : "#dedede"-->
			<#--});-->
		<#--});-->
		<#--$(".mh-checkbox").on("click", function() {-->
			<#--if ($(this).hasClass("checkbox-stylemh")) {-->
				<#--$(this).removeClass("checkbox-stylemh");-->
				<#--$(".zdlogin-btn").attr("checked", false);-->
			<#--} else {-->
				<#--$(this).addClass("checkbox-stylemh");-->
				<#--$(".zdlogin-btn").attr("checked", true);-->
			<#--}-->
		<#--});-->
		<#--if ((navigator.userAgent.indexOf('MSIE') >= 0 && navigator.userAgent-->
				<#--.indexOf('MSIE 10') == -1)-->
				<#--&& (navigator.userAgent.indexOf('Opera') < 0)) {-->
			<#--var a = navigator.userAgent;-->
			<#--$(".passw-word").append("<span>密码</span>");-->
			<#--$(".user-word").append("<span>用户名</span>");-->
			<#--$("#passw,#loginname").blur(function() {-->
				<#--if ($("#passw").val() == "") {-->
					<#--$(".passw-word").append("<span>密码</span>");-->
				<#--}-->
			<#--});-->
			<#--$("#loginname")-->
					<#--.blur(-->
							<#--function() {-->
								<#--$(".user-word")-->
										<#--.append(-->
												<#--$("#loginname").val() == "" ? "<span>用户名</span>"-->
														<#--: "");-->
							<#--});-->

			<#--$("#passw").focus(function() {-->
				<#--$(".passw-word span").remove();-->
			<#--});-->
			<#--$("#loginname").focus(function() {-->
				<#--$(".user-word span").remove();-->
			<#--});-->
		<#--}-->

		<#--function refreshimage(clickidimg) {-->
			<#--clickidimg.src = '/vcode-M.html' + '?' + Date.parse(new Date());-->
		<#--}-->
		<#--function showvode() {-->
			<#--document.getElementById('mx').style.display = 'block';-->
		<#--}-->
		<#--document.getElementById('mx').src = '/vcode-M.html' + '?'-->
				<#--+ Date.parse(new Date());-->
		<#--function refreshimage(clickidimg) {-->
			<#--clickidimg.src = clickidimg.src + '?' + Date.parse(new Date());-->
		<#--}-->
	<#--</script>-->
    <script src="../static/js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function binding() {
            var password = $("input[name='password']").val();
            var phone = $("input[name='phone']").val();
            $.ajax({
                url:"/qqRelation",
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

	<p style="display: none;"></p>
</body>

</html>