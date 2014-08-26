<%@ page language="java" import="java.util.*,model.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

GoodsBean gb=(GoodsBean)request.getAttribute("goodsDetail");
ShopBeanBO sbo=new ShopBeanBO();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'goodsDetail.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/font.css">
	
	
	<script type="text/javascript">
		function returnHall(){
			window.open("servlet/GoodsHandleServlet?type=showByPage","_self");
		}
		function addToCart(goodsId){
			window.open("servlet/ShoppingHandleServlet?type=add&goodsId="+goodsId,"_self");
			
		}
	
	</script>
  </head>
  
  <body>
	 <table width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
		    <td align="center">
		    	<jsp:include page="head.jsp"></jsp:include>
		    </td>
		  </tr>
		  
		  <tr background="img/bg.jpg">
		    <td align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0">
		      <tr>
		        <td height="19" colspan="3">&nbsp;</td>
		      </tr>
		      <tr>
		        <td width="32%" colspan="2" rowspan="8">  <img src="img/<%=gb.getGoodsPhoto() %>" width="354" height="329"  alt=""/></td>
		        <td width="68%" height="44" align="center">品种:<%=gb.getGoodsType() %></td>
		      </tr>
		      <tr>
		        <td height="53">商品编号：<%=gb.getGoodsId() %></td>
		      </tr>
		      <tr>
		        <td height="49">&nbsp;</td>
		      </tr>
		      <tr>
		        <td height="40">店铺名称：<%=sbo.getShopName(gb.getShopId()) %></td>
		      </tr>
		      <tr>
		        <td height="50">&nbsp;</td>
		      </tr>
		      <tr>
		        <td height="52">价格：<%=gb.getGoodsPrice() %></td>
		      </tr>
		      <tr>
		        <td height="45">&nbsp;</td>
		      </tr>
		      <tr>
		        <td height="99" align="left" valign="top">关于葡萄：<%=gb.getGoodsIntro() %></td>
		      </tr>
		      <tr>
		        <td height="72" align="center"><input type="button" name="button" id="button" value="购买" onclick="addToCart(<%=gb.getGoodsId()%>)"  style="font-size:20pt;width:100;height:50"></td>
		        <td align="left"><input type="button" name="button2" id="button2" value="返回购物大厅" onclick="returnHall()" style="font-size:20pt;width:200;height:50"></td>
		        <td>&nbsp;</td>
		      </tr>
		      <tr>
		        <td colspan="3">&nbsp;</td>
		      </tr>
		    </table></td>
		  </tr>
		  
		  <tr>
		    <td align="center">
		    	<jsp:include page="tail.jsp"></jsp:include>
		    </td>
		  </tr>
	</table>
  </body>
</html>
