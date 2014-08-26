package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MyCartBO;
import model.OrdersBeanBO;
import model.OrderInfoBean;
import model.ShopBean;
import model.UserBean;

public class OrdersHandleServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		String type=request.getParameter("type");
		
		if(type.equals("generateOrder")){
		
			//取出user信息，购物车信息
			UserBean ub=(UserBean)request.getSession().getAttribute("userInfo");
			MyCartBO cart=(MyCartBO)request.getSession().getAttribute("myCart");
			//添加订单
			long userId=(long)ub.getUserId();
			OrdersBeanBO obbBeanBO=new OrdersBeanBO();
			obbBeanBO.addOrder(userId, cart);
			
			OrderInfoBean oib=obbBeanBO.getOrderInfo();
			request.setAttribute("orderInfo", oib);
			request.getSession().removeAttribute("myCart");
			request.getRequestDispatcher("/order.jsp").forward(request, response);
		}else if(type.equals("showUserTradeHistory")){
			//得到User
			//System.out.println("start");
			UserBean ub=(UserBean)request.getSession().getAttribute("userInfo");
			long userId=(long)ub.getUserId();
			
			OrdersBeanBO obbBeanBO=new OrdersBeanBO();
			ArrayList al=(ArrayList)obbBeanBO.getOrdersByUserId(userId);
			
			request.setAttribute("orders", al);
			request.getRequestDispatcher("/userTradeHistory.jsp").forward(request, response);
		}else if(type.equals("showShopTradeHistory")){
			ShopBean sb=(ShopBean)request.getSession().getAttribute("shopInfo");
			long shopId=(long)sb.getShopId();
			
			OrdersBeanBO obbBeanBO=new OrdersBeanBO();
			ArrayList al=obbBeanBO.getOrdersByShopId(shopId);
			
			request.setAttribute("orders", al);
			request.getRequestDispatcher("/shopTradeHistory.jsp").forward(request, response);
		}
		
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
