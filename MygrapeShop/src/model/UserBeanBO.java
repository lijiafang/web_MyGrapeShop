package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserBeanBO {
	private Connection connection=null;
	private PreparedStatement ps=null;
	private ResultSet resultSet=null;
	
	public boolean login(String userName,String userPwd){
		boolean b=false;
		try{
			connection=new ConnDB().getConn();
			String sql="select userPwd from user where userName='"+userName+"'";
			ps=connection.prepareStatement(sql);
			resultSet=ps.executeQuery();
			if(resultSet.next()){
				String dbPwd=resultSet.getString(1);
				//System.out.println("get login DBpwd:"+dbPwd);
				if(dbPwd.equals(userPwd)){
					b=true;
				}
			}else{
				System.out.println("login error");
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.close();
		}
		return b;
	}
	
	//注销账号
	public boolean logout(long userId){
		boolean b=false;
		try{
			connection=new ConnDB().getConn();
			String sql="delete from user where userId="+userId;
			ps=connection.prepareStatement(sql);
			int a=ps.executeUpdate();
			
			if(a==1){
				b=true;
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.close();
		}
		
		return b;
	}
	
	public boolean register(String userName,String userPwd,String userTrueName,String userPhone,String userAddress,String userEmail){
		boolean b=false;
		try{
			connection=new ConnDB().getConn();
			String sql="insert into user values(null,'"+userName+"','"+userPwd+"','"+userTrueName+"','"+userPhone+"','"+userAddress+"','"+userEmail+"')";
			ps=connection.prepareStatement(sql);
			int a=ps.executeUpdate();
			if(a==1){
				b=true;
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
		}finally{
			this.close();
		}
		return b;
	}
	
	//注册时用到的检测函数
	//检验用户名的可用性
	public boolean checkUserName(String userName){
		boolean b=false;
		try{
			connection=new ConnDB().getConn();
			String sql="select userId from user where userName='"+userName+"'";
			ps=connection.prepareStatement(sql);
			resultSet=ps.executeQuery();
			if(resultSet.next()){
				
				return b;
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.close();
			
		}
		b=true;
		return b;
	}
	
	//修改时用到的检测原信息是否正确
	public boolean checkInfo(String userName,String userPwd){
		return login(userName, userPwd);
	}
	
	//根据userName得到user的信息
	public UserBean getUserInfo(String userName){
		UserBean ub=new UserBean();
		try{
			connection=new ConnDB().getConn();
			String sql="select * from user where userName='"+userName+"'";
			ps=connection.prepareStatement(sql);
			resultSet=ps.executeQuery();
			
			if(resultSet.next()){
				ub.setUserId(resultSet.getLong(1));
				ub.setUserName(resultSet.getString(2));
				ub.setUserPwd(resultSet.getString(3));
				ub.setUserTrueName(resultSet.getString(4));
				ub.setUserPhone(resultSet.getString(5));
				ub.setUserAddress(resultSet.getString(6));
				ub.setUserEmail(resultSet.getString(7));
				
			}else{
				System.out.println("getUserInfo error");
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.close();
		}
		return ub;
	}
	
	public boolean update(long userId,String userName,String userPwd,String userTrueName,String userPhone,String userAddress,String userEmail){
		boolean b=false;
		try{
			connection=new ConnDB().getConn();
			//String sql="update user set userName='"+userName+"',userPwd='"+userPwd+"',userTrueName='"+userTrueName+"',userPhone='"+userPhone+"',userEmail='"+userEmail+"',userAddress='"+userAddress+"' where userId="+userId;
			String sql="update user set userName=?,userPwd=?,userTrueName=?,userPhone=?,userEmail=?,userAddress=? where userId=?";
			ps=connection.prepareStatement(sql);
			ps.setString(1,userName);
			ps.setString(2,userPwd);
			ps.setString(3,userTrueName);
			ps.setString(4,userPhone);
			ps.setString(5,userEmail);
			ps.setString(6,userAddress);
			ps.setLong(7,userId);
			
			int a=ps.executeUpdate();
			
			if(a==1){
				b=true;
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.close();
		}
		return b;
	}
	
	//关闭资源
		public void close(){
			
			try{
				if(resultSet!=null){
					resultSet.close();
					resultSet=null;
				}
				if(ps!=null){
					ps.close();
					ps=null;
				}
				if(connection!=null){
					connection.close();
					connection=null;
				}
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
		}
}
