package com.pxy.service.impl;

import java.util.List;

import com.pxy.dao.OrderDao;
import com.pxy.model.Order;
import com.pxy.model.User;
import com.pxy.service.OrderService;


public class OrderServiceImpl implements OrderService{
	// 注入DAO
		private OrderDao orderDao;
		
		public void setOrderDao(OrderDao orderDao) {
			this.orderDao = orderDao;
		}



		// 业务层保存订单
		public Integer save(Order order) {
			return orderDao.save(order);
		}



		public Order findByOid(Integer oid) {
			return orderDao.findByOid(oid);
		}



		public void update(Order currOrder) {
			orderDao.update(currOrder);
		}



		public List<Order> findByUid(User existUser) {
			return orderDao.findByUid(existUser);
		}



		@Override
		public List<Order> findAllOrder() {
			return orderDao.findAllOrder();
		}
}
