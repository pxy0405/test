<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品添加</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/matrix-style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/matrix-media.css" />
<link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href='http://fonts.useso.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
</head>
<body>
<%@include file="../admin_menu.jsp" %>
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#">Form elements</a> <a href="#" class="current">Form wizard</a> </div>

  </div>
  <div class="container-fluid"><hr>
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-pencil"></i> </span>
            <h5>新增商品详情</h5>
          </div>
          <div class="widget-content nopadding">
            <form id="form-wizard" class="form-horizontal" action="product_addProduct.action"  enctype="multipart/form-data" method="post">
              <div id="form-wizard-1" class="step">
                <div class="control-group">
                  <label class="control-label">商品名字</label>
                  <div class="controls">
                    <input id="pname" type="text" name="product.pname" />
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label">市场价格</label>
                  <div class="controls">
                    <input id="market_price" type="text" name="product.market_price" />
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label">优惠价格</label>
                  <div class="controls">
                    <input id="shop_price" type="text" name="product.shop_price" />
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label">简介</label>
                  <div class="controls">
                    <input id="pdesc" type="text" name="product.pdesc" />
                  </div>
                </div>
              </div>
             <div class="control-group">
                  <label class="control-label">是否热门</label>
                  <div class="controls">
                    <input id="is_hot" type="text" name="product.is_hot" />
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label">质量</label>
                  <div class="controls">
                    <input id="material" type="text" name="product.material" />
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label">品牌</label>
                  <div class="controls">
                    <input id="brand" type="text" name="product.brand" />
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label">二级分类</label>
                  <div class="controls">
                    <select name="csid" >
                    	<c:forEach items="${csList }" var="cs">
						   	 <option  value="${cs.csid }">${cs.csname }</option>
						 </c:forEach>
						</select>
                  </div>
                </div>
              <%--   <select name="csid" >
							<s:iterator var="cs" value="csList">
						   	 <option value="<s:property value="#cs.csid"/>"><s:property value="#cs.csname"/></option>
						    </s:iterator>
						</select> --%>
                <div class="control-group">
                  <label class="control-label">图片</label>
                  <div class="controls">
                    <input type="file" name="upload" value="" />
                  </div>
                </div>
                 <input type="submit" value="添加"/>
                 </form>
              </div>
          </div>
          
        </div>
      </div>
    </div>
  </div>
<!--Footer-part-->
<div class="row-fluid">
  <div id="footer" class="span12"> 2013 &copy; Matrix Admin. More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a> </div>
</div>
<!--end-Footer-part-->
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/jquery.ui.custom.js"></script> 
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/jquery.validate.js"></script> 
<script src="${pageContext.request.contextPath}/js/jquery.wizard.js"></script> 
<script src="${pageContext.request.contextPath}/js/matrix.js"></script> 
<script src="${pageContext.request.contextPath}/js/matrix.wizard.js"></script>
</body>
</html>