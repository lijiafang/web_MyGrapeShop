<%@page import="model.OrderInfoBean"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

//得到orderInfo
OrderInfoBean oib=(OrderInfoBean)request.getAttribute("orderInfo");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'order.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/font.css">
	

  </head>
  
  <body>
	 <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
	  <tr>
	    <td height="52" align="center">
	    	<jsp:include page="head.jsp"></jsp:include>
	    </td>
	  </tr>
	  
	  <tr background="img/bg.jpg">
	    <td align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0">
	      <tr>
	        <td height="75" align="center"><img src="img/shopping3.jpg" width="905" height="56"  alt=""/></td>
	      </tr>
	      <tr>
	        <td height="50" align="center"> 订单信息</td>
	      </tr>
	      <tr>
	        <td height="129" align="center"><table width="80%" border="1" align="center" cellpadding="0" cellspacing="0">
	          <tr align="center">
	            <td width="13%" height="41">订单号</td>
	            <td width="13%">收货人</td>
	            <td width="17%">收货地址</td>
	            <td width="9%">电话</td>
	            <td width="9%">总价</td>
	            <td width="13%">用户名</td>
	            <td width="19%">邮箱</td>
	           <!--  <td width="7%">&nbsp;</td> -->
	            </tr>
	          <tr align="center">
	            <td height="38"><%=oib.getOrderId() %></td>
	            <td><%=oib.getUserTruename() %></td>
	            <td><%=oib.getUserAddress() %></td>
	            <td><%=oib.getUserPhone() %></td>
	            <td><%=oib.getTotalPrice() %></td>
	            <td><%=oib.getUserName() %></td>
	            <td><%=oib.getUserEmail() %></td>
	           <!-- <td>  <input type="button" name="button" id="button" value="查看详情"></td>-->
	            </tr>
	        </table></td>
	      </tr>
	      <tr>
	        <td height="53" align="center">恭 喜，您 的 订 单 已 完 成！</td>
	      </tr>
	    </table></td>
	  </tr>
	  <tr>
	    <td align="center">
	    	<jsp:include page="tail.jsp"></jsp:include>
	    </td>
	  </tr>
	</table>
	<p>&nbsp;</p>
  </body>
</html>
