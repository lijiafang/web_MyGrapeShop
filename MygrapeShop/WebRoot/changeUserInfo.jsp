<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'changeUserInfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/font.css">
	
	<script type="text/javascript" src="jslib/jquery.js"></script>
	<script type="text/javascript" src="jslib/changeUserInfo.js"></script>
  </head>
  
  <body background="img/bg.jpg">
  <form action="servlet/UserHandleServlet?type=changeUserInfo" method="post">
	<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
	  <tr>
	    <td height="89" colspan="4" align="center"><img src="img/changeUserInfo.jpg" width="507" height="76"  alt=""/></td>
	  </tr>
	  
	  <tr>
	    <td height="309" colspan="4">
			    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			      <tr>
			        <td width="75%" height="382" align="right">
				        <table width="70%" border="1" align="right" cellpadding="0" cellspacing="0">
				          <tr>
				            <td height="55" align="right">原始用户昵称：</td>
				            <td align="center"><input type="text" name="oldUserName" id="oldUserName" 
				            onfocus="showOldUserNameTip()" onblur="hideOldUserNameTip();checkOldInfo()"></td>
				          </tr>
				          <tr>
		    				<td></td>
		    				<td><label id="oldUserNameTip"></label></td>
		    				<td></td>
	    			  	  </tr>
	    			  	  
				          <tr>
				            <td height="55" align="right">原始用户密码：</td>
				            <td align="center"><input type="password" name="oldUserPwd" id="oldUserPwd"
				            	onfocus="showOldUserPwdTip()" onblur="hideOldUserPwdTip();checkOldInfo()"></td>
				          </tr>
				           <tr>
		    				<td></td>
		    				<td><label id="oldUserPwdTip"></label></td>
		    				<td></td>
	    			  	  </tr>
	    			  	  
				          <tr>
				            <td width="46%" height="55" align="right">新昵称：</td>
				            <td align="center"><input type="text" name="userName" id="userName"
				            	onfocus="showUserNameTip()" onblur="hideUserNameTip();checkUserName();checkinfo()" disabled></td>
				          </tr>
				           <tr>
		    				<td></td>
		    				<td><label id="userNameTip"></label></td>
		    				<td></td>
	    			  	  </tr>
	    			  	  
				          <tr>
				            <td height="50" align="right"><p>新密码：</p></td>
				            <td align="center"><input type="password" name="userPwd" id="userPwd" disabled
			            		onfocus="showUserPwdTip()" onblur="hideUserPwdTip();checkpwd1();checkinfo()"></td>
				          </tr>
				           <tr>
		    				<td></td>
		    				<td><label id="userPwdTip"></label></td>
		    				<td></td>
	    			  	  </tr>
	    			  	  
				          <tr>
				            <td height="47" align="right">确认密码：</td>
				            <td height="47" align="center"><input type="password" name="pwdConfirm" id="pwdConfirm" disabled
			            		onfocus="showPwdConfirmTip()"  onblur="checkpwd2();checkinfo()"></td>
				          </tr>
				           <tr>
		    				<td></td>
		    				<td><label id="pwdConfirmTip"></label></td>
		    				<td></td>
	    			  	  </tr>
	    			  	  
	    			  	<tr>
			            <td height="43" align="right">真实姓名：</td>
			            <td align="center"><input type="text" name="userTrueName" id="userTrueName" disabled></td>
			            <td></td>
			            </tr>
			          
	    			  	  
				          <tr>
				            <td height="47" align="right">电话：</td>
				            <td height="47" align="center"><input type="text" name="userPhone" id="userPhone" disabled
			            		 onfocus="showUserPhoneTip()" onblur="checkPhone();checkinfo()"></td>
				          </tr>
				           <tr>
		    				<td></td>
		    				<td><label id="userPhone"></label></td>
		    				<td></td>
	    			  	  </tr>
	    			  	  
				          <tr>
				            <td height="57" align="right">邮箱：</td>
				            <td height="57" align="center"><input type="text" name="userEmail" id="userEmail" disabled onfocus="showEmailTip()" onblur="hideEmailTip();checkEmail();checkinfo()"></td>
				          </tr>
				          <tr>
		    				<td></td>
		    				<td><label id="emailTip"></label></td>
		    				<td></td>
	    			  	  </tr>
	    			  	  
				          <tr>
				            <td height="57" align="right">地址：</td>
				            <td height="57" align="center"><input type="text" name="userAddress" id="userAddress" disabled onfocus="showAddressTip()" onblur="checkAddress();checkinfo()"></td>
				          </tr>
				          <tr>
		    				<td></td>
		    				<td><label id="addressTip"></label></td>
		    				<td></td>
	    			  	  </tr>
				        </table>
				     </td>
			        <td width="25%">
				        <table width="87%" border="0" align="left" cellpadding="0" cellspacing="0">
				          <tr>
				            <td height="48"><label id="oldUserNameNews"></label></td>
				          </tr>
				          <tr>
				            <td height="54"><label id="oldUserPwdNews"></label></td>
				          </tr>
				          <tr>
				            <td height="53"><label id="userNameNews"></label></td>
				          </tr>
				          <tr>
				            <td height="46"><label id="userPwdNews"></label></td>
				          </tr>
				          <tr>
				            <td height="53"><label id="pwdConfirmNews"></label></td>
				          </tr>
				          <tr>
				            <td height="56"><label id="phoneNews"></label></td>
				          </tr>
				          <tr>
				            <td height="53"><label id="emailNews"></label></td>
				          </tr>
				          <tr>
				            <td height="53"><label id="addressNews"></label></td>
				          </tr>
				        </table>
				     </td>
			      </tr>
			    </table>
			 </td>
		  </tr>
		  <tr>
		    <td width="24%" height="78">&nbsp;</td>
		    <td width="26%" align="center"><input type="image" name="register" id="register" src="img/submitButt.jpg" disabled></td>
		    <td width="18%" align="center"><img alt="" src="img/resetButt.jpg" onclick="reset()"></td>
		    <td width="25%">&nbsp;</td>
		  </tr>
	</table>
	</form>
  </body>
</html>
