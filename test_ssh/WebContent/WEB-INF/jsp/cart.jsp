<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0043)http://localhost:8080/mango/cart/list.jhtml -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>购物车</title>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/xiaomi.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.animate-colors-min.js"></script>

<link href="${ pageContext.request.contextPath }/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${ pageContext.request.contextPath }/css/cart.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<%@include file="menu.jsp" %>
	<div class="container cart">
		<div class="span24">
			<div class="step step1">
				购物车信息
			</div>
				<table>
					<tbody>
					<tr>
						<th>图片</th>
						<th>商品</th>
						<th>价格</th>
						<th>数量</th>
						<th>小计</th>
						<th>操作</th>
					</tr>
					<s:iterator var="cartItem" value="#session.cart.cartItems">
						<tr>
							<td width="140">
								<img width="100px" height="100px" src="${pageContext.request.contextPath}/<s:property value="#cartItem.product.image"/>"/>
							</td>
							<td width="140" style="text-align:center">
								<a target="_blank"><s:property value="#cartItem.product.pname"/></a>
							</td>
							<td width="140" style="text-align:center">
								￥<s:property value="#cartItem.product.shop_price"/>
							</td>
							<td class="quantity" width="140" style="text-align:center">
								<s:property value="#cartItem.count"/>
							</td>
							<td width="140" style="text-align:center">
								<span class="subtotal">￥<s:property value="#cartItem.subtotal"/></span>
							</td>
							<td width="140" style="text-align:center">
								<a href="${ pageContext.request.contextPath }/cart_removeCart.action?pid=<s:property value="#cartItem.product.pid"/>" class="delete">删除</a>
							</td>
						</tr>
						</s:iterator>
				</tbody></table>
				<dl id="giftItems" class="hidden" style="display: none;">
				</dl>
				<div class="total" style="text-align:right">
					<em id="promotion"></em>
							<em style="color:#ff6600">
								登录后确认是否享有优惠
							</em>&nbsp;&nbsp;
					赠送积分: <em id="effectivePoint" style="color:#ff6600">${session.cart.total }</em>&nbsp;&nbsp;
					商品金额: <strong id="effectivePrice" style="color:#ff6600">￥${session.cart.total }元</strong>
				</div>
				<div class="bottom" style="text-align:right">
					<a href="${ pageContext.request.contextPath }/cart_clearCart.action" id="clear" class="clear">清空购物车</a>
					<a href="${ pageContext.request.contextPath }/order_saveOrder.action" id="submit" class="submit">提交订单</a>
				</div>
		</div>
	</div>
<div class="container footer">
	<div class="span24">
		<div class="footerAd">
					<img src="${ pageContext.request.contextPath }/image/footer.jpg" width="950" height="52" alt="我们的优势" title="我们的优势"/>
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
						<a>招贤纳士</a>
						|
					</li>
					<li>
						<a>法律声明</a>
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
						<a>服务声明</a>
						|
					</li>
					<li>
						<a>广告声明</a>
						
					</li>
		</ul>
	</div>
	<div class="span24">
		<div class="copyright">Copyright © 2005-2015 网上商城 版权所有</div>
	</div>
</div>
</body></html>