<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'aboutOurTeam.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/font.css">
	
	<script type="text/javascript">
		if (top.location != self.location){  
			top.location=self.location;  
		}
	
	</script>
  </head>
  
  <body background="img/bg.jpg">
	 <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
	 <tr>
	    <td align="center">
	    	<jsp:include page="head.jsp"></jsp:include>
	    </td>
	  </tr>
	 <tr>
	 
	  
	   <td style="text-align:center">
	  <h2></h2>
	  <h2></h2>
	 
	  </td>
	  </tr>
	  <tr>
	   <td style="text-align:center">
	  <h2>电话：18700420114</h2>
	  <h2>邮箱：1031942456@qq.com</h2>
	 
	  </td>
	  </tr>
	  <tr>
	   <td style="text-align:center">
	  <h2></h2>
	 <h2></h2>
	  </td>
	  </tr>
	  <tr>
	   <td style="text-align:center">
	  <h2></h2>
	  <h2></h2>
	 
	  </td>
	  </tr>
	  <tr>
		<td align="center">
		<jsp:include page="tail.jsp"></jsp:include>
	    </td>
	</tr>
	</table>
  </body>
</html>
