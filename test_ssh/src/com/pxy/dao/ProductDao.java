package com.pxy.dao;

import java.util.List;

import com.pxy.model.Category;
import com.pxy.model.Product;

public interface ProductDao {

	List<Product> findHot();

	List<Product> findNew();

	Product finByPid(Integer pid);

	int findCountCsid(Integer csid);

	List<Product> findByPageCid(Integer cid, int begin, int limit);

	List<Product> findByPageCsid(Integer csid, int begin, int limit);

	int findCountCid(Integer cid);

	List<Product> list();

	void save(Product product);

	void delete(Integer pid);

}
