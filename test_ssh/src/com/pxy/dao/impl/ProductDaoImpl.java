package com.pxy.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;





import com.pxy.model.Product;
import com.pxy.model.User;
import com.pxy.dao.ProductDao;

public class ProductDaoImpl implements ProductDao {
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	// 首页上热门商品查询
		public List<Product> findHot() {
			Session session = sessionFactory.getCurrentSession();
			String hql="from Product p where p.is_hot = 1  order by p.pdate desc ";
			Query query =session.createQuery(hql);
			query.setMaxResults(8);
			List<Product> productList = query.list();
			if(productList!=null&&productList.size()>0){
				return productList;
			}else{
				return null;
			}
		}

		//首页最新商品查询
		@Override
		public List<Product> findNew() {
			Session session = sessionFactory.getCurrentSession();
			String hql="from Product p order by p.pdate desc ";
			Query query =session.createQuery(hql);
			query.setMaxResults(10);
			List<Product> productList = query.list();
			if(productList!=null&&productList.size()>0){
				return productList;
			}else{
				return null;
			}
		}

		//按照商品id进行查询，跳到商品详情页
		@Override
		public Product finByPid(Integer pid) {
			Session session = sessionFactory.getCurrentSession(); 
	       
			String hql="from Product p where p.pid = ? ";
			Query query =session.createQuery(hql);
			query.setParameter(0, pid);
			Product p =  (Product) query.uniqueResult();
			if(p != null){
				return p;
			}
			return null;
		}

		
		//查询一级分类下的商品个数
		@Override
		public int findCountCid(Integer cid) {
			Session session = sessionFactory.getCurrentSession(); 
			String hql = "select count(*) from Product p where p.categorySecond.category.cid = ?";
			Query query =session.createQuery(hql);
			query.setParameter(0, cid);
			List<Product> productList = query.list();
			if(productList!=null&&productList.size()>0){
				return productList.size();
			}else{
				return 0;
			}
		}
		
		//查询二级目录下商品的个数
		@Override
		public int findCountCsid(Integer csid) {
			Session session = sessionFactory.getCurrentSession();
			String hql = "select count(*) from Product p where p.categorySecond.csid = ?";
			Query query =session.createQuery(hql);
			query.setParameter(0, csid);
			List<Product> productList = query.list();
			if(productList!=null&&productList.size()>0){
				return productList.size();
			}else{
				return 0;
			}
		}
		
		//查询该一级目录下所有商品
		@Override
		public List<Product> findByPageCid(Integer cid, int begin, int limit) {
			Session session = sessionFactory.getCurrentSession();
			String hql = "select p from Product p join p.categorySecond cs join cs.category c where c.cid = ?";
			Query query =session.createQuery(hql);
			query.setMaxResults(limit);
			query.setParameter(0, cid);
			List<Product> productList = query.list();
			if(productList!=null&&productList.size()>0){
				return productList;
			}else{
				return null;
			}
		}

		//查询该二级目录下所有商品
		@Override
		public List<Product> findByPageCsid(Integer csid, int begin, int limit) {
			Session session = sessionFactory.getCurrentSession();
			String hql = "select p from Product p join p.categorySecond cs where cs.csid = ?";
			Query query =session.createQuery(hql);
			query.setMaxResults(limit);
			query.setParameter(0, csid);
			List<Product> productList = query.list();
			if(productList!=null&&productList.size()>0){
				return productList;
			}else{
				return null;
			}
		}

		@Override
		public List<Product> list() {
			//后台显示商品列表
			Session session = sessionFactory.getCurrentSession();
			String hql="from Product";
			Query query =session.createQuery(hql);
			List<Product> productList = query.list();
			if(productList!=null&&productList.size()>0){
				return productList;
			}else{
				return null;
			}
		}

		@Override
		public void save(Product product) {
			Session session = sessionFactory.getCurrentSession();
	        session.save(product);
		}

		@Override
		public void delete(Integer pid) {
			Session session = sessionFactory.getCurrentSession();
			Product product =(Product)session.get(Product.class,pid);
	        session.delete(product);
		}

}
