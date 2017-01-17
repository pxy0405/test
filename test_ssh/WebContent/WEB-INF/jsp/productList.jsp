<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>村艺茶具商城</title>
	<link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet" type="text/css"/>
		<link href="${pageContext.request.contextPath}/css/amazeui.css" rel="stylesheet" type="text/css"/>

		<link href="${pageContext.request.contextPath}/css/personal.css" rel="stylesheet" type="text/css"/>
		<link href="${pageContext.request.contextPath}/css/colstyle.css" rel="stylesheet" type="text/css"/>

<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/product.css" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xiaomi.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.animate-colors-min.js"></script>
    </head>
<body>
<%@include file="menu.jsp" %>
<%-- 
<div class="container productList">
         <div class="span6">
			<div class="hotProductCategory">
				<c:forEach items="${sessionScope.cList }" var="c">
				<dl>
					<dt>
						<a href="${pageContext.request.contextPath}/product_findByCid.action?cid=${c.cid }&page=1">${c.cname }</a>
					</dt>
						<c:forEach items="${c.categorySeconds }" var="cs">
							<dd>
								<a href="${ pageContext.request.contextPath }/product_findByCsid.action?csid=${cs.csid }&page=1">${cs.csname }</a>
							</dd>
						</c:forEach>	
				</dl>
				</c:forEach>	
			</div>
		</div>
            
			 <div class="span18 last" style="float:right;border:none">	
					<div id="result" class="result table clearfix">
							<ul>
							<c:forEach items="${session.pageBean }" var="p">
			               	<li>
								<a href="${ pageContext.request.contextPath }/product_findByPid.action?pid=${p.pid}"><img src="${pageContext.request.contextPath}/${p.image}" width="170" height="170"  style="display: inline-block;"/>
									<span style='color:green'>
									 ${p.pname }
									</span>
									 
									<span class="price">
										商城价： ${p.shop_price }
									</span>
								</a>
							</li>
			                </c:forEach>
							</ul>
					</div>
         	</div>
</div> --%>
<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-collection">
								<div class="you-like">
							<div class="s-content">
							<c:forEach items="${session.pageBean }" var="p">
								<div class="s-item-wrap">
									<div class="s-item">
										<div class="s-pic">
											<a href="${ pageContext.request.contextPath }/product_findByPid.action?pid=${p.pid}" class="s-pic-link">
												<img width="180px" height="180px" src="${pageContext.request.contextPath}/${p.image}" alt="" title="" class="s-pic-img s-guess-item-img"/>
											</a>
										</div>
										<div class="s-info">
											<div class="s-title"><a href="#" title=""> ${p.pname }</a></div>
											<div class="s-price-box">
												<span class="s-price"><em class="s-price-sign">¥</em><em class="s-value"> ${p.shop_price }</em></span>
												<span class="s-history-price"><em class="s-price-sign">¥</em><em class="s-value">${p.market_price }</em></span>
											</div>
											<div class="s-extra-box">
												<span class="s-comment">好评: 98.03%</span>
												<span class="s-sales">月销: 219</span>
											</div>
										</div>
										<div class="s-tp">
											<span class="ui-btn-loading-before">找相似</span>
											<i class="am-icon-shopping-cart"></i>
											<span class="ui-btn-loading-before buy">加入购物车</span>
											<p>
												<a href="javascript:;" class="c-nodo J_delFav_btn">取消收藏</a>
											</p>
										</div>
									</div>
								</div>
							</c:forEach>

							</div>

							<div class="s-more-btn i-load-more-item" data-screen="0"><i class="am-icon-refresh am-icon-fw"></i>更多</div>

						</div>

					</div>

				</div>
				
			</div>

			<aside class="menu">
				<ul>
					<li class="person">
						<a href="index.html">菜单栏</a>
					</li>
					<c:forEach items="${sessionScope.cList }" var="c">
					<li class="person">
						<a href="${pageContext.request.contextPath}/product_findByCid.action?cid=${c.cid }&page=1">${c.cname }</a>
						<ul>
						<c:forEach items="${c.categorySeconds }" var="cs">
							<li> <a href="${ pageContext.request.contextPath }/product_findByCsid.action?csid=${cs.csid }&page=1">${cs.csname }</a></li>
							</c:forEach>
						</ul>
					</li>
					</c:forEach>

				</ul>

			</aside>
		</div>
<div class="container footer">
	<div class="span24">
		<div class="footerAd">
					<img src="${pageContext.request.contextPath}/image/footer.jpg" width="950" height="52" alt="我们的优势" title="我们的优势"/>
</div>	</div>
	<div class="span24">
		<ul class="bottomNav">
					<li>
						<a >关于我们</a>
						|
					</li>
					<li>
						<a>联系我们</a>
						|
					</li>
					<li>
						<a >诚聘英才</a>
						|
					</li>
					<li>
						<a >法律声明</a>
						|
					</li>
					<li>
						<a>友情链接</a>
						|
					</li>
					<li>
						<a target="_blank">支付方式</a>
						|
					</li>
					<li>
						<a  target="_blank">配送方式</a>
						|
					</li>
					<li>
						<a >官网</a>
						|
					</li>
					<li>
						<a >论坛</a>
						
					</li>
		</ul>
	</div>
	<div class="span24">
		<div class="copyright">Copyright©2005-2015 网上商城 版权所有</div>
	</div>
</div>
<script type="text/javascript" src="js/xiaomi.js"></script>
</body></html>