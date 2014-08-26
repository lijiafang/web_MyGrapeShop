package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.java.swing.plaf.windows.resources.windows;

import model.*;


public class UserHandleServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		//
		String type=request.getParameter("type");
		
		if(type.equals("login")){
			String userName=request.getParameter("userName");
			String userPwd=request.getParameter("userPwd");
			
			UserBeanBO ubo=new UserBeanBO();
			if(ubo.login(userName, userPwd)){
				UserBean ub=ubo.getUserInfo(userName);
				request.getSession().setAttribute("userInfo", ub);
				request.getRequestDispatcher("GoodsHandleServlet?type=showByPage").forward(request, response);
			}else{
				request.getRequestDispatcher("/homepage.jsp").forward(request, response);
			}
		}else if(type.equals("register")){
			String userName=request.getParameter("userName");
			String userPwd=request.getParameter("userPwd");
			String userTrueName=request.getParameter("userTrueName");
			String userAddress=request.getParameter("userAddress");
			String userPhone=request.getParameter("userPhone");
			String userEmail=request.getParameter("userEmail");
			//String account_id=request.getParameter("account_id");
			
			UserBeanBO ubbBeanBO=new UserBeanBO();
			//(userName,userPwd,userTrueName,userPhone,userAddress,userEmail)
			if(ubbBeanBO.register(userName,userPwd,userTrueName,userPhone,userAddress,userEmail)){
				request.getRequestDispatcher("/homepage.jsp").forward(request, response);
			}else{
				request.setAttribute("flag", "failed");
				request.getRequestDispatcher("/userRegister.jsp").forward(request, response);
			}
		}else if(type.equals("checkUserName")){
			//System.out.println("come in");
			String userName=request.getParameter("userName");
			//System.out.println("chheckUserName:"+userName);
			UserBeanBO ubbBeanBO=new UserBeanBO();
			boolean result=ubbBeanBO.checkUserName(userName);
			
			//System.out.println("result="+result);
			if(result){
				out.print(1);
			}else{
			out.print(0);
			}
		}else if(type.equals("checkInfo")){
			//System.out.println("checkInfo");
			
			String userName=request.getParameter("userName");
			String userPwd=request.getParameter("userPwd");
			
			UserBeanBO ubbBeanBO=new UserBeanBO();
			boolean result=ubbBeanBO.checkInfo(userName, userPwd);
			if(result){
				out.print(1);
			}else{
				out.print(0);
			}
		}else if(type.equals("changeUserInfo")){
			String userName=request.getParameter("userName");
			//System.out.println("change:"+userName);
			String userPwd=request.getParameter("userPwd");
			String userTrueName=request.getParameter("userTrueName");
			String userAddress=request.getParameter("userAddress");
			String userPhone=request.getParameter("userPhone");
			String userEmail=request.getParameter("userEmail");
			//String account_id=request.getParameter("account_id");
			UserBean ub=(UserBean)request.getSession().getAttribute("userInfo");
			long userId=(long)ub.getUserId();
			
			UserBeanBO ubbBeanBO=new UserBeanBO();
			
			if(ubbBeanBO.update(userId,userName,userPwd,userTrueName,userPhone,userAddress,userEmail)){
				request.getRequestDispatcher("/homepage.jsp").forward(request, response);
				/*String url="<script>window.parent.location.href('";  
	            url+=request.getContextPath();  
	            url+="/homepage.jsp')</script>";  
	            //DebugPrintf.Printf(url);  
	            out.println(url); */
			}else{
				out.print("<span>系统繁忙，请稍后再试</span>");
			}
		}else if(type.equals("logout")){
			UserBean ub=(UserBean)request.getSession().getAttribute("userInfo");
			long userId=(long)ub.getUserId();
			
			UserBeanBO ubbBeanBO=new UserBeanBO();
			if(ubbBeanBO.logout(userId)){
				//response.sendRedirect("/homepage.jsp");
				request.getSession().removeAttribute("userInfo");
				request.getSession().removeAttribute("myCart");
				
				request.getRequestDispatcher("/homepage.jsp").forward(request, response);
			}else{
				//request.getRequestDispatcher("UserHandleServlet?type=logout").forward(request, response);
				out.print("<span>系统繁忙，请稍后再试</span>");
				//System.out.println("do nothing");
				
			}
		}else if(type.equals("showUserInfo")){
			UserBean ub=(UserBean)request.getSession().getAttribute("userInfo");
			String userName=(String)ub.getUserName();
			
			UserBeanBO ubbBeanBO=new UserBeanBO();
			UserBean ubBean=ubbBeanBO.getUserInfo(userName);
			
			request.setAttribute("user", ubBean);
			request.getRequestDispatcher("/userLogout.jsp").forward(request, response);
		}else if(type.equals("exit")){
			request.getSession().removeAttribute("userInfo");
			request.getSession().removeAttribute("myCart");
			request.getRequestDispatcher("/homepage.jsp").forward(request, response);
		}
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
