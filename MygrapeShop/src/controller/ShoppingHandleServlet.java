package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MyCartBO;
import java.util.*;

public class ShoppingHandleServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		//操作类型
		String type=request.getParameter("type");
		
		//从session中取出购物车
		MyCartBO cart=(MyCartBO)request.getSession().getAttribute("myCart");
		if(cart==null){
			cart=new MyCartBO();
			request.getSession().setAttribute("myCart", cart);
		}
		
		
		if(type.equals("add")){
			String goodsId=request.getParameter("goodsId");
			
			cart.add(goodsId, "1");
		
		}else if(type.equals("del")){
			
			String goodsId=request.getParameter("goodsId");
			
			cart.del(goodsId);
			
		}else if(type.equals("updateNum")){
			
			String goodsId[]=request.getParameterValues("goodsId");
			String goodsNum[]=request.getParameterValues("goodsNum");
			
			for(int i=0;i<goodsId.length;i++){
				//System.out.println("id=="+goodsId[i]+"  number:"+goodsNum[i]);
				cart.updateNum(goodsId[i], goodsNum[i]);
			}
			
			//cart.updateNum(goodsId, goodsNum);
		}else if(type.equals("showMyCart")){
			//do nothing
		}
		
		ArrayList al=(ArrayList)cart.showMyCart();
		request.setAttribute("showMyCart", al);
		request.getRequestDispatcher("/myCart.jsp").forward(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
