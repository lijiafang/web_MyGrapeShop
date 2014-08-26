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
    
    <title>My JSP 'changeGoodsInfo.jsp' starting page</title>
    
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
	    <td height="113" colspan="4" align="center"><img src="img/updGoods.jpg" width="427" height="66"  alt=""/></td>
	  </tr>
	  <tr>
	    <td height="189" colspan="4">
	      <form action="servlet/GoodsHandleServlet?type=update" method="post">
		    <table width="95%" border="1" align="center" cellpadding="0" cellspacing="0">
		      <tr align="center">
		        <td width="14%" height="54">葡萄ID</td>
		        <td width="16%">葡萄品种</td>
		        <td width="15%">葡萄价格</td>
		         <td width="15%">葡萄数量</td>
		        <td width="17%">葡萄描述</td>
		        <td width="23%">葡萄图片</td>
		        <td width="15%">&nbsp;</td>
		      </tr>
		      
		      <%
		      for(int i=0;i<al.size();i++){
		      	GoodsBean gb=(GoodsBean)al.get(i);
		       %>
		      <tr align="center">
		      	
		        <td><input type="text" value="<%=gb.getGoodsId()%>" disabled>
		        	<input type="hidden"name="goodsId" id="goodsId" value="<%=gb.getGoodsId()%>"></td>
		        <td><input type="text" name="goodsType" id="goodsType" value="<%=gb.getGoodsType() %>"></td>
		        <td><input type="text" name="goodsPrice" id="goodsPrice" value="<%=gb.getGoodsPrice() %>"></td>
		        <td><input type="text" name="goodsAmount" id="goodsAmount" value="<%=gb.getGoodsAmount() %>"></td>
		        <td><input type="text" name="goodsIntro" id="goodsIntro" value="<%=gb.getGoodsIntro() %>"></td>
		        <td><input type="text" name="goodsPhoto" id="goodsPhoto" value="<%=gb.getGoodsPhoto() %>"></td>
		        <td><input type="image" name="imageField3" id="imageField3" src="img/updGoodsButt.jpg"></td>
		      </tr>
		      
		      <%
		      }
		       %>
		    </table>
		   </form>
		 </td>
	  </tr>
	  <tr>
	    <td width="23%" height="101">&nbsp;</td>
	    
	    <td width="24%">&nbsp;</td>
	  </tr>
	</table>
  </body>
</html>
