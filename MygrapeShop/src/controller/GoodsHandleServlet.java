package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.GoodsBean;
import model.GoodsBeanBO;
import model.ShopBean;
import model.UserBean;
import model.UserBeanBO;

public class GoodsHandleServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		String type=request.getParameter("type");
		
		if(type.equals("showByPage")){
			ArrayList al=new ArrayList();
			GoodsBeanBO gbo=new GoodsBeanBO();
			String s_pageNow=request.getParameter("pageNow");
			//int pageNow;
			if(s_pageNow==null){
				al=gbo.showByPage(1);
			}else{
				al=gbo.showByPage(Integer.parseInt(s_pageNow));
			}
			request.setAttribute("goodsPage", al);
			request.getRequestDispatcher("/goodsShow.jsp").forward(request, response);
		}else if(type.equals("showDetail")){
			
			String s_goodsId=(String)request.getParameter("goodsId");
			int goodsId=Integer.parseInt(s_goodsId);
			GoodsBeanBO gbo=new GoodsBeanBO();
			GoodsBean gb=gbo.getGoodsDetail(goodsId);
			
			request.setAttribute("goodsDetail", gb);
			request.getRequestDispatcher("/goodsDetail.jsp").forward(request, response);
		}else if(type.equals("add")){
			ShopBean sb=(ShopBean)request.getSession().getAttribute("shopInfo");
			long shopId=sb.getShopId();
			String goodsType=request.getParameter("goodsType");
			String goodsPrice=request.getParameter("goodsPrice");
			String goodsAmount=request.getParameter("goodsAmount");
			String goodsIntro=request.getParameter("goodsIntro");
			String goodsPhoto=request.getParameter("goodsPhoto");
			
			GoodsBeanBO gboBeanBO=new GoodsBeanBO();
			if(gboBeanBO.add(shopId, goodsType, goodsPrice, goodsAmount, goodsIntro, goodsPhoto)){
				out.print("<span>操作成功</span>");
			}else{
				out.print("<span>系统繁忙，稍后再试</span>");
			}
			
		}else if(type.equals("getGoodsByShop")){
			String operator=request.getParameter("operator");
			
			ShopBean sb=(ShopBean)request.getSession().getAttribute("shopInfo");
			long shopId=(long)sb.getShopId();
			
			GoodsBeanBO gbbBeanBO=new GoodsBeanBO();
			ArrayList al=gbbBeanBO.getGoodsByShop(shopId);
			
			request.setAttribute("goods", al);
			if(operator.equals("delete")){
				request.getRequestDispatcher("/deleteGoods.jsp").forward(request, response);
			}else if(operator.equals("update")){
				request.getRequestDispatcher("/changeGoodsInfo.jsp").forward(request, response);
			}else if(operator.equals("look")){
				request.getRequestDispatcher("/shopHomepageView.jsp").forward(request, response);
			}
			
		}else if(type.equals("delete")){
			String goodsId=request.getParameter("goodsId");
			System.out.println("delete:"+goodsId);
			GoodsBeanBO gbbBeanBO=new GoodsBeanBO();
			if(gbbBeanBO.delete(goodsId)){
				out.print("<span>成功删除商品！</span>");
			}else{
				out.print("<span>操作失败，系统繁忙，请稍后再试</span>");
			}
			
		}else if(type.equals("update")){
			String goodsId[]=request.getParameterValues("goodsId");
			String goodsPrice[]=request.getParameterValues("goodsPrice");
			String goodsAmount[]=request.getParameterValues("goodsAmount");
			String goodsType[]=request.getParameterValues("goodsType");
			String goodsIntro[]=request.getParameterValues("goodsIntro");
			String goodsPhoto[]=request.getParameterValues("goodsPhoto");
			//System.out.println("update:"+goodsId);
			
			GoodsBean gb=new GoodsBean();
			/*gb.setGoodsId(Integer.parseInt(goodsId));
			//gb.setShopId(shopId)
			gb.setGoodsType(request.getParameter("goodsType"));
			gb.setGoodsPrice(Integer.parseInt(goodsPrice));
			gb.setGoodsPrice(Integer.parseInt(goodsAmount));
			gb.setGoodsIntro(request.getParameter("goodsIntro"));
			gb.setGoodsPhoto(request.getParameter("goodsPhoto"));*/
			GoodsBeanBO gbbBeanBO=new GoodsBeanBO();
			//System.out.println("check:"+goodsId+"  "+goodsPrice+"  "+goodsAmount+"  "+goodsType+"  "+goodsIntro+"  "+goodsPhoto);
			
			boolean[] a=new boolean[goodsId.length];
			for(int i=0;i<goodsId.length;i++){
				 a[i]=gbbBeanBO.update(goodsId[i],goodsPrice[i],goodsAmount[i],goodsType[i],goodsIntro[i],goodsPhoto[i]);
			}
			int flag;
			for(flag=0;flag<a.length;flag++){
				if(!a[flag]){
					break;
				}
			}
			if(flag>=goodsId.length){
				out.print("<span>更新商品信息成功！</span>");
			}else{
				out.print("<span>更新商品信息成功！</span>");
			}
		}
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
