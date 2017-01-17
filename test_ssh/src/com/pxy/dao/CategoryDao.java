package com.pxy.dao;

import java.util.List;

import com.pxy.model.Category;

public interface CategoryDao {

	List<Category> findAll();

	void save(Category category);

	void delete(Integer cid);

	Category findByCid(Integer cid);

	void update(Category category);

}
