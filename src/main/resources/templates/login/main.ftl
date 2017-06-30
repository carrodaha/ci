<#assign ctx=request.getContextPath()>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="../assets/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" href="../${ctx}/assets/css/font-awesome.min.css">
    <script type="text/javascript" src="${ctx}/assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctx}/assets/js/index.js"></script>
    <link rel="stylesheet" href="${ctx}/assets/css/ace.min.css">
    <link rel="stylesheet" href="${ctx}/assets/css/ace-skins.min.css"/>
    <link rel="stylesheet" href="${ctx}/assets/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="${ctx}/assets/css/animate.css">
    <link rel="stylesheet" href="${ctx}/assets/css/home.css">

</head>
<body class="no-skin">
<div id="navbar" class="navbar navbar-default">
    <div class="navbar-container" id="navbar-container">
        <!-- /section:basics/sidebar.mobile.toggle -->
        <div class="navbar-header pull-left">
            <!-- #section:basics/navbar.layout.brand -->
            <a href="javascript:void(0)" class="navbar-brand">
                <i class="fa fa-database blue"></i> 小胖子CI系统
            </a>
        </div>
    </div><!-- /.navbar-container -->
</div>

<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">

    <!-- #section:basics/sidebar -->
    <div id="sidebar" class="sidebar responsive">
        <ul class="nav nav-list">
            <li class="">
                <a href="javascript:void(0)" class="dropdown-toggle root">
                    <i class="menu-icon fa fa-desktop"></i>
                    <span class="menu-text"> 应用 </span>

                    <b class="arrow fa fa-angle-down"></b>
                </a>

                <b class="arrow"></b>

                <ul class="submenu">
                    <li class="">
                        <a href="javascript:void(0)" data-url="../app/package" class="dropdown-toggle">
                            <i class="menu-icon fa fa-caret-right"></i>

                            打包
                        </a>

                        <b class="arrow"></b>
                    </li>

                    <li class="">
                        <a href="javascript:void(0)" data-url="../app/toDeploy">
                            <i class="menu-icon fa fa-caret-right"></i>
                            部署
                        </a>

                        <b class="arrow"></b>
                    </li>

                    <li class="">
                        <a href="javascript:void(0)" data-url="../app/hostWork">
                            <i class="menu-icon fa fa-caret-right"></i>
                            服务器启停
                        </a>

                        <b class="arrow"></b>
                    </li>

                </ul>
            </li>

            <li class="">
                <a href="javascript:void(0)" class="dropdown-toggle root">
                    <i class="menu-icon fa fa-list"></i>
                    <span class="menu-text"> 配置 </span>

                    <b class="arrow fa fa-angle-down"></b>
                </a>

                <b class="arrow"></b>

                <ul class="submenu">
                    <li class="">
                        <a href="javascript:void(0)" data-url="../package/query.htm">
                            <i class="menu-icon fa fa-caret-right"></i>
                            配置套餐
                        </a>

                        <b class="arrow"></b>
                    </li>

                    <li class="">
                        <a href="javascript:void(0)" data-url="../host/query">
                            <i class="menu-icon fa fa-caret-right"></i>
                            主机
                        </a>

                        <b class="arrow"></b>
                    </li>

                </ul>
            </li>

        </ul><!-- /.nav-list -->

        <!-- #section:basics/sidebar.layout.minimize -->
        <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
            <i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left"
               data-icon2="ace-icon fa fa-angle-double-right"></i>
        </div>

        <!-- /section:basics/sidebar.layout.minimize -->
    </div>

    <!-- /section:basics/sidebar -->
    <div class="main-content">
        <!-- #section:basics/content.breadcrumbs -->
        <div class="breadcrumbs" id="breadcrumbs">

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <b>小胖子CI系统</b>
                </li>
                <li class="active">应用</li>
                <li class="active">打包</li>
            </ul><!-- /.breadcrumb -->

        </div>

        <!-- /section:basics/content.breadcrumbs -->
        <div class="page-content">
            <iframe src="#" id="mainFrame" frameborder="0" onload=""></iframe>
        </div><!-- /.page-content -->
    </div><!-- /.main-content -->

    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->


<script type="text/javascript" src="../assets/js/ace-extra.min.js"></script>
<script type="text/javascript" src="../assets/js/ace.min.js"></script>
<script type="text/javascript" src="../assets/js/ace-elements.min.js"></script>
<script>
    $(document).ready(function () {
        $(".submenu>li>a").on("click", function () {
            var url = $(this).attr("data-url");
            $("#mainFrame").attr("src", url);
            createBreadcrumbs(this);
        });
    });

    function createBreadcrumbs(element) {
        var ret = '';
        var txt = $.trim($(element).text());
        var parent = $(element).parent().parent().siblings("a").get(0);
        var parentTxt = $.trim($(parent).text());

        ret += '<li class="active">' + parentTxt + '</li>'
        ret += '<li class="active">' + txt + '</li>'
        $(".breadcrumb").children(".active").remove();
        $(".breadcrumb").append(ret);
    }
</script>
</body>
</html>