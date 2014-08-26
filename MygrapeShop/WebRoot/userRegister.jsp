<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String flag=(String)request.getAttribute("flag");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userRegister.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/font.css">
	
	<script  src="jslib/jquery.js" type="text/javascript"></script>
	<script  src="jslib/userRegister.js" type="text/javascript"></script>
	

  </head>
  
  <body>
	 <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
	  <tr>
	    <td align="left">
	    	<jsp:include page="homeHead.jsp"></jsp:include>
	    </td>
	  </tr>
	  
	  <tr background="img/userLoginBg.jpg">
	    <td>
	      <form action="servlet/UserHandleServlet?type=register" method="post">
		    <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
		      <tr>
		        <td height="75" colspan="4" align="center"><img src="img/userRegister.jpg" width="136" height="49"  alt=""/></td>
		      </tr>
		      <tr>
		      	<td>
		      		
		      		 	
		      	</td>
		      </tr>
		      <tr>
		        <td colspan="4">
			        <table width="60%" border="1" align="center" cellpadding="0" cellspacing="0">
			          <tr>
			            <td width="46%" height="55" align="right">用户昵称：</td>
			            <td align="center"><input type="text" name="userName" id="userName" onfocus="showUserNameTip()"
			            		onblur="hideUserNameTip();checkUserName();checkinfo()">
			            </td>
			            <td align="center"><label id="userNameNews"></label></td>
			          </tr>
			          <tr>
	    				<td></td>
	    				<td><label id="userNameTip"></label></td>
	    				<td></td>
	    			  </tr>
	    			  
	    			  
			          <tr>
			            <td height="50" align="right"><p>密码：</p></td>
			            <td align="center"><input type="password" name="userPwd" id="userPwd" onfocus="showUserPwdTip()"
			            		onblur="hideUserPwdTip();checkpwd1();checkinfo()">
			            </td>
			            <td align="center"><label id="userPwdNews"></label></td>
			           </tr>
			           <tr>
	    				<td></td>
	    				<td><label id="userPwdTip"></label></td>
	    				<td></td>
	    			  </tr>
	    			  
			          <tr>
			            <td height="44" align="right">确认密码：</td>
			            <td align="center"><input type="password" name="pwdConfirm" id="pwdConfirm" onfocus="showPwdConfirmTip()"
			            	onblur="checkpwd2();checkinfo()"></td>
			            <td align="center"><label id="pwdConfirmNews"></label></td>
			            </tr>
			         
			         
	    			  
			          <tr>
			            <td height="43" align="right">真实姓名：</td>
			            <td align="center"><input type="text" name="userTrueName" id="userTrueName" onfocus="showUserTrueNameTip()"
			            	onblur="checkTrueName();checkinfo()"></td>
			            <td align="center"><label id="trueNameNews"></label></td>
			            </tr>
			             
	    			  
			          <tr>
			            <td height="44" align="right">电话号码：</td>
			            <td align="center"><input type="text" name="userPhone" id="userPhone" onfocus="showPhoneTip()"
			            	onblur="checkPhone();checkinfo()"></td>
			          	<td><label id="phoneNews"></label></td>  
			          </tr>
			            
			          <tr>
			            <td height="47" align="right">地址：</td>
			            <td align="center"><input type="text" name="userAddress" id="userAddress" onfocus="showAddressTip()"
			            	onblur="checkAddress();checkinfo()"></td>
			          	<td><label id="addressNews"></label></td>   
			          </tr>
			            
			          <tr>
			            <td height="53" align="right">邮箱：</td>
			            <td align="center"><input type="text" name="userEmail" id="userEmail" onfocus="showEmailTip"
			            	onblur="checkEmail();checkinfo()"></td>
			         	<td><label id="emailNews"></label></td>   
			          </tr>
		           
			        </table>
		        </td>
		      </tr>
		      <tr>
		        <td width="46%" height="51">&nbsp;</td>
		        <td width="17%" align="center"><input type="submit" name="register" id="register" value="注册" disabled style="font-size:20pt;width:100;height:50"></td>
		        <td width="18%" align="center"><input type="reset" name="button2" id="button2" value="重置" style="font-size:20pt;width:100;height:50"></td>
		        <td width="19%">&nbsp;</td>
		      </tr>
		    </table>
		   </form>
		 </td>
	  </tr>
	  <tr>
	    <td height="56" align="center">
	    	<jsp:include page="tail.jsp"></jsp:include>
	    </td>
	  </tr>
	</table>
  </body>
</html>
