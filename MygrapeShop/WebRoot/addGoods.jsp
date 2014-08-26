<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addGoods.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/font.css">
	

  </head>
  
  <body background="img/bg.jpg">
	  <form action="servlet/GoodsHandleServlet?type=add" method="post">
			 <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
			  <tr>
			    <td height="92" colspan="4" align="center"><img src="img/addGoods.jpg" width="353" height="69"  alt=""/></td>
			  </tr>
			  
			  <tr>
			    <td height="309" colspan="4">
				    <table width="50%" border="1" align="center" cellpadding="0" cellspacing="0">
				     
				      <tr>
				        <td height="50" align="right">葡萄名称：</td>
				        <td align="center"><input type="text" name="goodsType" id="goodsType"></td>
				      </tr>
				      <tr>
				        <td height="50" align="right"><p>价格：</p></td>
				        <td align="center"><input type="text" name="goodsPrice" id="goodsPrice"></td>
				      </tr>
				       <tr>
				        <td height="50" align="right"><p>库存量：</p></td>
				        <td align="center"><input type="text" name="goodsAmount" id="goodsAmount"></td>
				      </tr>
				      <tr>
				        <td height="47" align="right">介绍：</td>
				        <td height="47" align="center"><input type="text" name="goodsIntro" id="goodsIntro"></td>
				      </tr>
				      <tr>
				        <td height="47" align="right">图片：</td>
				        <td height="47" align="center"><input type="text" name="goodsPhoto" id="goodsPhoto"></td>
				      </tr>
				    </table>
				 </td>
			  </tr>
			  <tr>
			    <td width="23%" height="98">&nbsp;</td>
			    <td width="27%" align="center"><input type="image" name="imageField" id="imageField" src="img/submitButt.jpg"></td>
			    <td width="25%" align="center"><input type="image" name="imageField2" id="imageField2" src="img/resetButt.jpg"></td>
			    <td width="25%">&nbsp;</td>
			  </tr>
			</table>
		</form>
	
  </body>
</html>
