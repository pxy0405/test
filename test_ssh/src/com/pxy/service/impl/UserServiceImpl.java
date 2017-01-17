package com.pxy.service.impl;

import java.util.List;




import com.pxy.dao.UserDao;
import com.pxy.model.User;
import com.pxy.service.UserService;

public class UserServiceImpl implements UserService{
	public UserServiceImpl(){}

	private UserDao userDao;
	
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public User login(User user) {
		return userDao.login(user);
	}

	@Override
	public List<User> list() {
		return userDao.list();
	}

	@Override
	public void register(User user) {
		userDao.register(user);
		
	}

	@Override
	public User findByID(Integer iD) {
		return userDao.findByID(iD);
	}

	@Override
	public void edit(User user) {
		userDao.edit(user);
		
	}

	@Override
	public void delete(Integer iD) {
		userDao.delete(iD);
		
	}

	@Override
	public User findByUserName(String userName) {
		 return userDao.findByUserName(userName);
	}

}
