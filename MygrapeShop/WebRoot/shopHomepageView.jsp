<%@ page language="java" import="java.util.*,model.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

ArrayList al=(ArrayList)request.getAttribute("goods");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'shopHomepageRight.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/font.css">
	

  </head>
  
  <body background="img/bg.jpg">
	<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
	  <tr>
	    <td height="83" colspan="4" align="center"><img src="img/shopHomepageRight.jpg" width="442" height="69"  alt=""/></td>
	  </tr>
	  
	  <tr>
	    <td width="24%" height="221">
	    <table width="95%" border="1" align="center" cellpadding="0" cellspacing="0">
		      <tr align="center">
		        <td width="14%" height="54">葡萄ID</td>
		        <td width="16%">葡萄品种</td>
		        <td width="15%">葡萄价格</td>
		         <td width="15%">葡萄数量</td>
		        <td width="17%">葡萄描述</td>
		        <td width="23%">葡萄图片</td>
		        
		      </tr>
		      
		      <%
		      for(int i=0;i<al.size();i++){
		      	GoodsBean gb=(GoodsBean)al.get(i);
		       %>
		      <tr align="center">
		      	
		        <td><%=gb.getGoodsId()%></td>
		        <td><%=gb.getGoodsType() %></td>
		        <td><%=gb.getGoodsPrice() %></td>
		        <td><%=gb.getGoodsAmount() %></td>
		        <td><%=gb.getGoodsIntro() %></td>
		        <td><%=gb.getGoodsPhoto() %></td>
		        
		      </tr>
		      <%
		      }
		      %>
		     
		    </table>
		 </td>
	 </tr>
	</table>
  </body>
</html>
