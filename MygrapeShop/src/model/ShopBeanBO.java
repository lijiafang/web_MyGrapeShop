package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.sun.org.apache.xpath.internal.functions.Function;

public class ShopBeanBO {
	private Connection connection=null;
	private PreparedStatement ps=null;
	private ResultSet resultSet=null;
	
	//
	public String getShopName(long shopId){
		String shopName=null;
		try{
			connection=new ConnDB().getConn();
			String sql="select shopName from shop where shopId="+shopId;
			ps=connection.prepareStatement(sql);
			resultSet=ps.executeQuery();
			if(resultSet.next()){
				shopName=resultSet.getString(1);
				
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.close();
		}
		return shopName;
	}
	
	public boolean register(String shopName,String shopPwd){
		boolean b=false;
		try{
			connection=new ConnDB().getConn();
			String sql="insert into shop values(null,'"+shopName+"','"+shopPwd+"')";
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
	
	//
	public boolean login(String shopName,String shopPwd){
		boolean b=false;
		
		try{
			connection=new ConnDB().getConn();
			String sql="select shopPwd from shop where shopName='"+shopName+"'";
			ps=connection.prepareStatement(sql);
			resultSet=ps.executeQuery();
			
			if(resultSet.next()){
				
				if(resultSet.getString(1).equals(shopPwd)){
					b=true;
					
				}
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.close();
		}
		return b;
	}
	
	public boolean checkInfo(String shopName,String shopPwd){
		return login(shopName, shopPwd);
	}
	
	public boolean updateShopInfo(String oldShopName,String shopName,String shopPwd){
		boolean b=false;
		try{
			connection=new ConnDB().getConn();
			String sql="update shop set shopName='"+shopName+"',shopPwd='"+shopPwd+"' where shopName='"+oldShopName+"'";
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
	
	public ShopBean getShopInfo(String shopName){
		ShopBean sb=new ShopBean();
		try{
			connection=new ConnDB().getConn();
			String sql="select * from shop where shopName='"+shopName+"'";
			ps=connection.prepareStatement(sql);
			resultSet=ps.executeQuery();
			
			if(resultSet.next()){
				sb.setShopId(resultSet.getLong(1));
				sb.setShopName(resultSet.getString(2));
				sb.setShopPwd(resultSet.getString(3));
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.close();
		}
		return sb;
		
	}
	
	public boolean logout(long shopId){
		boolean b=false;
		try{
			connection=new ConnDB().getConn();
			String sql="delete from shop where shopId="+shopId;
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
