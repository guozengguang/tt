<!--

@Name：TT
 @Author：Absolutely
 @Site：http://www.stsdd.com

 -->

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; Charset=gb2312">
    <meta http-equiv="Content-Language" content="zh-CN">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <title>TT - 文章专栏</title>
    <link rel="shortcut icon" href="../static/images/Logo_40.png" type="image/x-icon">
    <!--Layui-->
    <link href="../static/plug/layui/css/layui.css" rel="stylesheet" />
    <!--font-awesome-->
    <link href="../static/plug/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <!--全局样式表-->
    <link href="../static/css/global.css" rel="stylesheet" />
    <!--本页样式表-->
    <link href="../static/css/article.css" rel="stylesheet" />
    <script src="../static/js/jquery-3.3.1.min.js"></script>
    <!--angularjs-->
    <script type="text/javascript" src="../static/js/angularjs/angular.min.js"></script>
    <script type="text/javascript" src="../static/js/base.js"></script>
    <script type="text/javascript" src="../static/js/service/articleService.js"></script>
    <script type="text/javascript" src="../static/js/controller/baseController.js"></script>
    <script type="text/javascript" src="../static/js/controller/articleController.js"></script>
</head>
<body ng-app="ttblog" ng-controller="articleController" ng-init="findAll()">
    <!-- 导航 -->
    <#include "header.ftl">
    <!-- 主体（一般只改变这里的内容） -->
    <div class="blog-body" >
        <div class="blog-container">
            <blockquote class="layui-elem-quote sitemap layui-breadcrumb shadow">
                <a href="/user/root" title="网站首页">网站首页</a>
                <a><cite>文章专栏</cite></a>
            </blockquote>
            <div class="blog-main">
                <div class="blog-main-left">

                        <div  ng-if="list==null" class="shadow" style="text-align:center;font-size:16px;padding:40px 15px;background:#fff;margin-bottom:15px;">
                            很抱歉,没有找到与【<span style="color: #FF5722;">{{keywords}}</span>】相关的文章，随便看看吧！
                        </div>

                    <div class="flow-default" id="parentArticleList">
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
                            <span><i class="fa fa-tag"></i>&nbsp;&nbsp;<a href="#">{{entity.columnid}}</a></span>
                            <span class="article-viewinfo"><i class="fa fa-eye"></i>&nbsp;{{entity.visits}}</span>
                            <span class="article-viewinfo"><i class="fa fa-commenting"></i>&nbsp;{{entity.comment}}</span>
                        </div>
                    </div>
                    </div>



                </div>
                <div class="blog-main-right">
                    <div class="blog-search">
                        <form class="layui-form" action="">
                            <div class="layui-form-item">
                                <div class="search-keywords  shadow">
                                    <input type="text" name="keywords" lay-verify="required" placeholder="输入关键词搜索" autocomplete="off" class="layui-input" ng-model="keywords">
                                </div>
                                <div class="search-submit  shadow">
                                    <a class="search-btn" lay-submit="formSearch" lay-filter="formSearch"><i class="fa fa-search" ng-click="searchArticle()"></i></a>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="article-category shadow">
                        <div class="article-category-title">分类导航</div>
                        <a href="javascript:layer.msg(&#39;切换到相应分类&#39;)">ASP.NET MVC</a>
                        <a href="javascript:layer.msg(&#39;切换到相应分类&#39;)">SQL Server</a>
                        <a href="javascript:layer.msg(&#39;切换到相应分类&#39;)">Entity Framework</a>
                        <a href="javascript:layer.msg(&#39;切换到相应分类&#39;)">Web前端</a>
                        <a href="javascript:layer.msg(&#39;切换到相应分类&#39;)">C#基础</a>
                        <a href="javascript:layer.msg(&#39;切换到相应分类&#39;)">杂文随笔</a>
                        <div class="clear"></div>
                    </div>
                    <div class="blog-module shadow">
                        <div class="blog-module-title">作者推荐</div>
                        <ul class="fa-ul blog-module-ul">
                            <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.ftl">Web安全之跨站请求伪造CSRF</a></li>
                            <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.ftl">ASP.NET MVC 防范跨站请求伪造（CSRF）</a></li>
                            <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.ftl">C#基础知识回顾-扩展方法</a></li>
                            <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.ftl">一步步制作时光轴（一）（HTML篇）</a></li>
                            <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.ftl">一步步制作时光轴（二）（CSS篇）</a></li>
                            <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.ftl">一步步制作时光轴（三）（JS篇）</a></li>
                            <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.ftl">写了个Win10风格快捷菜单！</a></li>
                            <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.ftl">ASP.NET MVC自定义错误页</a></li>
                            <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.ftl">ASP.NET MVC制作404跳转（非302和200）</a></li>
                            <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.ftl">基于laypage的layui扩展模块（pagesize.js）！</a></li>
                        </ul>
                    </div>
                    <div class="blog-module shadow">
                        <div class="blog-module-title">随便看看</div>
                        <ul class="fa-ul blog-module-ul">
                            <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.ftl">一步步制作时光轴（一）（HTML篇）</a></li>
                            <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.ftl">ASP.NET MVC制作404跳转（非302和200）</a></li>
                            <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.ftl">ASP.NET MVC 防范跨站请求伪造（CSRF）</a></li>
                            <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.ftl">一步步制作时光轴（三）（JS篇）</a></li>
                            <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.ftl">基于laypage的layui扩展模块（pagesize.js）！</a></li>
                            <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.ftl">一步步制作时光轴（二）（CSS篇）</a></li>
                            <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.ftl">写了个Win10风格快捷菜单！</a></li>
                            <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.ftl">常用正则表达式</a></li>
                        </ul>
                    </div>
                    <!--右边悬浮 平板或手机设备显示-->
                    <div class="category-toggle"><i class="fa fa-chevron-left"></i></div>
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
</body>
</html>