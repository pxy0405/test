package com.pxy.service;

import java.util.List;

import com.pxy.model.Order;
import com.pxy.model.User;

public interface OrderService {
	// 业务层保存订单
	Integer save(Order order);

	Order findByOid(Integer oid);

	void update(Order currOrder);

	List<Order> findByUid(User existUser);
	
	List<Order> findAllOrder();

}
