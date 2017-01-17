package com.pxy.dao;

import java.util.List;

import com.pxy.model.Order;
import com.pxy.model.User;

public interface OrderDao {

	Order findByOid(Integer oid);

	void update(Order currOrder);

	List<Order> findByUid(User existUser);

	Integer save(Order order);

	List<Order> findAllOrder();

}
