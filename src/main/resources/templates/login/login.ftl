<#assign ctx=request.getContextPath()>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>小胖子CI系统-用户登录</title>
    <link href="../${ctx}/assets/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <link href="../${ctx}/assets/css/login.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="../${ctx}/assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="../${ctx}/assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../${ctx}/assets/js/index.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-offset-3 col-md-6">
            <form class="form-horizontal" id="loginForm" action="${ctx}/login/main" method="post">
                <span class="heading"><img alt="" src="../${ctx}/assets/img/user120.png"></span>
                <div class="form-group">
                    <input type="text" class="form-control" id="userName" name="userName"  placeholder="用 户 名">
                    <i class="fa fa-user"></i>
                </div>
                <div class="form-group help">
                    <input type="password" class="form-control" id="password" name="password"  placeholder="密　码">
                    <i class="fa fa-lock"></i>
                    <a href="#" class="fa fa-question-circle"></a>
                </div>
                <div class="form-group">
                    <div class="errorMsg"></div>
                    <button type="button" id="loginbtn" onclick="login();" class="btn btn-default">登录</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        $("body").keydown(function() {
            //回车提交表单
            if (event.keyCode == "13") {
                $("#loginbtn").click();
            }
        });
    });

    function login(){
        var userName = $("#userName").val();
        var password = $("#password").val();
        if(userName==""){
            showErrorMsg("用户名不能为空！");
            return false;
        }
        if(password==""){
            showErrorMsg("密码不能为空！");
            return false;
        }
        $("#loginForm").submit();
    }

    function showErrorMsg(msg) {
        $(".errorMsg").text(msg);
    }

</script>
</body>
</html>