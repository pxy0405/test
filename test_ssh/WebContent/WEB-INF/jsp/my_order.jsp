<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>订单管理</title>
		<link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet" type="text/css"/>
		<link href="${pageContext.request.contextPath}/css/amazeui.css" rel="stylesheet" type="text/css"/>

		<link href="${pageContext.request.contextPath}/css/personal.css" rel="stylesheet" type="text/css"/>
		<link href="${pageContext.request.contextPath}/css/colstyle.css" rel="stylesheet" type="text/css"/>

		<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
		<link href="${pageContext.request.contextPath}/css/product.css" rel="stylesheet" type="text/css"/>

	    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xiaomi.css"/>
	    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
	    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.animate-colors-min.js"></script>
	 
		<link href="${pageContext.request.contextPath}/css/orstyle.css" rel="stylesheet" type="text/css">
		<script src="${pageContext.request.contextPath}/js/amazeui.js"></script>

	</head>

	<body>
	<%@include file="menu.jsp" %>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-order">

						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">订单管理</strong> / <small>Order</small></div>
						</div>
						<hr/>

						<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

							<ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active"><a href="#tab1">所有订单</a></li>
								<li><a href="#tab2">待付款</a></li>
								<li><a href="#tab3">待发货</a></li>
								<li><a href="#tab4">待收货</a></li>
								<li><a href="#tab5">已完成订单</a></li>
							</ul>

							<div class="am-tabs-bd">
								<div class="am-tab-panel am-fade am-in am-active" id="tab1">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>
											
									<div class="order-main">
										<div class="order-list">
											<s:iterator var="order" value="oList">
											<div class="order-status1">
												<div class="order-title">
													<div class="dd-num">
													订单号:<s:property value="#order.oid"/>
													</div>
													<span>成交时间:<s:property value="#order.ordertime"/></span>
												</div>
											</div>
											<div class="order-content">
												<s:iterator var="orderItem" value="#order.orderItems">
													<div class="order-left">
														<ul class="item-list">	  
															<li class="td td-item">    
																<div class="item-pic">
																	<img style="width:75px;height:75px" src="${ pageContext.request.contextPath }/<s:property value="#orderItem.product.image"/>"/>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																	<p><s:property value="#orderItem.product.pname"/></p>
																	<p class="info-little"><s:property value="#orderItem.product.brand"/></p>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	单价：<s:property value="#orderItem.product.shop_price"/>元
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span><s:property value="#orderItem.count"/>							
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">

																</div>
															</li>
														</ul>
													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																总计：<s:property value="#order.total"/>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">
																			状态 :<s:if test="#order.state == 1">
																				<a href="${ pageContext.request.contextPath }/order_findByOid.action?oid=<s:property value="#order.oid"/>"><font color="red">付款</font></a>
																			</s:if>
																			<s:elseif test="#order.state == 2">
																				已付款
																			</s:elseif>
																			<s:elseif test="#order.state == 3">
																				<a href="${ pageContext.request.contextPath }/order_updateState.action?oid=<s:property value="#order.oid"/>"><font color="red">确认收货</font></a>
																			</s:elseif>
																			<s:elseif test="#order.state == 4">
																				订单完成
																			</s:elseif>
																	</p>
																</div>
															</li>
															<li class="td td-change">
																<a href="pay.html">
																<div class="am-btn am-btn-danger anniu">
																	一键支付</div></a>
															</li>
														</div>
													</div>
												</s:iterator>
											</div>
											</s:iterator>
										</div>
									</div>

								</div>
								<!-- table1结尾 -->
								<div class="am-tab-panel am-fade" id="tab2">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>
									<div class="order-main">
										<div class="order-list">
											<s:iterator var="order" value="oList">
											<div class="order-status1">
												<div class="order-title">
												<s:if test="#order.state == 1">
													<div class="dd-num">
													订单号:<s:property value="#order.oid"/>
													</div>
													<span>成交时间:<s:property value="#order.ordertime"/></span>
												</s:if>
												</div>
											</div>
											<div class="order-content">
												<s:if test="#order.state == 1">
												<s:iterator var="orderItem" value="#order.orderItems">
													<div class="order-left">
														<ul class="item-list">	  
															<li class="td td-item">    
																<div class="item-pic">
																	<img style="width:75px;height:75px" src="${ pageContext.request.contextPath }/<s:property value="#orderItem.product.image"/>"/>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																	<p><s:property value="#orderItem.product.pname"/></p>
																	<p class="info-little"><s:property value="#orderItem.product.brand"/></p>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	单价：<s:property value="#orderItem.product.shop_price"/>元
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span><s:property value="#orderItem.count"/>							
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">

																</div>
															</li>
														</ul>
													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																总计：<s:property value="#order.total"/>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">
																			状态 :<s:if test="#order.state == 1">
																				<a href="${ pageContext.request.contextPath }/order_findByOid.action?oid=<s:property value="#order.oid"/>"><font color="red">付款</font></a>
																			</s:if>
																			<s:elseif test="#order.state == 2">
																				已付款
																			</s:elseif>
																			<s:elseif test="#order.state == 3">
																				<a href="${ pageContext.request.contextPath }/order_updateState.action?oid=<s:property value="#order.oid"/>"><font color="red">确认收货</font></a>
																			</s:elseif>
																			<s:elseif test="#order.state == 4">
																				订单完成
																			</s:elseif>
																	</p>
																</div>
															</li>
															<li class="td td-change">
																<a href="pay.html">
																<div class="am-btn am-btn-danger anniu">
																	一键支付</div></a>
															</li>
														</div>
													</div>
												</s:iterator>
												</s:if>
											</div>
											</s:iterator>
										</div>
									</div>
								</div>
								<div class="am-tab-panel am-fade" id="tab3">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
											<s:iterator var="order" value="oList">
											<div class="order-status2">
												<div class="order-title">
												<s:if test="#order.state == 2">
													<div class="dd-num">
													订单号:<s:property value="#order.oid"/>
													</div>
													<span>成交时间:<s:property value="#order.ordertime"/></span>
												</s:if>
												</div>
											</div>
											<div class="order-content">
												<s:if test="#order.state == 2">
												<s:iterator var="orderItem" value="#order.orderItems">
													<div class="order-left">
														<ul class="item-list">	  
															<li class="td td-item">    
																<div class="item-pic">
																	<img style="width:75px;height:75px" src="${ pageContext.request.contextPath }/<s:property value="#orderItem.product.image"/>"/>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																	<p><s:property value="#orderItem.product.pname"/></p>
																	<p class="info-little"><s:property value="#orderItem.product.brand"/></p>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	单价：<s:property value="#orderItem.product.shop_price"/>元
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span><s:property value="#orderItem.count"/>							
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">

																</div>
															</li>
														</ul>
													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																总计：<s:property value="#order.total"/>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">
																			状态 :<s:if test="#order.state == 1">
																				<a href="${ pageContext.request.contextPath }/order_findByOid.action?oid=<s:property value="#order.oid"/>"><font color="red">付款</font></a>
																			</s:if>
																			<s:elseif test="#order.state == 2">
																				已付款
																			</s:elseif>
																			<s:elseif test="#order.state == 3">
																				<a href="${ pageContext.request.contextPath }/order_updateState.action?oid=<s:property value="#order.oid"/>"><font color="red">确认收货</font></a>
																			</s:elseif>
																			<s:elseif test="#order.state == 4">
																				订单完成
																			</s:elseif>
																	</p>
																</div>
															</li>
															<li class="td td-change">
																<a href="pay.html">
																<div class="am-btn am-btn-danger anniu">
																	一键支付</div></a>
															</li>
														</div>
													</div>
												</s:iterator>
												</s:if>
											</div>
											</s:iterator>
										</div>
									</div>
								</div>
								<div class="am-tab-panel am-fade" id="tab4">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
											<s:iterator var="order" value="oList">
											<div class="order-status3">
												<div class="order-title">
												<s:if test="#order.state == 3">
													<div class="dd-num">
													订单号:<s:property value="#order.oid"/>
													</div>
													<span>成交时间:<s:property value="#order.ordertime"/></span>
												</s:if>
												</div>
											</div>
											<div class="order-content">
												<s:if test="#order.state == 3">
												<s:iterator var="orderItem" value="#order.orderItems">
													<div class="order-left">
														<ul class="item-list">	  
															<li class="td td-item">    
																<div class="item-pic">
																	<img style="width:75px;height:75px" src="${ pageContext.request.contextPath }/<s:property value="#orderItem.product.image"/>"/>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																	<p><s:property value="#orderItem.product.pname"/></p>
																	<p class="info-little"><s:property value="#orderItem.product.brand"/></p>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	单价：<s:property value="#orderItem.product.shop_price"/>元
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span><s:property value="#orderItem.count"/>							
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">

																</div>
															</li>
														</ul>
													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																总计：<s:property value="#order.total"/>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">
																			状态 :<s:if test="#order.state == 1">
																				<a href="${ pageContext.request.contextPath }/order_findByOid.action?oid=<s:property value="#order.oid"/>"><font color="red">付款</font></a>
																			</s:if>
																			<s:elseif test="#order.state == 2">
																				已付款
																			</s:elseif>
																			<s:elseif test="#order.state == 3">
																				<a href="${ pageContext.request.contextPath }/order_updateState.action?oid=<s:property value="#order.oid"/>"><font color="red">确认收货</font></a>
																			</s:elseif>
																			<s:elseif test="#order.state == 4">
																				订单完成
																			</s:elseif>
																	</p>
																</div>
															</li>
															<li class="td td-change">
																<a href="pay.html">
																<div class="am-btn am-btn-danger anniu">
																	一键支付</div></a>
															</li>
														</div>
													</div>
												</s:iterator>
												</s:if>
											</div>
											</s:iterator>
										</div>
									</div>
								</div>

								<div class="am-tab-panel am-fade" id="tab5">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
											<s:iterator var="order" value="oList">
											<div class="order-status4">
												<div class="order-title">
												<s:if test="#order.state == 4">
													<div class="dd-num">
													订单号:<s:property value="#order.oid"/>
													</div>
													<span>成交时间:<s:property value="#order.ordertime"/></span>
												</s:if>
												</div>
											</div>
											<div class="order-content">
												<s:if test="#order.state == 4">
												<s:iterator var="orderItem" value="#order.orderItems">
													<div class="order-left">
														<ul class="item-list">	  
															<li class="td td-item">    
																<div class="item-pic">
																	<img style="width:75px;height:75px" src="${ pageContext.request.contextPath }/<s:property value="#orderItem.product.image"/>"/>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																	<p><s:property value="#orderItem.product.pname"/></p>
																	<p class="info-little"><s:property value="#orderItem.product.brand"/></p>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	单价：<s:property value="#orderItem.product.shop_price"/>元
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span><s:property value="#orderItem.count"/>							
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">

																</div>
															</li>
														</ul>
													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																总计：<s:property value="#order.total"/>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">
																			状态 :<s:if test="#order.state == 1">
																				<a href="${ pageContext.request.contextPath }/order_findByOid.action?oid=<s:property value="#order.oid"/>"><font color="red">付款</font></a>
																			</s:if>
																			<s:elseif test="#order.state == 2">
																				已付款
																			</s:elseif>
																			<s:elseif test="#order.state == 3">
																				<a href="${ pageContext.request.contextPath }/order_updateState.action?oid=<s:property value="#order.oid"/>"><font color="red">确认收货</font></a>
																			</s:elseif>
																			<s:elseif test="#order.state == 4">
																				订单完成
																			</s:elseif>
																	</p>
																</div>
															</li>
															<li class="td td-change">
																<a href="pay.html">
																<div class="am-btn am-btn-danger anniu">
																	一键支付</div></a>
															</li>
														</div>
													</div>
												</s:iterator>
												</s:if>
											</div>
											</s:iterator>
										</div>

									</div>

								</div>
							</div>

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

	</body>

</html>