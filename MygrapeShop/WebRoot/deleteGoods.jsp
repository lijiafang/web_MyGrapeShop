<%@page import="model.GoodsBean"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

ArrayList al=(ArrayList)request.getAttribute("goods");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'deleteGoods.jsp' starting page</title>
    
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
	    <td height="113" colspan="4" align="center"><img src="img/deleteGoods.jpg" width="277" height="62"  alt=""/></td>
	  </tr>
	  
	  <tr>
	    <td height="202" colspan="4">
	       <form action="servlet/GoodsHandleServlet?type=delete" method="post">
		    <table width="80%" border="1" align="center" cellpadding="0" cellspacing="0">
		      <tr align="center">
		        <td width="20%" height="54">葡萄ID</td>
		        <td width="30%">葡萄种类</td>
		        <td width="31%">葡萄描述</td>
		        <td width="19%">&nbsp;</td>
		      </tr>
		      
		      <%
		      for(int i=0;i<al.size();i++){
		      	GoodsBean gb=(GoodsBean)al.get(i);
		      	
		       %>
		      <tr align="center">
		      
		        <td height="48"><%=gb.getGoodsId() %><input type="hidden" name="goodsId" id="goodsId" value=<%=gb.getGoodsId() %>></td>
		        <td><%=gb.getGoodsType() %></td>
		        <td><%=gb.getGoodsIntro() %></td>
		        <td><input type="image" name="imageField3" id="imageField3" src="img/delGoodsButt.jpg"></td>
		      </tr>
		      
		      <%
		      }
		       %>
		    </table>
		    </form>
		 </td>
	  </tr>
	  <tr>
	    <td width="25%" height="106">&nbsp;</td>
	    <td width="25%" align="center"><input type="image" name="imageField" id="imageField" src="img/submitButt.jpg"></td>
	    <td width="24%" align="center"><input type="image" name="imageField2" id="imageField2" src="img/resetButt.jpg"></td>
	    <td width="26%">&nbsp;</td>
	  </tr>
	</table>
  </body>
</html>
