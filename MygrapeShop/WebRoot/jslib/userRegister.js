var idok=false;
var passwordok=false;
var passwordConfirmok=false;
var truenameok=false;
var emailok=false;
var addressok=false;
var phoneok=false;

function showUserNameTip(){
	idok=false;
	
	msg='<fieldset style="font-size:40%;color:#E00000;border:#E00000 dashed 1px;">4~10个字符，包括数字下划线，字母，必须以英文字母开始</fieldset>';
	$("#userNameTip").html(msg);
	$("#userNameNews").html("");
	
	
}

function showUserPwdTip(){
	passwordok=false;
	
	msg='<fieldset style="font-size:80%;color:#E00000;border:#E00000 dashed 1px;">6~10个字符，区分大小写，不能以空格，用户名作为密码</fieldset>';
	$("#userPwdTip").html(msg);
	$("#userPwdNews").html("");
	
}

function showPwdConfirmTip(){
	
	passwordConfirmok=false;
	$("#pwdConfirmNews").html("");
}

function showUserTrueNameTip(){
	truenameok=false;
	$("#trueNameNews").html("");
}

function showEmailTip(){
	emailok=false;
	
	msg='<fieldset style="font-size:80%;color:#E00000;border:#E00000 dashed 1px;">邮箱不能为空</fieldset>';
	$("#emailTip").html(msg);
	$("#emailtNews").html("");
	
}

function showPhoneTip(){
	phoneok=false;
	
	$("#phoneNews").html("");
}

function showAddressTip(){
	addressok=false;
	$("#addressNews").html("");
}

function hideUserNameTip(){
	$("#userNameTip").html("");
	
}
function hideUserPwdTip(){
	$("#userPwdTip").html("");
	
}

function  hideAccountTip(){
	$("#accountTip").html("");
	
}

function checkUserName(){
	
	var userName=$("#userName").val();
	//alert(userName);
	if(userName.length<4){
		msg="用户名称字符不能小于4.";
		msg='<fieldset style="color:#FF0000;">'+msg+'</fieldset>';
		$("#userNameNews").html(msg);
		return false;
	}
	//暂时先写成true，这个由下面的逻辑控制
	//idok=true;
	
	$.get("servlet/UserHandleServlet?type=checkUserName&userName="+userName,null,writeUserNameInfo);
}
function writeUserNameInfo(data){
	//alert(data);
	
	if(data==1){
		//alert("2");
		idok=true;
		msg="用户名可用";
		msg='<fieldset style="color:#FFFF33">'+msg+'</fieldset>';
		$("#userNameNews").html(msg);
	}else if(data==0){
		//alert("1");
		msg="用户名重复";
		msg='<fieldset style="color:#FF0000">'+msg+'</fieldset>';
		$("#userNameNews").html(msg);
	}else{
		alert("error");
	}
	/*if(data.equals("flase")){
		alert("1");
		msg="用户名重复";
		msg='<div style="font-size:40%;color:#FF0000">'+msg+'</div>';
		$("#userNameNews").html(msg);
	}
	else if(data.equals("true")){
		alert("2");
		idok=true;
		msg="用户名可用";
		msg='<div style="font-size:40%;color:#FFFF33">'+msg+'</div>';
		$("#userNameNews").html(msg);
	}else{
		alert("error");
	}*/
}

function checkpwd1(){
	
	var userpwd=$("#userPwd").val();
	var result=$("#userPwdNews");
	if(userpwd.length<6){
		msg="新密码字符不能小于6位.";
		msg='<fieldset style="color:#FF0000;">'+msg+'</fieldset>';
		result.html(msg);
		return false;
	}
	if(userpwd.indexOf(" ")>=0){
		msg="新密码不能有空格.";
		msg='<fieldset style="color:#FF0000;">'+msg+'</fieldset>';
		result.html(msg);
		return false;
	}
	var userid=$("#userName").val();
	if(userpwd==userid){
		msg="用户密码不能与用户名称相同.";
		msg='<fieldset style="color:#FF0000;">'+msg+'</fieldset>';
		result.html(msg);
		return false;
	}
	msg='<fieldset style="color:#FFFF33;">密码有效</fieldset>';
	result.html(msg);
	passwordok=true;
	
}
function checkpwd2(){
	var userpwd=$("#userPwd").val();
	var userpwd2=$("#pwdConfirm").val();
	var result=$("#pwdConfirmNews");
	if(userpwd!=userpwd2){
		msg='<fieldset style="color:#FF0000;">与第一次输入的密码不匹配</fieldset>';
		result.html(msg);
		passwordConfirmok=false;
		return false;
	}
	result.html("");
	passwordConfirmok=true;
	
}

function checkTrueName(){
	
	var result=$("#trueNameNews");
	var userTrueName=$("#userTrueName").val();
	if(userTrueName.length<1){
		msg="真实姓名不能为空";
		msg='<fieldset style="color:#FF0000;">'+msg+'</fieldset>';
		result.html(msg);
		return false;
	}
	result.html("");
	truenameok=true;
	
}

function checkPhone(){
	
	var result=$("#phoneNews");
	var userPhone=$("#userPhone").val();
	if(userPhone.length<1){
		msg="电话号码不能为空";
		msg='<fieldset style="color:#FF0000;">'+msg+'</fieldset>';
		result.html(msg);
		return false;
	}
	result.html("");
	phoneok=true;
	
}

function checkAddress(){
	
	var result=$("#addressNews");
	var userAddress=$("#userAddress").val();
	if(userAddress.length<1){
		msg="地址不能为空";
		msg='<fieldset style="color:#FF0000;">'+msg+'</fieldset>';
		result.html(msg);
		return false;
	}
	result.html("");
	addressok=true;
	
}

function checkEmail(){
	
	var result=$("#emailNews");
	var userEmail=$("#userEmail").val();
	if(userEmail.length<1){
		msg="邮箱不能为空";
		msg='<fieldset style="color:#FF0000;">'+msg+'</fieldset>';
		result.html(msg);
		return false;
	}
	result.html("");
	emailok=true;

}

function checkinfo(){
	var result=$("#register");
	if(idok==false||passwordok==false||passwordConfirmok==false||emailok==false||phoneok==false||addressok==false){
		result.attr("disabled",true);
	}else{
		result.attr("disabled",false);
	}
	
	return;
}

function reset(){
	var userName=$("#userName");
	userName.html("");
	$("#userNameNews").html("");
	
	var userPwd=$('#userPwd');
	userPwd.html("");
	$('#userPwdNews').html("");
	
	var pwdConfirm=$('#pwdConfirm');
	pwdConfirm.html("");
	$('#pwdConfirmNews').html("");
	
	$("#userTrueName").html("");
	$("#trueNameNews").html("");
	
	var userEmail=$('#userEmail');
	userEmail.html("");
	$("#emailNews").html("");
	
	var userPhone=$("#userPhone");
	userPhone.html("");
	$("#phoneNews").html("");
	
	var userAddress=$("#userAddress");
	userAddress.html("");
	$("#addressNews").html("");
}



