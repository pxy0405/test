package com.pxy.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.pxy.dao.OrderDao;
import com.pxy.model.Order;
import com.pxy.model.User;

public class OrderDaoImpl implements OrderDao{

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public Order findByOid(Integer oid) {
		Session session = sessionFactory.getCurrentSession();  
		Order order= (Order)session.get(User.class, oid);
        return order;
	}

	@Override
	public void update(Order currOrder) {
		Session session = sessionFactory.getCurrentSession();
	    session.update(currOrder); 
	}

	@Override
	public List<Order> findByUid(User existUser) {
		Session session = sessionFactory.getCurrentSession();
		String hql="from Order o where o.user.uid=? order by ordertime desc";
		Query query =session.createQuery(hql);
		query.setParameter(0, existUser.getID());
		List<Order> userList = query.list();
		if(userList!=null&&userList.size()>0){
			return userList;
		}else{
			return null;
		}
	}

	@Override
	public Integer save(Order order) {
		//持久层保存订单方法
		Session session = sessionFactory.getCurrentSession();
		Integer oid = (Integer)session.save(order);
		return oid;  
	}

	@Override
	public List<Order> findAllOrder() {
		//后台查询所有的订单
		Session session = sessionFactory.getCurrentSession();
		String hql="from Order order by ordertime desc";
		Query query =session.createQuery(hql);
		List<Order> orderList = query.list();
		if(orderList!=null&&orderList.size()>0){
			return orderList;
		}else{
			return null;
		}
	}
	
}
