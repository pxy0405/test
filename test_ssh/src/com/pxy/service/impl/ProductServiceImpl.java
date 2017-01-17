package com.pxy.service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.pxy.dao.ProductDao;
import com.pxy.dao.impl.ProductDaoImpl;
import com.pxy.model.Category;
import com.pxy.model.Product;
import com.pxy.service.ProductService;
import com.pxy.utils.PageBean;

@Transactional
public class ProductServiceImpl implements ProductService{
	private ProductDao productDao = new ProductDaoImpl();

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	
	@Override
	public List<Product> findHot() {
		//热门商品查询
		return productDao.findHot();
	}

	
	@Override
	public List<Product> findNew() {
		//最新商品查询
		return productDao.findNew();
	}

	@Override
	public Product findByPid(Integer pid) {
		// 进商品详情
		return productDao.finByPid(pid);
	}

	@Override
	public List<Product> findByPageCid(Integer cid, int page) {
		// 一级分类商品显示
		return productDao.findByPageCid(cid, 0, 10);
	}

	@Override
	public List<Product> findByPageCsid(Integer csid, int page) {
		// 二级分类商品显示
		return productDao.findByPageCsid(csid, 0, 10);
	}


	@Override
	public List<Product> list() {
		// 显示后台商品列表
		return productDao.list();
	}


	@Override
	public void save(Product product) {
		//新增后台商品
		productDao.save(product);
		
	}


	@Override
	public void delete(Integer pid) {
		// TODO Auto-generated method stub
		productDao.delete(pid);
	}


}
