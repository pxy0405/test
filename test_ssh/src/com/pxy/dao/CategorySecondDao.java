package com.pxy.dao;

import java.util.List;


import com.pxy.model.CategorySecond;

public interface CategorySecondDao {
	// 保存二级分类
			public void save(CategorySecond categorySecond);

			public List<CategorySecond> findAll();
}
