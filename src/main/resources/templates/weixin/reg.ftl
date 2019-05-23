<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>TT博客-微信关联注册</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="/static/res/layui/css/layui.css">
<link rel="stylesheet" href="/static/res/static/css/register.css">
</head>
<body>
	<form action="weixinRegister" method="post">
		<div class="layui-fulid" id="house-login">
			<div class="layui-form">
				<p>手机号注册</p>
				<div class="layui-input-block login">
					<i class="layui-icon layui-icon-username"></i> <input type="text"
						required lay-verify="required" value="${(registerVo.phone)!''}"
						name="phone" placeholder="请输入手机号码" class="layui-input">
				</div>

				<div class="layui-input-block login" style="margin-top: 12px;">
					<i class="layui-icon layui-icon-vercode"></i> <input
						type="password" required lay-verify="required" name="password"
						value="${(registerVo.password)!''}" placeholder="请输入密码"
						class="layui-input">
				</div>


				<div class="layui-input-block-weixinQRcode"
					style="text-align: center;">
					<img alt="" src="/static/res/static/img/yscxy.jpg">

					<div style="text-align: center; font-size: 14px; color: #FF5722;">
						关注微信公众号,发送手机号码可获得注册码</div>
				</div>


				<div class="layui-input-block login" style="margin-top: 12px;">
					<i class="layui-icon layui-icon-vercode"></i> <input
						value="${(registerVo.registCode)!''}" name="registCode"
						type="text" required lay-verify="required" placeholder="请输入微信注册码"
						class="layui-input">
				</div>


				<div class="layui-input-block getCode" style="margin-top: 12px;">
					<input type="text" name="graphicCode"
						value="${(registerVo.graphicCode)!''}"   placeholder="请输入验证码" class="layui-input">
					<img alt="" src="getVerify" onclick="getVerify(this);"
						style="border: 1px solid #e2e2e2; font-size: 18px; height: 46px; margin-top: -69px; width: 44%; background-color: #e8d6c0; margin-left: 167px;">

				</div>
				<span style="color: red;font-size: 20px;font-weight: bold;font-family: '楷体','楷体_GB2312';">${error!''}</span>
				<button class="layui-btn" lay-submit lay-filter="user-login" style="margin-top: 5px;">注册</button>
			</div>
		</div>
	</form>
	<script src="/static/res/layui/layui.js"></script>
	<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
	<!--[if lt IE 9]>
  <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
  <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
	<script>
		layui.config({
			base : '/static/res/static/js/'
		}).use('house');

		//获取验证码
		function getVerify(obj) {
			obj.src = "getVerify?" + Math.random();
		}
	</script>

</body>
</html>