package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.GoodsBeanBO;
import model.ShopBean;
import model.ShopBeanBO;
import model.UserBean;

public class ShopHandleServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		String type=request.getParameter("type");
		
		if(type.equals("register")){
			
			String shopPwd=request.getParameter("shopPwd");
			String shopName=request.getParameter("shopName");
			
			ShopBeanBO sbb=new ShopBeanBO();
			if(sbb.register(shopName, shopPwd)){
				request.getRequestDispatcher("/homepage.jsp").forward(request, response);
			}else{
				out.print("<span>系统繁忙，请稍后再试</span>");
				request.getRequestDispatcher("/shopRegister.jsp").forward(request, response);
			}
		}else if(type.equals("login")){
			String shopPwd=request.getParameter("shopPwd");
			String shopName=request.getParameter("shopName");
			
			ShopBeanBO sbb=new ShopBeanBO();
			if(sbb.login(shopName, shopPwd)){
				//ShopBeanBO sbbBeanBO=new ShopBeanBO();
				ShopBean sb=new ShopBean();
				sb=sbb.getShopInfo(shopName);
				request.getSession().setAttribute("shopInfo", sb);
				request.getRequestDispatcher("/shopHomepage.jsp").forward(request, response);
			}else{
				out.print("<span>系统繁忙，请稍后再试</span>");
				request.getRequestDispatcher("/shopLogin.jsp").forward(request, response);
			}
			
		}else if(type.equals("checkInfo")){
			String shopName=request.getParameter("shopName");
			String shopPwd=request.getParameter("shopPwd");
			
			ShopBeanBO sbbBeanBO=new ShopBeanBO();
			out.print(sbbBeanBO.checkInfo(shopName, shopPwd));
			
				
			
		}else if(type.equals("changeShopInfo")){
			String oldShopName=request.getParameter("oldShopName");
			String shopName=request.getParameter("shopName");
			String shopPwd=request.getParameter("shopPwd");
			
			ShopBeanBO sbbBeanBO=new ShopBeanBO();
			
			boolean result=sbbBeanBO.updateShopInfo(oldShopName,shopName,shopPwd);
			if(result){
				request.getRequestDispatcher("/homepage.jsp").forward(request, response);
			}else{
				out.print("<span>系统繁忙，请稍后再试</span>");
				request.getRequestDispatcher("/changeShopInfo.jsp").forward(request, response);
			}
			
		}else if(type.equals("logout")){
			ShopBean sb=(ShopBean)request.getSession().getAttribute("shopInfo");
			long shopId=(long)sb.getShopId();
			
			ShopBeanBO sbbBeanBO=new ShopBeanBO();
			GoodsBeanBO gbbBeanBO=new GoodsBeanBO();
			if(sbbBeanBO.logout(shopId)&&gbbBeanBO.delete(shopId)){
				request.getRequestDispatcher("/homepage.jsp").forward(request, response);
			}else{
				out.print("<span>系统繁忙，请稍后再试</span>");
			}
		}else if(type.equals("exit")){
			request.getSession().removeAttribute("shopInfo");
			request.getRequestDispatcher("/homepage.jsp").forward(request, response);
			
		}
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
