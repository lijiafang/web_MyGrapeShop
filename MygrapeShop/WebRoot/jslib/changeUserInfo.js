var idok=false;
var passwordok=false;
var passwordConfirmok=false;
var emailok=false;
var addressok=false;
var phoneok=false;


function showOldUserNameTip(){
	//alert("test"+SUCCESS);
	$("#oldUserNameNews").html("");
	$("#oldUserNameTip").html("请输入原始用户名称");
}
function showOldUserPwdTip(){
	$("#oldUserPwdNews").html("");
	$("#oldUserPwdTip").html("请输入原始用户密码");
}
function hideOldUserNameTip(){
	$("#oldUserNameTip").html("");
	return;
}
function hideOldUserPwdTip(){
	$("#oldUserPwdTip").html("");
	return;
}

function checkOldInfo(){
	
	var oldUserName=$("#oldUserName").val();
	//alert(userName);
	var oldUserPwd=$("#oldUserPwd").val();
	//alert(userPwd);
	if(oldUserName.length==0){
		
		$("#oldUserNameNews").html("请输入原始用户昵称");
		if(oldUserPwd.length==0){
			$("#oldUserPwdNews").html("请输入原始用户密码");
			
		}
		return;
	}
	if(oldUserName.length!=0){
		//alert(userName);
		$("#oldUserNameNews").html("");
	}
	if(oldUserPwd.length==0){
		$("#oldUserPwdNews").html("请输入原始用户密码");
		return;
	}
	if(oldUserPwd.length!=0){
		$("#oldUserPwdNews").html("");
	}
	//这里先假设为正确，让这些按钮可用
	/*if(oldUserName.length!=0&&oldUserPwd.length!=0){
		$("#userName").attr("disabled",false);
		
		$("#userPwd").attr("disabled",false);
		$("#pwdConfirm").attr("disabled",false);
		$("#userPhone").attr("disabled",false);
		$("#userAccount").attr("disabled",false);
	}*/
	
	
	$.get("servlet/UserHandleServlet?type=checkInfo&userName="+oldUserName+"&userPwd="+oldUserPwd,null,writeCheckInfo);
	//$.get("servlet/UserLoginCheck?userName="+userName+"&userPwd="+userPwd,null,writeCheckInfo);
}
function writeCheckInfo(data){
	
	//alert("test"+SUCCESS);
	
	
	if(data==1){
		
		$("#userName").attr("disabled",false);
		$("#userPwd").attr("disabled",false);
		$("#pwdConfirm").attr("disabled",false);
		$("#userTrueName").attr("disabled",false);
		$("#userPhone").attr("disabled",false);
		$("#userEmail").attr("disabled",false);
		$("#userAddress").attr("disabled",false);
	}else if(data==0){
		$("#olduseridnews").html("信息错误，请确认后重输");
	}else{
		$("#olduseridnews").html("系统繁忙，请稍后再试");
	}
	/*if(data==NOUSER){
		$("#olduseridnews").html("该用户名不存在");
	}
	if(data==PASSWORDERROR){
		$("#oldpwdnews").html("密码错误");
	}*/
	
}
function showUserNameTip(){
	idok=false;
	msg='<fieldset style="font-size:40%;color:#E00000;border:#E00000 dashed 1px;">4~10个字符，包括数字下划线，字母，必须以英文字母开始</fieldset>';
	$("#userNameTip").html(msg);
	$("#userNameNews").html("");
	return;
}

function showUserPwdTip(){
	passwordok=false;
	
	msg='<fieldset style="font-size:80%;color:#E00000;border:#E00000 dashed 1px;">6~10个字符，区分大小写，不能以空格，用户名作为密码</fieldset>';
	$("#userPwdTip").html(msg);
	$("#userPwdNews").html("");
	return;
}

function showPwdConfirmTip(){
	passwordconfirmok=false;
	$("#pwdConfirmNews").html("");
}

function showEmailTip(){
	
	emailok=false;
	msg='<fieldset style="font-size:80%;color:#E00000;border:#E00000 dashed 1px;">请输入您的银行账户，该账户将作为您在本商城的支付账户</fieldset>';
	$("#emailTip").html(msg);
	$("#emailNews").html("");
	return;
}

function showUserPhoneTip(){
	phoneok=false;
	$("userPhoneNews").html("");
}
function showAddressTip(){
	addressok=false;
	$("addressNews").html("");
}

function hideUserNameTip(){
	$("#userNameTip").html("");
	return;
}
function hideUserPwdTip(){
	$("#userPwdTip").html("");
	return;
}

function  hideEmailTip(){
	$("#emailTip").html("");
	return;
}

function checkUserName(){
	
	var userName=$("#userName").val();
	//alert(userName);
	if(userName.length<4){
		msg="用户名称字符不能小于4.";
		msg='<div style="font-size:40%;color:#FF0000;">'+msg+'</div>';
		$("#userNameNews").html(msg);
		return false;
	}
	//暂时先写成true，这个由下面的逻辑控制
	idok=true;
	$.get("servlet/UserHandleServlet?type=checkUserName?userName="+userName,null,writeUserNameInfo);
}
function writeUserNameInfo(data){
	//alert(data);
	if(data==EXISTEDNAME){
		msg="用户名重复";
	}else if(data==SUCCESS){
		msg="账号可用";
		idok=true;
	}else{
		msg="系统繁忙，稍后再试";
	}
	msg='<div style="font-size:40%;color:#00FF00">'+msg+'</div>';
	$("#userNameNews").html(msg);
}

function checkpwd1(){
	
	var userpwd=$("#userPwd").val();
	var result=$("#userPwdNews");
	if(userpwd.length<6){
		msg="新密码字符不能小于6位.";
		msg='<div style="font-size:40%;color:#FF0000;">'+msg+'</div>';
		result.html(msg);
		return false;
	}
	if(userpwd.indexOf(" ")>=0){
		msg="新密码不能有空格.";
		msg='<div style="font-size:40%;color:#FF0000;">'+msg+'</div>';
		result.html(msg);
		return false;
	}
	var userid=$("#userName").val();
	if(userpwd==userid){
		msg="用户密码不能与用户名称相同.";
		msg='<div style="font-size:40%;color:#FF0000;">'+msg+'</div>';
		result.html(msg);
		return false;
	}
	msg='<div style="font-size:40%;color:#FFFF33;">密码有效</div>';
	result.html(msg);
	passwordok=true;
	
}
function checkpwd2(){
	var userpwd=$("#userPwd").val();
	var userpwd2=$("#pwdConfirm").val();
	var result=$("#pwdConfirmNews");
	if(userpwd!=userpwd2){
		msg='<div style="font-size:40%;color:#FF0000;">与第一次输入的密码不匹配</div>';
		result.html(msg);
		
		return false;
	}
		result.html("");
		passwordConfirmok=true;
	
}

function checkPhone(){
	
	var result=$("#phoneNews");
	var userPhone=$("#userPhone").val();
	if(userPhone.length<1){
		msg="电话号码不能为空";
		msg='<div style="font-size:40%;color:#FF0000;">'+msg+'</div>';
		result.html(msg);
		return false;
	}
	result.html("");
	phoneok=true;
	
}

function checkEmail(){
	
	var result=$("#emailNews");
	var userEmail=$("#userEmail").val();
	if(userEmail.length<1){
		msg="邮箱不能为空";
		msg='<div style="font-size:40%;color:#FF0000;">'+msg+'</div>';
		result.html(msg);
		return false;
	}
	result.html("");
	emailok=true;
	
}

function checkAddress(){
	
	var result=$("#addressNews");
	var userAddress=$("#userAddress").val();
	if(userAddress.length<1){
		msg="地址不能为空";
		msg='<div style="font-size:40%;color:#FF0000;">'+msg+'</div>';
		result.html(msg);
		return false;
	}
	result.html("");
	addressok=true;
	
}

function checkinfo(){
	var result=$("#register");
	if(idok==false||passwordok==false||passwordConfirmok==false||phoneok==false||emailok==false||addressok==false){
		result.attr("disabled",true);
	}else{
		result.attr("disabled",false);
	}
	
	return;
}

function reset(){
	var userName=$("#userName");
	userName.html("");
	var userPwd=$('#userPwd');
	userPwd.html("");
	var pwdConfirm=$('#pwdConfirm');
	pwdConfirm.html("");
	var userEmail=$('#userEmail');
	userEmail.html("");
	var userPhone=$("#userPhone");
	userPhone.html("");
	var userAddress=$("#userAddress");
	userAddress.html("");
}



