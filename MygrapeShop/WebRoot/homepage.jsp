<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'homepage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="css/font.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
		/* if (top.location != self.location){  
			top.location=self.location;  
		} */
		if(window.top!=window.self){
			window.top.location="homepage.jsp";
		}
	</script>

  </head>
  
 <body class="font" style="">
	<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
	  <tr class="font">
	    <td height="78" colspan="2" align="left">
	    	<jsp:include page="homeHead.jsp"></jsp:include>
	    </td>
	  </tr>
	  
	  <tr background="img/bg.jpg">
	    <td width="36%" height="347" align="center" class="font"><img src="img/p4.jpg" width="361" height="335"  alt=""/></td>
	    <td width="64%" align="center">
		    <form action="servlet/UserHandleServlet?type=login" method="post">
			    <table width="100%" height="348" border="0" cellpadding="0" cellspacing="0" >
			      <tr>
			        <td width="37%" height="73" align="right">用户名：</td>
			        <td width="63%" align="left" style="font-size: 24px"><input type="text" name="userName" id="textfield"></td>
			      </tr>
			      <tr>
			        <td colspan="2" align="right">&nbsp;</td>
			        </tr>
			      <tr>
			        <td height="61" align="right">密 码：</td>
			        <td align="left" style="font-size: 24px"><input type="password" name="userPwd" id="password2"></td>
			      </tr>
			      <tr>
			        <td height="58" colspan="2" align="center"><input name="button" type="submit" id="button" value="登陆" style="font-size:20pt;width:100;height:50"></td>
			      </tr>
			      <tr>
			        <td height="49" colspan="2" align="right">新用户请先<a href="userRegister.jsp">注册</a></td>
			      </tr>
			      <tr>
			        <td height="74" colspan="2" align="center"><a href="userRegister.jsp"><input name="button2" type="button" id="button2" value="注册" style="font-size:20pt;width:100;height:50"></a>
			          <a href="shopLogin.jsp"><input name="button3" type="button" id="button3" value="店铺登陆" style="font-size:20pt;width:150;height:50"></a>
			          <a href="shopRegister.jsp"><input name="button4" type="button" id="button4" value="店铺注册" style="font-size:20pt;width:150;height:50"></a></td>
			        </tr>
			    </table>
		    </form>
	    </td>
	  </tr>
	  <tr class="font">
	    <td height="135" colspan="2" align="center">
	    	<jsp:include page="tail.jsp"></jsp:include>
	    </td>
	  </tr>
	</table>
	<p>&nbsp;</p>
</body>
</html>
