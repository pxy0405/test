package com.pxy.service.impl;

import java.util.List;

import com.pxy.dao.CategoryDao;
import com.pxy.model.Category;
import com.pxy.service.CategoryService;

public class CategoryServiceImpl implements CategoryService{
	// 注入CategoryDao
		private CategoryDao categoryDao;

		public void setCategoryDao(CategoryDao categoryDao) {
			this.categoryDao = categoryDao;
		}

		// 业务层查询所有一级分类的方法
		public List<Category> findAll() {
			return categoryDao.findAll();
		}

		// 业务层保存一级分类
		public void save(Category category) {
			categoryDao.save(category);
		}

		// 业务层删除一级分类
		public void delete(Integer cid) {
			categoryDao.delete(cid);
		}

		// 业务层查询一级分类
		public Category findByCid(Integer cid) {
			return categoryDao.findByCid(cid);
		}

		// 业务层修改一级分类
		public void update(Category category) {
			categoryDao.update(category);
		}

		
}
