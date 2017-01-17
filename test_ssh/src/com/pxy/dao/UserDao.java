package com.pxy.dao;

import java.util.List;

import org.hibernate.SessionFactory;

import com.pxy.model.User;

public interface UserDao {
	
	public User login(User user);

	public void register(User user);

	public List<User> list();
	
	public User findByID(int ID);
	
	public void edit(User user);
	
	public void delete(int ID);

	public User findByUserName(String userName);
}
