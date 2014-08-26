<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'shopHomepageLeft.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/font.css">
	

  </head>
  
  <body background="img/bg.jpg">
	   <table width="73%" border="0" align="center" cellpadding="0" cellspacing="0">
		  <tr>
		    <td height="73" align="center"><a href="servlet/GoodsHandleServlet?type=getGoodsByShop&operator=look" target="show"><img src="img/shopHomepage.jpg" width="216" height="69"  alt=""/></a></td>
		  </tr>
		  <tr>
		    <td height="75" align="center"><a href="changeShopInfo.jsp" target="show">修改店铺信息</a></td>
		  </tr>
		  <tr>
		    <td height="73" align="center"><a href="addGoods.jsp" target="show">增加商品</a></td>
		  </tr>
		  <tr>
		    <td height="75" align="center"><a href="servlet/GoodsHandleServlet?type=getGoodsByShop&operator=delete" target="show">删除商品</a></td>
		  </tr>
		  <tr>
		    <td height="75" align="center"><a href="servlet/GoodsHandleServlet?type=getGoodsByShop&operator=update" target="show">修改商品信息</a></td>
		  </tr>
		  <tr>
		    <td height="75" align="center"><a href="servlet/OrdersHandleServlet?type=showShopTradeHistory" target="show">查看交易记录</a></td>
		  </tr>
		  <tr>
		    <td height="75" align="center"><a href="shopLogout.jsp" target="show">注销店铺</a></td>
		  </tr>
	</table>
  </body>
</html>
