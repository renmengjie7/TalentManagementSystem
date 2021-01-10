SUCCESS = 0;

var url = "http://127.0.0.1/backend/login"; //登录后端地址
var successJumpTo = "test.html"; //登录成功后跳转

//检查名字和密码是否满足规格
function checkPassword() {
    var password = $("#password").val();
    if(password.length ==0){window.alert("密码不能为空");return false;}
    var rule = /^\w{6,20}$/;
    if (!rule.test(password)) {
        window.alert("密码必须满足6~20个字符");
        return false
    }
    return true
}
function checkName() {
    var username = $("#email").val();
    if(username.length ==0){window.alert("用户名不能为空");return false;}
    var rule = /^\w{6,20}$/;
    if (!rule.test(username)) {
        window.alert("用户名必须满足6~20个字符");
        return false
    }
    return true
}


//登录函数 
function login() {
    var userName = $("#email").val();
    var password = $("#password").val();
    var n =  checkName() + checkPassword();
    if (n != 2) {
        return
    }
    $.ajax({
        url : url,
        type : "post",//post请求
        dataType : "json",
        data:{
            "userName" : userName,
            "password" : password,
        },
       //接收函数
        success : function(result) {//指发送成功后显示（这里默认已经收到了请求了）
            //window.alert("enter");
           // window.alert(typeof result.statuscode);
            if (result.statuscode === SUCCESS) {
               window.alert("登录成功,欢迎"+userName);
               //添加cookie
                addCookie("userName",userName);
                addCookie("password",password);
                addCookie("token",result.token);
                //  layer.msg("登录成功",{icon:1});
                setInterval(function (){
                    location.href=successJumpTo;
                },100)
            } else {
                window.alert(result.errorInfo);
            }
        },
        error : function(e) {
            window.alert("error,无法连接到后端"+url);
        }
    })
};
