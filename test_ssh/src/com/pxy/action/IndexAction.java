package com.pxy.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.pxy.model.Category;
import com.pxy.model.Product;
import com.pxy.service.CategoryService;
import com.pxy.service.ProductService;
import com.pxy.service.UserService;
import com.pxy.service.impl.CategoryServiceImpl;
import com.pxy.service.impl.ProductServiceImpl;
import com.pxy.service.impl.UserServiceImpl;

public class IndexAction  extends SuperAction{

	//注入一级分类的service
	private CategoryService categoryService = new CategoryServiceImpl();
	
	//注入商品的service
	private ProductService productService = new ProductServiceImpl();
	

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}


	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}


	public String index(){
		//查询一级分类
			List<Category> cList = categoryService.findAll();
			if(cList != null){
				//将一级分类列表传到session
				session.setAttribute("cList", cList);
				//查热门商品
				List<Product> hList = productService.findHot();
				//热门商品输出到值栈
				ActionContext.getContext().getValueStack().set("hList", hList);
				//session.setAttribute("hList", hList);
				//查找最新商品
				List<Product> nList = productService.findNew();
				//最新商品输出到值栈
				ActionContext.getContext().getValueStack().set("nList", nList);
				//session.setAttribute("nList", nList);
			}
			
		return "index";
	}
	
}
