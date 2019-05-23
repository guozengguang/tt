<nav class="blog-nav layui-header">
    <div class="blog-container">
        <!-- QQ互联登陆 -->
        <a href="/user/authorizeUrl" class="blog-user">
            <i class="fa fa-qq"></i>
        </a>
        <#if userInfo??>
        <a href="javascript:;" class="blog-user ">
            <img src="${userInfo.headImage}" alt="Absolutely" title="Absolutely" />
        </a>
        </#if>
        <!--  -->

    <#if Session["onLineCount"]?exists>
        <a class="blog-logo" href="/user/root">在线: ${Session["onLineCount"]}</a>
    <#else >
        <a class="blog-logo" href="/user/root">TT</a>
    </#if>

        <!-- 导航菜单 -->
        <ul class="layui-nav" lay-filter="nav">
            <li class="layui-nav-item layui-this">
                <a href="/user/root"><i class="fa fa-home fa-fw"></i>&nbsp;网站首页</a>
            </li>
            <li class="layui-nav-item">
                <a href="/showArticle"><i class="fa fa-file-text fa-fw"></i>&nbsp;文章专栏</a>
            </li>
            <li class="layui-nav-item">
                <a href="/showResource"><i class="fa fa-tags fa-fw"></i>&nbsp;资源分享</a>
            </li>
            <li class="layui-nav-item">
                <a href="/showTimeline"><i class="fa fa-hourglass-half fa-fw"></i>&nbsp;点点滴滴</a>
            </li>
            <li class="layui-nav-item">
                <a href="/showAbbout"><i class="fa fa-info fa-fw"></i>&nbsp;关于本站</a>
            </li>
            <#if userInfo??>
                <#else >
                    <#if user ??>
                        <li class="layui-nav-item">
                            <a href="/user/showRegister"><i class="fa fa-user fa-fw"></i>&nbsp;用户:${user.phone}</a>

                        </li>
                    <#else >
                        <li class="layui-nav-item">
                            <a href="/user/showRegister"><i class="fa fa-user fa-fw"></i>&nbsp;注册</a>
                        </li>
                        <li class="layui-nav-item">
                            <a href="/user/showlogin"><i class="fa fa-sign-in fa-fw"></i>&nbsp;登录</a>
                        </li>
                    </#if>
            </#if>
        </ul>
        <!-- 手机和平板的导航开关 -->
        <a class="blog-navicon" href="javascript:;">
            <i class="fa fa-navicon"></i>
        </a>
    </div>
</nav>

