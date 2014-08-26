package model;

public class OrdersBean {
	private long orderId;
	private long userId;
	private String isPayed;
	private float totalPrice;
	public long getOrderId() {
		return orderId;
	}
	public void setOrderId(long orderId) {
		this.orderId = orderId;
	}
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	public String getIsPayed() {
		return isPayed;
	}
	public void setIsPayed(String isPayed) {
		this.isPayed = isPayed;
	}
	public float getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(float totalPrice) {
		this.totalPrice = totalPrice;
	}
}
