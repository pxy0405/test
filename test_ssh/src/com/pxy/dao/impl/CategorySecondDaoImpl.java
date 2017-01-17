package com.pxy.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;





import com.pxy.dao.CategorySecondDao;
import com.pxy.model.Category;
import com.pxy.model.CategorySecond;

public class CategorySecondDaoImpl implements CategorySecondDao{
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

		// 保存二级分类
		public void save(CategorySecond categorySecond) {
			Session session = sessionFactory.getCurrentSession();
	        session.save(categorySecond);  
		}

		public List<CategorySecond> findAll() {
			Session session = sessionFactory.getCurrentSession();
			String hql="from CategorySecond";
			Query query =session.createQuery(hql);
			List<CategorySecond> categoryList = query.list();
			if(categoryList!=null&&categoryList.size()>0){
				return categoryList;
			}else{
				return null;
			}
		}

}
