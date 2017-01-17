package com.pxy.service;

import java.util.List;

import com.pxy.model.Category;
import com.pxy.model.Product;
import com.pxy.utils.PageBean;

public interface ProductService {

	List<Product> findHot();

	List<Product> findNew();

	Product findByPid(Integer pid);

	List<Product> findByPageCid(Integer cid, int page);

	List<Product> findByPageCsid(Integer csid, int page);

	List<Product> list();

	void save(Product product);

	void delete(Integer pid);


}
