<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>注册</title>
    <link rel="stylesheet" href="../static/lr/libs/particles/css/style.css">
    <link rel="stylesheet" href="../static/lr/libs/sweetalert2/sweetalert2.min.css">
    <link rel="stylesheet" href="../static/lr/css/base.css">
    <link rel="stylesheet" href="../static/lr/css/login.css">
</head>
<body>
<!-- particles.js container -->
<div id="particles-js"></div>
<div id="wrapper">
    <div>
        <img src="../static/lr/img/zhihu_logo.png"/>
        <h2>与世界分享你的知识、经验和见解</h2>
    </div>
    <nav class="switch_nav">
        <a href="javascript:;" id="switch_signup" class="switch_btn on">注册</a>
        <a href="/user/showlogin" id="switch_login" class="switch_btn">登陆</a>
        <a href="/reg" class="switch_btn on">推荐使用微信关联注册</a>
        <div class="switch_bottom" id="switch_bottom"></div>
    </nav>
    <form method="post" action="">
        <ul class="group_input">
            <li>
                <input type="text" placeholder="用户名" class="name required" id="name" name="username"/>
            </li>
            <li>
                <input type="text" placeholder="手机号(仅支持中国大陆)" class="mobile required" id="mobile" name="phone"/>
            </li>
            <li>
                <input type="text" placeholder="短信验证码" class="code" id="code" name="checkcode"
                       style="width: 170px;display: none;"/>
                <button type="button" class="send_code" onclick="sendAuthMessage();" id="buttonSend"
                        style="display: none;">发送短信验证码
                </button>
            </li>
            <li>
                <input type="password" placeholder="密码(不少于6位)" class="psd required" id="psd" name="password"/>
            </li>
        </ul>
        <button type="button" class="submit_btn" id="btnSubmit" onclick="register()">注册</button>
        <span class="agreement-tip">点击「注册」按钮，即代表你同意<a href="javascript:;">《TT协议》</a></span>
    </form>
    <div class="QRcode_btn">
        <div type="submit" class="submit_btn download_btn">下载TTapp</div>
        <div class="QRcode">
            <img src="../static/lr/img/QRcode.png" alt="QRcode"/>
            <div class="box"></div>
        </div>

    </div>


    <div id="footer">
        <span>&copy;2019TT</span><span>·</span><a href="javascript:;">圆桌</a><span>·</span><a
            href="javascript:;">发现</a><span>·</span><a href="javascript:;">移动应用</a><span>·</span><a href="javascript:;">使用QQ账号登录</a><span>·</span><a
            href="javascript:;">联系我们</a><span>·</span><br/>
        <span>·</span><a
            href="javascript:;">赣ICP备18017077号-1</a><span>·</span><span>京公网安备11010802010035号</span><span>·</span><a
            href="javascript:;">出版物经营许可证</a>
    </div>
</div>
<script src="../static/lr/libs/jquery-1.12.4/jquery.min.js"></script>
<script src="../static/lr/libs/sweetalert2/sweetalert2.min.js"></script>
<script src="../static/lr/libs/particles/particles.min.js"></script>
<script src="../static/lr/libs/particles/js/app.js"></script>
<!-- <script src="../assets/libs/particles/js/lib/stats.js"></script> -->
<script>
    var count_particles, stats, update;
    stats = new Stats;
    stats.setMode(0);
    stats.domElement.style.position = 'absolute';
    stats.domElement.style.left = '0px';
    stats.domElement.style.top = '0px';
    document.body.appendChild(stats.domElement);
    count_particles = document.querySelector('.js-count-particles');
    update = function () {
        stats.begin();
        stats.end();
        if (window.pJSDom[0].pJS.particles && window.pJSDom[0].pJS.particles.array) {
            count_particles.innerText = window.pJSDom[0].pJS.particles.array.length;
        }
        requestAnimationFrame(update);
    };
    requestAnimationFrame(update);
</script>
<script>
    $(".download_btn").click(function () {
        if ($(".QRcode").css("display") == "none") {
            $(".QRcode").show();
            $(".download_btn").text("关闭二维码");
        } else {
            $(".QRcode").hide();
            $(".download_btn").text("下载TTapp");
        }
    });

</script>
<script>
    function show() {
        $("#code").show();
        $("#buttonSend").show();
    }
    function hide() {
        $("#code").hide();
        $("#buttonSend").hide();
    }
    $(function () {
        //为表单的必填文本框添加提示信息（选择form中的所有后代input元素）
        // $("form :input.required").each(function () {
        //     //通过jquery api：$("HTML字符串") 创建jquery对象
        //     var $required = $("<strong class='high'>*</strong>");
        //     //添加到this对象的父级对象下
        //     $(this).parent().append($required);
        // });
        // var errorMsg = $(".error-msg").text();
        //为表单元素添加失去焦点事件

        $("form :input").blur(function () {

            var $parent = $(this).parent();
            $parent.find(".msg").remove(); //删除以前的提醒元素（find()：查找匹配元素集中元素的所有匹配元素）
            //验证姓名
            if ($(this).is("#name")) {
                var nameVal = $.trim(this.value);
                var regName = /[~#^$@%&!*()<>:;'"{}【】  ]/;
                if (nameVal == "" || nameVal.length < 2 || regName.test(nameVal)) {
                    var errorMsg = " 姓名非空，长度2-20位，不包含特殊字符！";
                    $parent.append("<span class='msg onError'>" + errorMsg + "</span>");
                } else {
                    var okMsg = " 输入正确";
                    $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
                }
            }
            //验证手机号
            if ($(this).is("#mobile")) {
                var mobileVal = $.trim(this.value);
                var regMobile = /^1[3|4|5|7|8][0-9]{9}$/;
                if (mobileVal == "" || !regMobile.test(mobileVal)) {
                    var errorMsg = " 请输入有效的11位手机号码！";
                    $parent.append("<span class='msg onError'>" + errorMsg + "</span>");
                } else {
                    var okMsg = " 输入正确";
                    $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
                }
            }
            //验证密码
            if ($(this).is("#psd")) {
                var psdVal = $.trim(this.value);
                var regPsd = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$/;
                if (psdVal == "" || !regPsd.test(psdVal)) {
                    var errorMsg = " 密码为6-20位字母、数字的组合！";
                    $parent.append("<span class='msg onError'>" + errorMsg + "</span>");
                }
                else {
                    var okMsg = " 输入正确";
                    $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
                }
            }
        }).keyup(function () {
            //triggerHandler 防止事件执行完后，浏览器自动为标签获得焦点
            $(this).triggerHandler("blur");
            if ($(this).attr("name") == "phone") {
                show();
            }
        }).focus(function () {
            if (
                $(this).attr("name") == "phone" ||
                $(this).attr("name") == "checkcode" ||
                $(this).attr("id") == "buttonSend" ||
                $(this).attr("id") == "psd"
            ) {
                show();
            }
            else {
                hide();
            }
            $(this).triggerHandler("blur");

        })

        $("body").click(function () {
            hide();
        });

        $("#code,#buttonSend,#psd,#mobile").click(function (e) {
            e.stopPropagation();
        });



        //点击重置按钮时，通过trigger()来触发文本框的失去焦点事件
        //		$("#btnSubmit").click(function(){
        //    		//trigger 事件执行完后，浏览器会为submit按钮获得焦点
        //    		$("form .required:input").trigger("blur");
        //    		var numError = $("form .onError").length;
        //    		if(numError){
        //    			return false;
        //    		}
        //    		alert('注册成功！')
        //
        //    	});
    })

</script>
<script src="../static/js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
    function sendAuthMessage() {
        var phone = $("input[name='phone']").val();
        $.ajax({
            url: "/user/sendsms",
            type: 'post',
            data: {"phone": phone},
            dataType: "json",
            success: function (data) {
                if (data.flag) {
                    alert("发送成功");
                } else {
                    alert("发送失败");
                }
            }
        });
    }
</script>
<script type="text/javascript">
    function register() {
        var username = $("input[name='username']").val();
        var password = $("input[name='password']").val();
        var phone = $("input[name='phone']").val();
        var checkcode = $("input[name='checkcode']").val();
        $.ajax({
            url: "/user/register",
            type: 'post',
            data: {"username": username, "password": password, "phone": phone, "checkcode": checkcode},
            dataType: "json",
            success: function (data) {
                if (data.flag) {
                    location.href = "/user/showlogin"
                } else {
                    alert("注册失败");
                }
            }
        });
    }
</script>
</body>
</html>
