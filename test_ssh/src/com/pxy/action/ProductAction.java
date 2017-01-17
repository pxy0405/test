package com.pxy.action;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.pxy.model.CategorySecond;
import com.pxy.model.Product;
import com.pxy.service.CategorySecondService;
import com.pxy.service.CategoryService;
import com.pxy.service.ProductService;
import com.pxy.service.impl.CategorySecondServiceImpl;
import com.pxy.service.impl.CategoryServiceImpl;
import com.pxy.service.impl.ProductServiceImpl;

public class ProductAction extends SuperAction{

	//注入一级分类的service
	private CategoryService categoryService = new CategoryServiceImpl();
	//注入二级分类的service
	private CategorySecondService categorySecondService = new CategorySecondServiceImpl();
	//注入商品的service
	private ProductService productService = new ProductServiceImpl();
	// 接收商品
	private Product product;
	// 接收分类cid
	private Integer cid;
	// 接收二级分类id
	private Integer csid;
	//当前页数
	private int page;
	
	public void setCategorySecondService(CategorySecondService categorySecondService) {
		this.categorySecondService = categorySecondService;
	}

	// 文件上传需要的三个属性:
	private File upload;	// 上传文件
	private String uploadContentType; // 上传文件的MIME类型
	private String uploadFileName; // 上传文件名称
		
	public File getUpload() {
		return upload;
	}


	public void setUpload(File upload) {
		this.upload = upload;
	}


	public String getUploadFileName() {
		return uploadFileName;
	}


	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}


	public String getUploadContentType() {
		return uploadContentType;
	}


	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}


	public Integer getCid() {
		return cid;
	}


	public void setCid(Integer cid) {
		this.cid = cid;
	}


	public Integer getCsid() {
		return csid;
	}


	public void setCsid(Integer csid) {
		this.csid = csid;
	}


	public int getPage() {
		return page;
	}


	public void setPage(int page) {
		this.page = page;
	}


	public Product getProduct() {
		return product;
	}


	public void setProduct(Product product) {
		this.product = product;
	}


	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}


	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

/*product_findByPid.action*/
		// 根据商品的ID进行查询商品:执行方法:
		public String findByPid() {
			// 调用Service的方法完成查询.
			Integer pid=Integer.parseInt(request.getParameter("pid"));
			product = productService.findByPid(pid);
			return "findByPid";
		}

		// 根据分类的id查询商品:
		public String findByCid() {
			// List<Category> cList = categoryService.findAll();
			List<Product> pageBean = productService.findByPageCid(cid, page);// 根据一级分类查询商品,带分页查询
			// 将PageBean存入到值栈中:
			//ActionContext.getContext().getValueStack().set("pageBean", pageBean);
			// 将PageBean存入session
			session.setAttribute("pageBean", pageBean);
			return "findByCid";
		}

		
		// 根据二级分类id查询商品，跳转到新增商品页面:
		public String adminFindAllCS(){
			// 调用Service完成查询:
			List<CategorySecond> csList = categorySecondService.findAll();
			// 压入值栈:
			ActionContext.getContext().getValueStack().set("csList", csList);
			return "addProductPage";
		}
		//后台:查询所有商品的方法
		public String adminFindAll(){
			List<Product> productList=productService.list();
			// 压入值栈:
			ActionContext.getContext().getValueStack().set("productList", productList);
			return "adminFindAllSuccess";
		}
		
		//跳转到添加页面
		public String addPage(){
			// 查询所有的二级分类 :
			return "addPageSuccess";
		}
		
		public String deleteProduct(){
			Integer  pid = Integer.parseInt(request.getParameter("pid"));
			productService.delete(pid);
			return "deleteProductSuccess";
		}
		
		//添加商品
		public String addProduct() throws IOException{
			// 文件上传的操作:
			// 获得上传的路径:
			String path = ServletActionContext.getServletContext().getRealPath("/products");
			//String realPath = path+"/"+csid+"/"+uploadFileName;
			String realPath = path+"/"+uploadFileName;
			File diskFile = new File(realPath);
			// 文件上传:
			FileUtils.copyFile(upload, diskFile);
			// 保存到数据库:
			// 设置二级分类
			CategorySecond categorySecond = new CategorySecond();
			categorySecond.setCsid(csid);
			product.setCategorySecond(categorySecond);
			// 设置时间:
			product.setPdate(new Date());
			// 设置图片上传路径:
			//product.setImage("products/"+csid+"/"+uploadFileName);
			product.setImage("products/"+uploadFileName);
			productService.save(product);
			return "addProductSuccess";
		}
}
