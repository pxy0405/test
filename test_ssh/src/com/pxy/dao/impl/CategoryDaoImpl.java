package com.pxy.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.pxy.dao.CategoryDao;
import com.pxy.model.Category;
import com.pxy.model.Product;
import com.pxy.model.User;


public class CategoryDaoImpl implements CategoryDao{
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	//DAO层的查询所有一级分类的方法
		public List<Category> findAll() {
			Session session = sessionFactory.getCurrentSession();
			String hql="from Category";
			Query query =session.createQuery(hql);
			List<Category> categoryList = query.list();
			if(categoryList!=null&&categoryList.size()>0){
				return categoryList;
			}else{
				return null;
			}
		}

		@Override
		public void save(Category category) {
			Session session = sessionFactory.getCurrentSession();
	        session.save(category);  
		}

		@Override
		public void delete(Integer cid) {
			Session session = sessionFactory.getCurrentSession();
			Category category =(Category)session.get(Category.class,cid);
	        session.delete(category); 
		}

		@Override
		public Category findByCid(Integer cid) {
			Session session = sessionFactory.getCurrentSession();  
			Category category= (Category)session.get(Category.class, cid);
	        return category;
		}

		@Override
		public void update(Category category) {
			Session session = sessionFactory.getCurrentSession();
	        session.update(category); 
		}
		
}
