<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; Charset=gb2312">
    <meta http-equiv="Content-Language" content="zh-CN">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <title>TT - 关于本站</title>
    <link rel="shortcut icon" href="../static/images/Logo_40.png" type="image/x-icon">
    <!--Layui-->
    <link href="../static/plug/layui/css/layui.css" rel="stylesheet" />
    <!--font-awesome-->
    <link href="../static/plug/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <!--全局样式表-->
    <link href="../static/css/global.css" rel="stylesheet" />
    <!-- 本页样式表 -->
    <link href="../static/css/about.css" rel="stylesheet" />
</head>
<body>
    <!-- 导航 -->
   <#include "header.ftl">
    <!-- 主体（一般只改变这里的内容） -->
    <div class="blog-body">
        <div class="blog-container">
            <blockquote class="layui-elem-quote sitemap layui-breadcrumb shadow">
                <a href="homepage.ftl" title="网站首页">网站首页</a>
                <a><cite>关于本站</cite></a>
            </blockquote>
            <div class="blog-main">
                <div class="layui-tab layui-tab-brief shadow" lay-filter="tabAbout">
                    <ul class="layui-tab-title">
                        <li lay-id="1">关于博客</li>
                        <li lay-id="2">关于作者</li>
                        <li lay-id="3" id="frinedlink">友情链接</li>
                        <li lay-id="4">留言墙</li>
                    </ul>
                    <div class="layui-tab-content">
                        <div class="layui-tab-item">
                            <div class="aboutinfo">
                                <div class="aboutinfo-figure">
                                    <img src="../static/images/Logo_100.png" alt="不落阁" />
                                </div>
                                <p class="aboutinfo-nickname">TT</p>
                                <p class="aboutinfo-introduce">一个JAVA程序员的个人博客，记录博主学习和成长之路，分享JAVA方面技术和源码</p>
                                <p class="aboutinfo-location"><i class="fa fa-link"></i>&nbsp;&nbsp;<a target="_blank" href="http://www.stsdd.com">www.stsdd.com</a></p>
                                <hr />
                                <div class="aboutinfo-contact">
                                    <a target="_blank" title="网站首页" href="/user/root"><i class="fa fa-home fa-2x" style="font-size:2.5em;position:relative;top:3px"></i></a>
                                    <a target="_blank" title="文章专栏" href="/showArticle"><i class="fa fa-file-text fa-2x"></i></a>
                                    <a target="_blank" title="资源分享" href="/showResource"><i class="fa fa-tags fa-2x"></i></a>
                                    <a target="_blank" title="点点滴滴" href="/showTimeline"><i class="fa fa-hourglass-half fa-2x"></i></a>
                                </div>

                                <fieldset class="layui-elem-field layui-field-title">
                                    <legend>简介</legend>
                                    <div class="layui-field-box aboutinfo-abstract">
                                        <p style="text-align:center;">TT是一个由JAVA开发的个人博客网站，诞生于2018年11月7日暂且称为TT1.0。</p>
                                        <h1>第一个版本</h1>
                                        <p>诞生的版本，采用springboot+springmvc+springdata作为后台框架，前端用了Bootstrap的栅格系统来布局！只打算完成基本的功能，故视觉体验是比较差的。</p>
                                        <h1>当前版本</h1>
                                        <p>使用Layui前端框架！Layui简洁的风格让我很是喜欢。</p>
                                        <h1 style="text-align:center;">The End</h1>
                                    </div>
                                </fieldset>
                            </div>
                        </div><!--关于网站End-->
                        <div class="layui-tab-item">
                            <div class="aboutinfo">
                                <div class="aboutinfo-figure">
                                    <img src="../static/images/Absolutely.jpg" alt="Absolutely" />
                                </div>
                                <p class="aboutinfo-nickname">TT</p>
                                <p class="aboutinfo-introduce">一枚90后程序员，JAVA开发工程师，主攻B/S架构</p>
                                <p class="aboutinfo-location"><i class="fa fa-location-arrow"></i>&nbsp;江西-赣州</p>
                                <hr />
                                <div class="aboutinfo-contact">
                                    <a target="_blank" title="QQ交流" href="javascript:layer.msg('启动QQ会话窗口')"><i class="fa fa-qq fa-2x"></i></a>
                                    <a target="_blank" title="给我写信" href="javascript:layer.msg('启动邮我窗口')"><i class="fa fa-envelope fa-2x"></i></a>
                                    <a target="_blank" title="新浪微博" href="javascript:layer.msg('转到你的微博主页')"><i class="fa fa-weibo fa-2x"></i></a>
                                    <a target="_blank" title="码云" href="javascript:layer.msg('转到你的github主页')"><i class="fa fa-git fa-2x"></i></a>
                                </div>
                                <fieldset class="layui-elem-field layui-field-title">
                                    <legend>简介</legend>
                                    <div class="layui-field-box aboutinfo-abstract abstract-bloger">
                                        <p style="text-align:center;">TT，诞生于1995年11月16日，目前是一个技术宅，希望从事JAVA开发。</p>
                                        <h1>个人信息</h1>
                                        <p>暂无</p>
                                        <h1>个人介绍</h1>
                                        <p>一个没有故事的男同学，没什么介绍......</p>
                                        <h1 style="text-align:center;">The End</h1>
                                    </div>
                                </fieldset>
                            </div>
                        </div><!--关于作者End-->
                        <div class="layui-tab-item">
                            <div class="aboutinfo">
                                <div class="aboutinfo-figure">
                                    <img src="../images/handshake.png" alt="友情链接" />
                                </div>
                                <p class="aboutinfo-nickname">友情链接</p>
                                <p class="aboutinfo-introduce">Name：不落阁&nbsp;&nbsp;&nbsp;&nbsp;Site：www.lyblogs.cn</p>
                                <p class="aboutinfo-location">
                                    <i class="fa fa-close"></i>经常宕机&nbsp;
                                    <i class="fa fa-close"></i>不合法规&nbsp;
                                    <i class="fa fa-close"></i>插边球站&nbsp;
                                    <i class="fa fa-close"></i>红标报毒&nbsp;
                                    <i class="fa fa-check"></i>原创优先&nbsp;
                                    <i class="fa fa-check"></i>技术优先
                                </p>
                                <hr />
                                <div class="aboutinfo-contact">
                                    <p style="font-size:2em;">互换友链，携手并进！</p>
                                </div>
                                <fieldset class="layui-elem-field layui-field-title">
                                    <legend>Friend Link</legend>
                                    <div class="layui-field-box">
                                        <ul class="friendlink">
                                            <li>
                                                <a target="_blank" href="http://www.layui.com/" title="Layui" class="friendlink-item">
                                                    <p class="friendlink-item-pic"><img src="http://www.layui.com/favicon.ico" alt="Layui" /></p>
                                                    <p class="friendlink-item-title">Layui</p>
                                                    <p class="friendlink-item-domain">layui.com</p>
                                                </a>
                                            </li>
                                            <li>
                                                <a target="_blank" href="http://www.pagemark.cn/" title="页签" class="friendlink-item">
                                                    <p class="friendlink-item-pic"><img src="http://pm.lyblogs.cn/Images/logo-png.png" alt="页签" /></p>
                                                    <p class="friendlink-item-title">页签</p>
                                                    <p class="friendlink-item-domain">pagemark.cn</p>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </fieldset>
                            </div>
                        </div><!--友情链接End-->
                        <div class="layui-tab-item">
                            <div class="aboutinfo">
                                <div class="aboutinfo-figure">
                                    <img src="../static/images/messagewall.png" alt="留言墙" />
                                </div>
                                <p class="aboutinfo-nickname">留言墙</p>
                                <p class="aboutinfo-introduce">本页面可留言、吐槽、提问。欢迎灌水，杜绝广告！</p>
                                <p class="aboutinfo-location">
                                    <i class="fa fa-clock-o"></i>&nbsp;<span id="time"></span>
                                </p>
                                <hr />
                                <div class="aboutinfo-contact">
                                    <p style="font-size:2em;">沟通交流，拉近你我！</p>
                                </div>
                                <fieldset class="layui-elem-field layui-field-title">
                                    <legend>Leave a message</legend>
                                    <div class="layui-field-box">
                                        <div class="leavemessage" style="text-align:initial">
                                            <form class="layui-form blog-editor" action="">
                                                <div class="layui-form-item">
                                                    <textarea name="editorContent" lay-verify="content" id="remarkEditor" placeholder="请输入内容" class="layui-textarea layui-hide"></textarea>
                                                </div>
                                                <div class="layui-form-item">
                                                    <button class="layui-btn" lay-submit="formLeaveMessage" lay-filter="formLeaveMessage">提交留言</button>
                                                </div>
                                            </form>
                                            <ul class="blog-comment">
                                                <li>
                                                    <div class="comment-parent">
                                                        <img src="../images/Logo_40.png" alt="不落阁" />
                                                        <div class="info">
                                                            <span class="username">TT</span>
                                                        </div>
                                                        <div class="content">
                                                            我为大家做了模拟留言与回复！试试吧！
                                                        </div>
                                                        <p class="info info-footer"><span class="time">2019-03-18 18:09</span><a class="btn-reply" href="javascript:;" onclick="btnReplyClick(this)">回复</a></p>
                                                    </div>
                                                    <hr />
                                                    <div class="comment-child">
                                                        <img src="" alt="Absolutely" />
                                                        <div class="info">
                                                            <span class="username">Absolutely</span><span>这是用户回复内容</span>
                                                        </div>
                                                        <p class="info"><span class="time">2019-03-18 18:26</span></p>
                                                    </div>
                                                    <div class="comment-child">
                                                        <img src="" alt="Absolutely" />
                                                        <div class="info">
                                                            <span class="username">Absolutely</span><span>这是第二个用户回复内容</span>
                                                        </div>
                                                        <p class="info"><span class="time">2019-03-18 18:26</span></p>
                                                    </div>
                                                    <!-- 回复表单默认隐藏 -->
                                                    <div class="replycontainer layui-hide">
                                                        <form class="layui-form" action="">
                                                            <div class="layui-form-item">
                                                                <textarea name="replyContent" lay-verify="replyContent" placeholder="请输入回复内容" class="layui-textarea" style="min-height:80px;"></textarea>
                                                            </div>
                                                            <div class="layui-form-item">
                                                                <button class="layui-btn layui-btn-mini" lay-submit="formReply" lay-filter="formReply">提交</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                        </div><!--留言墙End-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 底部 -->
    <#include "footer.ftl">
    <!--侧边导航-->
   <#include "side.ftl">
    <!--分享窗体-->
    <div class="blog-share layui-hide">
        <div class="blog-share-body">
            <div style="width: 200px;height:100%;">
                <div class="bdsharebuttonbox">
                    <a class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
                    <a class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
                    <a class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
                    <a class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a>
                </div>
            </div>
        </div>
    </div>
    <!--遮罩-->
    <div class="blog-mask animated layui-hide"></div>
    <!-- layui.js -->
    <script src="../static/plug/layui/layui.js"></script>
    <!-- 全局脚本 -->
    <script src="../static/js/global.js"></script>
    <!-- 本页脚本 -->
    <script src="../static/js/about.js"></script>
</body>
</html>