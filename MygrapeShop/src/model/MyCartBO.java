/**
 * 处理对购物车的一系列操作
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import com.sun.org.apache.bcel.internal.generic.NEW;
import model.*;

public class MyCartBO {
	Connection connection=null;
	PreparedStatement ps=null;
	ResultSet resultSet=null;
	
	private HashMap hm=new HashMap();
	
	//购物车中的商品呢的总价值
	private float totalPrice;
	
	public void add(String goodsId,String goodsNum){
		hm.put(goodsId, goodsNum);
	}
	public void del(String goodsId){
		hm.remove(goodsId);
	}
	//修改商品购买数量
	public void updateNum(String goodsId,String num){
		hm.put(goodsId, num);
	}
	//根据goodsId得到该物品的数量
	public String getNumById(String goodsId){
		String num=(String)hm.get(goodsId);
		//System.out.println(num);
		return num;
	}
	//得到购物车中商品的总价
	public float getTotalPrice(){
		return totalPrice;
	}
	
	public ArrayList showMyCart(){
		ArrayList al=new ArrayList();
		
		try{
			Iterator it=hm.keySet().iterator();
			if(it.hasNext()){
				
				connection=new ConnDB().getConn();
				String sql="select * from goods where goodsId in";//(1,2,3,4....)
				//得到购物车中的所有goodsId
				
				String sub="(";
				while(it.hasNext()){
					String goodsId=(String)it.next();  //取到的是key值
					if(it.hasNext()){
						sub+=goodsId+",";
					}else{
						sub+=goodsId+")";
					}
				}
				
				sql+=sub;
				ps=connection.prepareStatement(sql);
				resultSet=ps.executeQuery();
				
				
				totalPrice=0;
				while(resultSet.next()){
					GoodsBean gb=new GoodsBean();
					
					long goodsId=resultSet.getLong(1);
					gb.setGoodsId(goodsId);
					//数量
					int num=Integer.parseInt(getNumById(goodsId+""));
					
					gb.setShopId(resultSet.getLong(2));
					//单价
					float price=resultSet.getFloat(3);
					gb.setGoodsPrice(price);
					gb.setGoodsAmount(resultSet.getInt(4));
					gb.setGoodsType(resultSet.getString(5));
					gb.setGoodsIntro(resultSet.getString(6));
					gb.setGoodsPhoto(resultSet.getString(7));
					//总价
					totalPrice+=num*price;
					
					al.add(gb);
				}
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.close();
		}
		return al;
	}
	
	
	

	
	
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
