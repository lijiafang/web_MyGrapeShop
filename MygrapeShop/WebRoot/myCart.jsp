<%@page import="model.MyCartBO"%>
<%@page import="model.GoodsBean"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

//得到购物车中的商品信息
ArrayList al=(ArrayList)request.getAttribute("showMyCart");

MyCartBO cart=(MyCartBO)session.getAttribute("myCart");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyCart.jsp' starting page</title>
    
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
		function del(goodsId){
			
			window.open("servlet/ShoppingHandleServlet?type=del&goodsId="+goodsId,"_self");
		}
		
		function showDetail(goodsId){
			window.open("servlet/GoodsHandleServlet?type=showDetail&goodsId="+goodsId,"_self");
		}
		
		function confirmOrder(){
			window.open("servlet/ConfirmOrderServlet","_self");
		}
	</script>
  </head>
  
  <body>
	 <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
	  <tr>
	    <td height="65" align="center">
	    	<jsp:include page="head.jsp"></jsp:include>
	    </td>
	  </tr>
	  
	  <tr align="center" background="img/bg.jpg">
	    <td>
		    <table width="100%" border="0" cellspacing="0" cellpadding="0">
		      <tr>
		        <td height="99" colspan="4"><img src="img/shopping1.jpg" width="101%" height="90"  alt=""/></td>
		      </tr>
		      <tr>
		        <td height="155" colspan="4">
		          <form action="servlet/ShoppingHandleServlet?type=updateNum" method="post">
			        <table width="100%" border="0" cellspacing="0" cellpadding="0">
			          <tr>
			            <td height="44" colspan="4">
				            <table width="100%" border="1" align="center" cellpadding="0" cellspacing="0">
				              <tr align="center">
				                <td width="14%" height="39">编号</td>
				                <td width="23%">葡萄品种</td>
				                <td width="21%">价格</td>
				                <td width="20%">数量</td>
				                <td width="22%" colspan="2">&nbsp;</td>
				              </tr>
				              <%
				              	for(int i=0;i<al.size();i++){
				              		GoodsBean gb=(GoodsBean)al.get(i);
				               %>
				              <tr align="center">
				                <td height="46"><%=gb.getGoodsId() %><input type="hidden" name="goodsId" value="<%=gb.getGoodsId() %>"/></td>
				                <td><%=gb.getGoodsType() %></td>
				                <td><%=gb.getGoodsPrice() %></td>
				                <td><input type="text" size=10 name="goodsNum" value="<%=cart.getNumById(gb.getGoodsId()+"")%>"/ style="font-size:20pt;width:100;height:50"></td>
				                <td><input type="button" name="button4" id="button4" value="删除" onclick="del(<%=gb.getGoodsId()%>)" style="font-size:20pt;width:100;height:50"></td>
				                <td><input type="button" name="button5" id="button5" value="查看" onclick="showDetail(<%=gb.getGoodsId()%>)" style="font-size:20pt;width:100;height:50"></td>
				              </tr>
				              <%
				               }
				               %>
				            </table>
			            </td>
			          </tr>
			          <tr>
			            <td width="3%" height="55">&nbsp;</td>
			            <td width="37%" align="right"><!-- <input type="button" name="button" id="button" value="删除全部商品" style="font-size:20pt;width:200;height:50"> --></td>
			            <td width="29%" align="right"><input type="submit" name="button2" id="button2" value="修改数量" style="font-size:20pt;width:200;height:50"></td>
			            <td width="31%">&nbsp;</td>
			          </tr>
			        </table>
			       </form>
		        </td>
		      </tr>
		      <tr>
		        <td width="51%" height="69">您共选择了价值<%=cart.getTotalPrice() %>的商品，点此处<a href="servlet/GoodsHandleServlet?type=showByPage">继续购物</a></td>
		        <td width="49%" align="right"><input type="button" name="button3" id="button3" value="下一步" onclick="confirmOrder()" style="font-size:20pt;width:100;height:50"></td>
		      </tr>
		    </table>
		  </td>
	  </tr>
	  <tr>
	    <td height="96" align="center">
	    	<jsp:include page="tail.jsp"></jsp:include>
	    </td>
	  </tr>
	</table>
  </body>
</html>
