package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class GoodsBeanBO {
	private Connection connection=null;
	private PreparedStatement ps=null;
	private ResultSet resultSet=null;
	
	//int pageNow;
	int pageSize=8;
	
	
	//得到总页数
	public int getPageCount(){
		int pageCount=0;
		int recordRows=0;
		try{
			connection=new ConnDB().getConn();
			String sql="select count(*) from goods";
			ps=connection.prepareStatement(sql);
			resultSet=ps.executeQuery();
			if(resultSet.next()){
				recordRows=resultSet.getInt(1);
				if(recordRows%pageSize==0){
					pageCount=recordRows/pageSize;
				}else{
					pageCount=recordRows/pageSize+1;
				}
			}else{
				System.out.println("get pageCount error");
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.close();
		}
		return pageCount;
	}
	
	//分页显示商品
	public ArrayList showByPage(int pageNow){
		ArrayList al=new ArrayList();
		try{
			
			connection=new ConnDB().getConn();
			String sql="select * from goods limit "+(pageNow-1)*pageSize+","+pageSize; 
			ps=connection.prepareStatement(sql);
			resultSet=ps.executeQuery();
			while(resultSet.next()){
				GoodsBean gb=new GoodsBean();
				gb.setGoodsId(resultSet.getLong(1));
				gb.setShopId(resultSet.getLong(2));
				gb.setGoodsPrice(resultSet.getFloat(3));
				gb.setGoodsAmount(resultSet.getInt(4));
				gb.setGoodsType(resultSet.getString(5));
				gb.setGoodsIntro(resultSet.getString(6));
				gb.setGoodsPhoto(resultSet.getString(7));
				al.add(gb);
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.close();
		}
		return al;
	}
	
	//显示商品详情
	public GoodsBean getGoodsDetail(long goodsId){
		GoodsBean gb=new GoodsBean();
		try{
			connection=new ConnDB().getConn();
			String sql="select * from goods where goodsId="+goodsId;
			ps=connection.prepareStatement(sql);
			resultSet=ps.executeQuery();
			
			if(resultSet.next()){
				gb.setGoodsId(resultSet.getLong(1));
				gb.setShopId(resultSet.getLong(2));
				gb.setGoodsPrice(resultSet.getFloat(3));
				gb.setGoodsAmount(resultSet.getInt(4));
				gb.setGoodsType(resultSet.getString(5));
				gb.setGoodsIntro(resultSet.getString(6));
				gb.setGoodsPhoto(resultSet.getString(7));
			}else{
				System.out.println("getGoodsDetail error");
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.close();
		}
		return gb;
	}
	
	public boolean add(long shopId,String goodsType,String goodsPrice,String goodsAmount,String goodsIntro,String goodsPhoto){
		boolean b=false;
		try{
			connection=new ConnDB().getConn();
			String sql="insert into goods values(null,"+shopId+","+goodsPrice+",'"+goodsAmount+"','"+goodsType+"','"+goodsIntro+"','"+goodsPhoto+"')";
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
	
	public ArrayList getGoodsByShop(long shopId){
		ArrayList al=new ArrayList();
		try{
			connection=new ConnDB().getConn();
			String sql="select * from goods where shopId="+shopId;
			ps=connection.prepareStatement(sql);
			resultSet=ps.executeQuery();
			
			while(resultSet.next()){
				GoodsBean gb=new GoodsBean();
				gb.setGoodsId(resultSet.getLong(1));
				gb.setShopId(resultSet.getLong(2));
				gb.setGoodsPrice(resultSet.getFloat(3));
				gb.setGoodsAmount(resultSet.getInt(4));
				gb.setGoodsType(resultSet.getString(5));
				gb.setGoodsIntro(resultSet.getString(6));
				gb.setGoodsPhoto(resultSet.getString(7));
				al.add(gb);
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.close();
		}
		return al;
	}
	
	//
	public boolean delete(String goodsId){
		boolean b=false;
		try{
			connection=new ConnDB().getConn();
			
			String sql="delete from goods where goodsId="+goodsId;
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
	
	public boolean update(String goodsId,String goodsPrice,String goodsAmount,String goodsType,String goodsIntro,String goodsPhoto){
		boolean b=false;
		try{
			//System.out.println("check222:"+goodsId+"  "+goodsPrice+"  "+goodsAmount+"  "+goodsType+"  "+goodsIntro+"  "+goodsPhoto);
			connection=new ConnDB().getConn();
			//String sql="update goods set goodsType='"+gb.getGoodsType()+"',goodsPrice="+gb.getGoodsPrice()+",goodsAmount="+gb.getGoodsAmount()+",goodsIntro='"+gb.getGoodsIntro()+"',goodsPhoto='"+gb.getGoodsPhoto()+"' where goodsId="+gb.getGoodsId();
			//String sql="update goods set goodsType='"+goodsType+"',goodsPrice="+goodsPrice+",goodsAmount="+goodsAmount+",goodsIntro='"+goodsIntro+"',goodsPhoto='"+goodsPhoto+"' where goodsId=12";
			
			//更新操作，真的是无语ing……
			String sql="update goods set goodsType=?,goodsPrice=?,goodsAmount=?,goodsIntro=?,goodsPhoto=? where goodsId=?";
			ps=connection.prepareStatement(sql);
			ps.setString(1,goodsType);
			ps.setString(2,goodsPrice);
			ps.setString(3,goodsAmount);
			ps.setString(4,goodsIntro);
			ps.setString(5,goodsPhoto);
			int id=Integer.parseInt(goodsId);
			ps.setInt(6,id);
			//ps.setString(6,goodsId);
			
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
	public boolean delete(long shopId){
		boolean b=false;
		try{
			connection=new ConnDB().getConn();
			String sql="delete from goods where shopId="+shopId;
			ps=connection.prepareStatement(sql);
			int a=ps.executeUpdate();
			
			if(a>0){
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
