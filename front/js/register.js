SUCCESS = 0;

var url = "http://127.0.0.1/backend/regist"; //后端地址


function checkRepeatPwd(){
    var password = $("#password").val();
    var repeat = $("#password2").val();
    if(password != repeat){
        document.getElementById('wxfhint').innerHTML =("两次输入的密码不一样")
        return false;
    }
    return true
}

function checkMailaddress() {
	var phone = $("#mobilephone").val();
    if(phone.length ==0){document.getElementById('wxfhint').innerHTML =("手机号不能为空");return false;}
	var rule = /^([0-9]{11})$/;
	if (!rule.test(phone)) {
		document.getElementById('wxfhint').innerHTML =("手机号必须是11位数字");
		return false
    }
    return true
}


//检查名字和密码是否满足规格
function checkPassword() {
    var password = $("#password").val();
    if(password.length ==0){document.getElementById('wxfhint').innerHTML =("密码不能为空");return false;}
    var rule = /^\w{6,20}$/;
    if (!rule.test(password)) {
        document.getElementById('wxfhint').innerHTML =("密码必须满足6~20个字符");
        return false
    }
    return true
}
function checkName() {
    var username = $("#email").val();
    if(username.length ==0){document.getElementById('wxfhint').innerHTML =("用户名不能为空");return false;}
    var rule = /^\w{6,20}$/;
    if (!rule.test(username)) {
        document.getElementById('wxfhint').innerHTML =("用户名必须满足6~20个字符");
        return false
    }
    return true
}



// 注册函数
function registAction() {
    var userName = $("#email").val();
    var password = $("#password").val();
    var phone = $("#mobilephone").val();

    var n = checkPassword() +checkMailaddress()+checkRepeatPwd()+checkName();
    if (n != 4) {
        return
    }

    var data = {
        userName : userName,
        password : password,
        phone : phone,
    };
    $.ajax({
        url : url,
        data : data,
        type : "post",
        dataType : "json",
        success : function(result) {
            if (result.statuscode == SUCCESS) {
                // layer.close(loadingFlag);
               window.alert("注册成功，点击确认返回登录界面")
                setInterval(function(){
                    location.href = "login.html";
                },100);
            } else {
                document.getElementById('wxfhint').innerHTML =("注册失败："+result.errorInfo);
            }
        },
        error: function (jqXHR, exception) {
            var msg = '';
            if (jqXHR.status === 0) {
                msg = 'Can NOT connect to server.';
            } else if (jqXHR.status == 404) {
                msg = 'Requested page not found. [404]';
            } else if (jqXHR.status == 500) {
                msg = 'Internal Server Error [500].';
            } else if (exception === 'parsererror') {
                msg = 'Requested JSON parse failed.';
            } else if (exception === 'timeout') {
                msg = 'Time out error.';
            } else if (exception === 'abort') {
                msg = 'Ajax request aborted.';
            } else {
                msg = 'Uncaught Error.\n' + jqXHR.responseText;
            }
            document.getElementById('wxfhint').innerHTML =("后端异常："+msg);
        }
    })
};
