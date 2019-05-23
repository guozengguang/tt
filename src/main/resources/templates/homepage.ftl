<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; Charset=gb2312">
    <meta http-equiv="Content-Language" content="zh-CN">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <title>TT的博客网站</title>
    <link rel="shortcut icon" href="../static/images/Logo_40.png" type="image/x-icon">
    <!--Layui-->
    <link href="../static/plug/layui/css/layui.css" rel="stylesheet" />
    <!--font-awesome-->
    <link href="../static/plug/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <!--全局样式表-->
    <link href="../static/css/global.css" rel="stylesheet" />
    <!-- 本页样式表 -->
    <link href="../static/css/home.css" rel="stylesheet" />
    <script src="../static/js/jquery-3.3.1.min.js"></script>
    <!--angularjs-->
    <script type="text/javascript" src="../static/js/angularjs/angular.min.js"></script>
    <script type="text/javascript" src="../static/js/base.js"></script>
    <script type="text/javascript" src="../static/js/service/articleService.js"></script>
    <script type="text/javascript" src="../static/js/controller/baseController.js"></script>
    <script type="text/javascript" src="../static/js/controller/articleController.js"></script>
</head>
<body ng-app="ttblog" ng-controller="articleController" ng-init="findAll();findHotArticle()">
    <!-- 导航 -->
<#include "header.ftl">
    <!-- 主体（一般只改变这里的内容） -->
    <div class="blog-body">
        <!-- canvas -->
        <canvas id="canvas-banner" style="background: #393D49;"></canvas>
        <!--为了及时效果需要立即设置canvas宽高，否则就在home.js中设置-->
        <script type="text/javascript">
            var canvas = document.getElementById('canvas-banner');
            canvas.width = window.document.body.clientWidth - 10;//减去滚动条的宽度
            if (screen.width >= 992) {
                canvas.height = window.innerHeight * 1 / 3;
            } else {
                canvas.height = window.innerHeight * 2 / 7;
            }
        </script>
        <!-- 这个一般才是真正的主体内容 -->
        <div class="blog-container">
            <div class="blog-main">
                <!-- 网站公告提示 -->
                <div class="home-tips shadow">
                    <i style="float:left;line-height:17px;" class="fa fa-volume-up"></i>
                    <div class="home-tips-container">
                        <span style="color: #009688">偷偷告诉大家，本博客的后台管理也正在制作，为大家准备了游客专用账号！</span>
                        <span style="color: red">网站新增留言回复啦！使用QQ登陆即可回复，人人都可以回复！</span>
                        <span style="color: red">如果你觉得网站做得还不错，来Fly社区点个赞吧！<a href="http://fly.layui.com/case/2017/" target="_blank" style="color:#01AAED">点我前往</a></span>
                        <span style="color: #009688">TT &nbsp;—— &nbsp;一个java程序员的个人博客，新版网站采用Layui为前端框架，目前正在建设中！</span>
                    </div>
                </div>
                <!--左边文章列表-->
                <div class="blog-main-left">
                    <div class="flow-default" id="parentArticleList">
                    <div>
                    <div class="article shadow" ng-repeat="entity in list">
                        <div class="article-left">
                            <img src="../static/images/cover/201703181909057125.jpg" alt="基于laypage的layui扩展模块（pagesize.js）！" />
                        </div>
                        <div class="article-right">
                            <div class="article-title">
                                <a href="/showDetail?id={{entity.id}}" data-ng-click="updateVisitsup(entity.id)">{{entity.title}}</a>
                            </div>
                            <div class="article-abstract">
                                {{entity.content}}
                            </div>
                        </div>
                        <div class="clear"></div>
                        <div class="article-footer">
                            <span><i class="fa fa-clock-o"></i>&nbsp;&nbsp;{{entity.createtime | date:'yyyy-MM-dd HH:mm:ss'}}</span>
                            <span class="article-author"><i class="fa fa-user"></i>&nbsp;&nbsp;{{entity.userid}}</span>
                            <span><i class="fa fa-tag"></i>&nbsp;&nbsp;<a href="#" >{{entity.columnid}}</a></span>
                            <span class="article-viewinfo"><i class="fa fa-eye"></i>&nbsp;{{entity.visits}}</span>
                            <span class="article-viewinfo"><i class="fa fa-commenting"></i>&nbsp;{{entity.comment}}</span>
                        </div>
                    </div>
                    </div>
                    </div>
                </div>

                <!--右边小栏目-->
                <div class="blog-main-right">
                    <div class="blogerinfo shadow">
                        <div class="blogerinfo-figure">
                            <img src="../static/images/violet.jpg" alt="Absolutely" />
                        </div>
                        <p class="blogerinfo-nickname">TT</p>
                        <p class="blogerinfo-introduce">一枚90后程序员，java开发工程师</p>
                        <p class="blogerinfo-location"><i class="fa fa-location-arrow"></i>&nbsp;广东-深圳</p>
                        <hr />
                        <div class="blogerinfo-contact">
                            <a target="_blank" title="QQ交流" href="javascript:layer.msg('启动QQ会话窗口')"><i class="fa fa-qq fa-2x"></i></a>
                            <a target="_blank" title="给我写信" href="javascript:layer.msg('启动邮我窗口')"><i class="fa fa-envelope fa-2x"></i></a>
                            <a target="_blank" title="新浪微博" href="javascript:layer.msg('转到你的微博主页')"><i class="fa fa-weibo fa-2x"></i></a>
                            <a target="_blank" title="码云" href="javascript:layer.msg('转到你的github主页')"><i class="fa fa-git fa-2x"></i></a>
                        </div>
                    </div>
                    <div></div><!--占位-->
                    <div class="blog-module shadow">
                        <div class="blog-module-title">热文排行</div>
                        <ul class="fa-ul blog-module-ul" ng-repeat="hotArticle in entity">
                            <li><i class="fa-li fa fa-hand-o-right"></i><a href="/showDetail?id={{hotArticle.id}}" data-ng-click="updateVisitsup(hotArticle.id)">{{hotArticle.title}}</a></li>

                        </ul>
                    </div>
                    <div class="blog-module shadow">
                        <div class="blog-module-title">最近分享</div>
                        <ul class="fa-ul blog-module-ul">
                            <li><i class="fa-li fa fa-hand-o-right"></i><a href="https://pan.baidu.com/s/19DJTtyWsLn-sK60Ap6m7Fg" target="_blank">JAVA并发编程原理与实战</a></li>
                            <li><i class="fa-li fa fa-hand-o-right"></i><a href="https://pan.baidu.com/s/1K8JEtJuLt-OAs3JBiLAaSw" target="_blank">深入理解JAVA虚拟机</a></li>
                            <li><i class="fa-li fa fa-hand-o-right"></i><a href="https://pan.baidu.com/s/16Qt3yjYIaZF60mHyWXfyTw" target="_blank">SpringCloud微服务实战</a></li>
                            <li><i class="fa-li fa fa-hand-o-right"></i><a href="https://pan.baidu.com/s/16zD-5mhHZi6p166mEyyQhA" target="_blank">剑指JAVA面试offer直通车</a></li>
                        </ul>
                    </div>
                    <div class="blog-module shadow">
                        <div class="blog-module-title">一路走来</div>
                        <dl class="footprint">
                            <dt>2019年03月12日</dt>
                            <dd>新增留言回复功能！人人都可参与回复！</dd>
                            <dt>2019年03月20日</dt>
                            <dd>TT1.0基本功能完成，正式上线！</dd>
                            <dt>2019年03月21日</dt>
                            <dd>新增文章功能！</dd>
                            <dt>2019年03月25日</dt>
                            <dd>QQ互联接入网站，可QQ登陆发表评论与留言！</dd>
                        </dl>
                    </div>
                    <div class="blog-module shadow">
                        <div class="blog-module-title">后台记录</div>
                        <dl class="footprint">
                            <dt>2019年03月16日</dt>
                            <dd>分页新增页容量控制</dd>
                            <dt>2019年03月12日</dt>
                            <dd>新增管家提醒功能</dd>
                            <dt>2019年03月10日</dt>
                            <dd>新增Win10快捷菜单</dd>
                        </dl>
                    </div>
                    <div class="blog-module shadow">
                        <div class="blog-module-title">友情链接</div>
                        <ul class="blogroll">
                            <li><a target="_blank" href="http://www.layui.com/" title="Layui">Layui</a></li>
                            <li><a target="_blank" href="http://www.pagemark.cn/" title="页签">页签</a></li>
                        </ul>
                    </div>
                </div>
                <div class="clear"></div>
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
    <script src="../static/js/home.js"></script>


</body>
</html>