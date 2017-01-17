package com.pxy.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.pxy.dao.UserDao;
import com.pxy.model.User;

public class UserDaoImpl implements UserDao{
	public UserDaoImpl(){}
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public User login(User user){
		Session session = sessionFactory.getCurrentSession();
		String hql="from User u where u.userName=:name and u.passWord=:pass";
		Query query =session.createQuery(hql);
		query.setString("name",user.getUserName());
		query.setString("pass", user.getPassWord());
		List<User> userList = query.list();
		if(userList!=null&&userList.size()>0){
			return userList.get(0);
		}else{
			return null;
		}
	}

	
	public void register(User user){
		Session session = sessionFactory.getCurrentSession();
	        session.save(user);  
	  
	  
	}

	public List<User> list() {
		Session session = sessionFactory.getCurrentSession();
		String hql="from User";
		Query query =session.createQuery(hql);
		List<User> userList = query.list();
		if(userList!=null&&userList.size()>0){
			return userList;
		}else{
			return null;
		}
	}
	public User findByID(int ID){
		Session session = sessionFactory.getCurrentSession();  
		User user= (User)session.get(User.class, ID);
        return user;
		
	}
	public void edit(User user){
		Session session = sessionFactory.getCurrentSession();
	        session.update(user);  
	}
	
	public void delete(int ID){
		//直接删除  
		Session session = sessionFactory.getCurrentSession();
        User user =(User)session.get(User.class, ID);
        session.delete(user);  

	}

	@Override
	public User findByUserName(String userName) {
		Session session = sessionFactory.getCurrentSession();  
		// 持久化操作
		Query query = session.createQuery("from User u where u.userName = ?");
		query.setParameter(0, userName);
		User u =  (User) query.uniqueResult();
		if(u != null){
			return u;
		}
		return null;
	}
	
}

