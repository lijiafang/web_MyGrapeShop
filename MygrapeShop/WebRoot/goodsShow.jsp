<%@page import="model.GoodsBeanBO"%>
<%@page import="model.ShopBeanBO"%>
<%@page import="model.GoodsBean"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

//
ArrayList al=(ArrayList)request.getAttribute("goodsPage");
ShopBeanBO sbo=new ShopBeanBO();
GoodsBeanBO gbo=new GoodsBeanBO();
int pageCount=gbo.getPageCount();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'goodsShow.jsp' starting page</title>
    
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
		        <td height="73">
			        <table width="100%" border="0" cellspacing="0" cellpadding="0">
			          <tr>
			            <td width="67%" height="65" align="right"><!-- <input name="textfield" type="text" id="textfield" size="70"> --></td>
			            <td width="28%" align="center"><!-- <input type="button" name="button" id="button" value="搜索" style="font-size:20pt;width:100;height:50"> --></td>
			            <td width="5%">&nbsp;</td>
			          </tr>
			        </table>
			     </td>
		      </tr>
		      <tr>
		        <td>
		        <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
		        
		        
		        <%
		        //分两行显示
		        int k=0;
		        for(int i=0;i<2;i++){
		        	
		         %>
		          <tr>
		          
		          <%
		          	for(int j=0;j<4;j++){
		          		if(k<al.size()){
		          			GoodsBean gb=(GoodsBean)al.get(k);
		          			k++;
		           %>
				           <td width="24%" height="174">
					            <table width="100%" height="164" border="0" cellpadding="0" cellspacing="0">
					              <tr>
					                <td width="19%" rowspan="4"> <a href="servlet/GoodsHandleServlet?type=showDetail&goodsId=<%=gb.getGoodsId()%>"><img src="img/<%=gb.getGoodsPhoto() %>" width="113" height="160"  alt=""/></a></td>
					                <td width="81%" height="33"><%=gb.getGoodsType() %></td>
					              </tr>
					              <tr>
					                <td height="32"><%=gb.getGoodsPrice() %></td>
					              </tr>
					              <tr>
					                <td height="38"><!-- 店铺名称:<%=sbo.getShopName(gb.getShopId()) %> --></td>
					              </tr>
					              <tr>
					                <td><%=gb.getGoodsIntro() %></td>
					              </tr>
					            </table>
				            </td>
				           
			            <%
			            } else{
			            
			             %>
				            <td width="25%">
					            <table width="99%" border="0" cellspacing="0" cellpadding="0">
					              <tr>
					                <td width="19%" rowspan="4"><img src="img/p13.jpg" width="114" height="157"  alt=""/></td>
					                <td width="81%" height="33"></td>
					              </tr>
					              <tr>
					                <td height="32"></td>
					              </tr>
					              <tr>
					                <td height="38"></td>
					              </tr>
					              <tr>
					                <td>等待上架中……</td>
					              </tr>
					            </table >
				           </td>
		            <%
		            	}
		            }
		            %>
		            </tr>
		            <% 
		            if(i==0){
		            
			             %>
			             <tr>
	    					<td colspan="4" bgcolor="#D3CCD7" width="100%">&nbsp;</td>
	  					</tr>
			              
						 <%
					 }
				
		      }
		       %>
		   		<tr>
	    			<td colspan="4" bgcolor="#D3CCD7" width="100%">&nbsp;</td>
	  			</tr>
		 	 </table>
		 	 </td>
		  </tr>
		 
			 </table>
		 </td> 
	   </tr>
	 
	 
	  <tr>
	    <td align="center">
	    	
		    <%
		    for(int i=1;i<=pageCount;i++){
		    %>
		    	<a href="servlet/GoodsHandleServlet?type=showByPage&pageNow=<%=i%>">【<%=i %>】</a>
		    <%
		    }
		    %>
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
