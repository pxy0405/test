package com.pxy.service.impl;

import java.util.List;

import com.pxy.dao.CategorySecondDao;
import com.pxy.model.CategorySecond;
import com.pxy.service.CategorySecondService;

public class CategorySecondServiceImpl implements CategorySecondService{

	// 注入CategoryDao
			private CategorySecondDao categorySecondDao;

			public void setCategorySecondDao(CategorySecondDao categorySecondDao) {
				this.categorySecondDao = categorySecondDao;
			}

	@Override
	public void save(CategorySecond categorySecond) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<CategorySecond> findAll() {
		return categorySecondDao.findAll();
	}

}
