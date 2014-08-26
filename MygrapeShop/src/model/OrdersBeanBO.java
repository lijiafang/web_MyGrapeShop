package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;

public class OrdersBeanBO {
	Connection connection=null;
	PreparedStatement ps=null;
	ResultSet resultSet=null;
	
	private long orderId=0;
	//增加订单
	public void addOrder(long userId,MyCartBO cart){
		try{
			OrdersBean ob=new OrdersBean();
			connection=new ConnDB().getConn();
			//String sql="insert into orders (orderId,userId,totalPrice,isPayed) values (?,?,?,?)";
			String sql="insert into orders (orderId,userId,totalPrice,isPayed) values (null,"+userId+","+cart.getTotalPrice()+",'')";
			ps=connection.prepareStatement(sql);
			/*ps.setLong(1,null);
			ps.setLong(2, userId);
			ps.setFloat(3, cart.getTotalPrice());
			ps.setString(4, "noPay");*/
			int a=ps.executeUpdate();
			
			if(a==1){
				//订单生成，需要插入详细订单
				ps=connection.prepareStatement("select max(orderId) from orders");
				
				resultSet=ps.executeQuery();
				if(resultSet.next()){
					//得到订单号
					orderId=resultSet.getLong(1);
				}
				
				Statement sm=connection.createStatement();
				ArrayList al=cart.showMyCart();
				for(int i=0;i<al.size();i++){
					GoodsBean gb=(GoodsBean)al.get(i);
					
					sm.addBatch("insert into orderDetail values("+gb.getGoodsId()+","+orderId+","+cart.getNumById(gb.getGoodsId()+"")+")");
			
				}
				sm.executeBatch();
			}
			
			
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.close();
		}
		
	}
	
	//显示订单信息
	public OrderInfoBean getOrderInfo(){
		OrderInfoBean oib=new OrderInfoBean();
		try{
			connection=new ConnDB().getConn();
			String sql="select orderId,userTrueName,userAddress,userPhone,totalPrice,userName,userEmail from user,orders"+
					" where orderId="+orderId+" and user.userId=(select orders.userId from orders where orderId="+orderId+")";
			ps=connection.prepareStatement(sql);
			resultSet=ps.executeQuery();
			if(resultSet.next()){
				oib.setOrderId(resultSet.getLong(1));
				oib.setUserTruename(resultSet.getString(2));
				oib.setUserAddress(resultSet.getString(3));
				oib.setUserPhone(resultSet.getString(4));
				oib.setTotalPrice(resultSet.getFloat(5));
				oib.setUserName(resultSet.getString(6));
				oib.setUserEmail(resultSet.getString(7));
			}else{
				System.out.println("getOrderInfo error");
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.close();
		}
		return oib;
	}
	
	//根据userId查询订单信息
	public ArrayList getOrdersByUserId(long userId){
		ArrayList al=new ArrayList();
		try{
			connection=new ConnDB().getConn();
			//String sql="select * from orders where userId="+userId;
			String sql="select  distinct orders.orderId,orders.userId,goods.goodsId,goods.shopId,totalPrice from user,goods,orders,orderdetail where user.userId="+userId+" and  user.userId=orders.userId and  orderdetail.orderId=orders.orderId and orderdetail.goodsId=goods.goodsId";
			ps=connection.prepareStatement(sql);
			resultSet=ps.executeQuery();
			while(resultSet.next()){
				//System.out.println("get order");
				HistoryRecordBean hrb=new HistoryRecordBean();
				hrb.setOrderId(resultSet.getLong(1));
				hrb.setUserId(resultSet.getLong(2));
				hrb.setGoodsId(resultSet.getLong(3));
				hrb.setShopId(resultSet.getLong(4));
				hrb.setTotalPrice(resultSet.getFloat(5));
				
				al.add(hrb);
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.close();
		}
		return al;
	}
	
	//根据shopId查询订单信息
		public ArrayList getOrdersByShopId(long shopId){
			ArrayList al=new ArrayList();
			try{
				connection=new ConnDB().getConn();
				//String sql="select * from orders where userId="+userId;
				//String sql="select  distinct orders.orderId,orders.userId,goods.shopId,goods.goodsId,totalPrice from user,goods,orders,orderdetail where goods.shopId="+shopId+" and  user.userId=orders.userId and  orderdetail.orderId=orders.orderId ";
				String sql="select  distinct orders.orderId,orders.userId,goods.goodsId,goods.shopId,totalPrice from goods,orders,orderdetail where goods.shopId="+shopId+" and goods.goodsId=orderdetail.goodsId  and  orderdetail.orderId=orders.orderId";
				ps=connection.prepareStatement(sql);
				resultSet=ps.executeQuery();
				while(resultSet.next()){
					HistoryRecordBean hrb=new HistoryRecordBean();
					hrb.setOrderId(resultSet.getLong(1));
					hrb.setUserId(resultSet.getLong(2));
					hrb.setGoodsId(resultSet.getLong(3));
					hrb.setShopId(resultSet.getLong(4));
					hrb.setTotalPrice(resultSet.getFloat(5));
					
					al.add(hrb);
				}
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}finally{
				this.close();
			}
			return al;
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
