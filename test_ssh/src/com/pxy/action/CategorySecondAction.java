package com.pxy.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.pxy.model.Category;
import com.pxy.model.CategorySecond;
import com.pxy.service.CategorySecondService;
import com.pxy.service.CategoryService;

public class CategorySecondAction extends ActionSupport{
	// 接收页数参数:
	private Integer page;
	private CategorySecond categorySecond;
	// 注入Service
	private CategorySecondService categorySecondService;
	// 注入一级分类的Service
	private CategoryService categoryService;
	// 接收cid
	private Integer cid;
	
	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public void setCategorySecond(CategorySecond categorySecond) {
		this.categorySecond = categorySecond;
	}

	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	public void setCategorySecondService(CategorySecondService categorySecondService) {
		this.categorySecondService = categorySecondService;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	//二级分类管理:查询所有二级分类
	public String adminFindAll(){
		// 调用Service完成查询:
		List<CategorySecond> cList = categorySecondService.findAll();
		// 压入值栈:
		ActionContext.getContext().getValueStack().set("cList", cList);
		return "adminFindAllSuccess";
	}
	
	
	// 二级分类管理:跳转到添加页面的方法.
	public String addPage(){
		// 查询一级分类的列表:
		List<Category> cList = categoryService.findAll();
		// 压栈:
		ActionContext.getContext().getValueStack().set("cList", cList);
		return "addPageSuccess";
	}
	
	//二级分类的保存:
	public String save(){
		Category category = new Category();
		category.setCid(cid);
		// 二级分类对象:
		categorySecond.setCategory(category);
		// 调用Serviec保存
		categorySecondService.save(categorySecond);
		return "saveSuccess";
		
	}

}
