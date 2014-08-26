<%@ page language="java" import="java.util.*,model.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

//得到购物车里的信息
ArrayList al=(ArrayList)request.getAttribute("showMyCart");
//得到用户的信息
UserBean ub=(UserBean)session.getAttribute("userInfo");
//用于获取商品数量
MyCartBO cart=(MyCartBO)session.getAttribute("myCart");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'confirmOrder.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/font.css">
	
	<script type="text/javascript">
		function returnMyCart(){
			window.open("servlet/ShoppingHandleServlet?type=showMyCart","_self");
		}
		function order(){
			window.open("servlet/OrdersHandleServlet?type=generateOrder","_self");
		}
	
	</script>
  </head>
  
  <body>
	 <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
	  <tr>
	    <td align="center">
	    	<jsp:include page="head.jsp"></jsp:include>
	    </td>
	  </tr>
	  
	  <tr background="img/bg.jpg">
	    <td align="center">
		    <table width="100%" border="0" cellspacing="0" cellpadding="0">
		      <tr>
		        <td align="center"><img src="img/shopping2.jpg" width="688" height="68"  alt=""/></td>
		      </tr>
		      
		      <tr>
		        <td height="269" align="center">
			        <table width="50%" border="1" cellspacing="0" cellpadding="0">
			          <tr>
			            <td height="39" colspan="2" align="center" bgcolor="#FFCCCC">购买人信息</td>
			          </tr>
			          <tr>
			            <td width="33%" height="30" align="right">用户名：</td>
			            <td width="67%" align="center"><%=ub.getUserName()%></td>
			          </tr>
			          <tr>
			            <td height="31" align="right">真实姓名：</td>
			            <td align="center"><%=ub.getUserTrueName()%></td>
			          </tr>
			          <tr>
			            <td height="27" align="right">住 址：</td>
			            <td align="center"><%=ub.getUserAddress()%></td>
			          </tr>
			          <tr>
			            <td height="30" align="right">电 话：</td>
			            <td align="center"><%=ub.getUserPhone()%></td>
			          </tr>
			          <tr>
			            <td height="30" align="right">邮箱：</td>
			            <td align="center"><%=ub.getUserEmail()%></td>
			          </tr>
			          <tr>
			            <td height="33" colspan="2" align="center"><a href="userHomepage.jsp"><input type="button" name="button3" id="button3" value="修改个人信息"
			            	style="font-size:16pt;width:150;height:50"></a></td>
			          </tr>
			        </table>
			     </td>
		      </tr>
		      
		      <tr>
		        <td height="173" align="center"><table width="50%" border="1" cellspacing="0" cellpadding="0">
		          <tr>
		            <td height="38" colspan="4" align="center" bgcolor="#FFFFCC">我的购物车情况</td>
		          </tr>
		          <tr align="center">
		            <td height="32">编号</td>
		            <td>商品名称</td>
		            <td>单价</td>
		            <td>数量</td>
		          </tr>
		          
		          <%
		          	for(int i=0;i<al.size();i++){
		          		GoodsBean gb=(GoodsBean)al.get(i);
		           %>
		          
			          <tr align="center">
			            <td height="36"><%=gb.getGoodsId() %></td>
			            <td><%=gb.getGoodsType() %></td>
			            <td><%=gb.getGoodsPrice() %></td>
			            <td><%=cart.getNumById(gb.getGoodsId()+"") %></td>
			          </tr>
		          <%
		          	}
		           %>
		          <tr>
		            <td height="52" colspan="4">您共选择了价值为<%=cart.getTotalPrice() %>的商品</td>
		          </tr>
		          <tr>
		            <td height="38" colspan="4" align="center"><input type="button" name="button4" id="button4" value="返回修改我的购物车" onclick="returnMyCart()"
		            	style="font-size:16pt;width:200;height:50"></td>
		          </tr>
		        </table>
		       </td>
		      </tr>
		      
		      <tr>
		        <!-- <td align="right"><input type="button" name="button5" id="button5" value="上一步" style="font-size:20pt;width:100;height:50"> -->
		          <td align="right"><input type="button" name="button" id="button" value="下一步" onclick="order()" style="font-size:20pt;width:100;height:50"></td>
		      </tr>
		    </table>
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
