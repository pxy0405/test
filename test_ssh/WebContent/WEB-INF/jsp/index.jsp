<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>村艺茶具商城</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xiaomi.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.animate-colors-min.js"></script>
</head>
<body>
<%@ include file="menu.jsp" %>

     <div id="big_banner_wrap">
         <ul id="banner_menu_wrap">
         	<c:forEach items="${sessionScope.cList }" var="c">
             <li class="active">
                 <a href="${pageContext.request.contextPath}/product_findByCid.action?cid=${c.cid }&page=1">${c.cname }</a>
                 <a class="banner_menu_i">&gt;</a>
                 <div class="banner_menu_content" style="width: 300px; top: -20px;">
                     <ul class="banner_menu_content_ul">
                     	<c:forEach items="${c.categorySeconds }" var="cs">
                         <li>
                             <%-- <a><img src="${pageContext.request.contextPath}/img/mi/minote.jpg"/></a> --%>
                             <a href="${ pageContext.request.contextPath }/product_findByCsid.action?csid=${cs.csid }&page=1">${cs.csname }</a><span>选购</span></li>
                        </c:forEach>
                         </ul>
                 </div>
             </li>
             </c:forEach>
         </ul>
         <div id="big_banner_pic_wrap">
             <ul id="big_banner_pic">
             	<li><img src="${pageContext.request.contextPath}/img/mi/007.JPG"></li>
                 <li><img src="${pageContext.request.contextPath}/img/mi/008.JPG"></li>
                 <li><img src="${pageContext.request.contextPath}/img/mi/009.JPG"></li>
              </ul>
         </div>
         <div id="big_banner_change_wrap">
             <div id="big_banner_change_prev"> &lt;</div>
             <div id="big_banner_change_next">&gt;</div>
         </div>
     </div>
     <div id="head_other_wrap">
         <div id="head_other">
             <ul>
                 <li>
                     <div id="div1">
                         <p>START</p>
                         <p>开房购买</p>
                     </div>
                 </li>
                 <li>
                     <div id="div2">
                         <p>GROUND</p>
                         <p>企业团购</p>
                     </div>
                 </li>
                 <li>
                     <div id="div3">
                         <p>RETROFIT</p>
                         <p>官方产品</p>
                     </div>
                 </li>
                 <li>
                     <div id="div4">
                         <p>CHANNEL</p>
                         <p>F码通道</p>
                     </div>
                 </li>
                 <li>
                     <div id="div5">
                         <p>RECHARGE</p>
                         <p>话费充值</p>
                     </div>
                 </li>
                 <li>
                     <div id="div6">
                         <p>SECURITY</p>
                         <p>防伪检查</p>
                     </div>
                 </li>
             </ul>
         </div>
         <div class="head_other_ad"><img src="${pageContext.request.contextPath}/img/mi/T184E_BQWT1RXrhCrK.jpg"></div>
         <div class="head_other_ad"><img src="${pageContext.request.contextPath}/img/mi/T1yvd_BQDT1RXrhCrK.jpg"></div>
         <div class="head_other_ad"><img src="${pageContext.request.contextPath}/img/mi/T1mahQBmKT1RXrhCrK.jpg"></div>
    </div>
     <div id="head_hot_goods_wrap">
         <div id="head_hot_goods_title">
             <span class="title_span">最新商品</span>
             <div id="head_hot_goods_change">
                 <span id="head_hot_goods_prave"><</span>
                 <span id="head_hot_goods_next">></span>
             </div>
         </div>
         <div id="head_hot_goods_content">
             <ul>
                 <c:forEach items="${nList }" var="p">
				 <li>
					<a href="${ pageContext.request.contextPath }/product_findByPid.action?pid=${p.pid}"><img src="${pageContext.request.contextPath}/${p.image}" /></a>
					<a>${p.pname}</a>
                    <a>品牌：${p.brand}</a>
				</li>
                </c:forEach>
             </ul>
         </div>
     </div>
     <div id="main_show_box">
         <div id="floor_1">
              <div id="floor_head">
                  <span class="title_span">热门商品</span>
              </div>
         </div>
         <div class="floor_goods_wrap">
             <ul>
                 <li class="floor_goods_wrap_li">
                     <a><img src="${pageContext.request.contextPath}/img/mi/T1IhLjBC_T1RXrhCrK.jpg"></a>
                 </li>
				 <c:forEach items="${hList }" var="p">
				 <li class="floor_goods_wrap_li">
					<a class="floor_goods_img" href="${ pageContext.request.contextPath }/product_findByPid.action?pid=${p.pid}"><img src="${pageContext.request.contextPath}/${p.image}" ></a>
					<a class="floor_goods_tit">${p.pname}</a>
                     <a class="floor_goods_txt">品牌：${p.brand}</a>
                     <a class="floor_goods_price">现价：${p.shop_price}元</a>
				</li>
                </c:forEach>
                 <div style="clear:both;"></div>
             </ul>
         </div>
     </div>
     <div id="foot_box">
         <div id="foot_wrap">
             <div class="foot_top">
                 <ul>
                     <li>1小时快修服务</li>
                     <li class="font_top_i">|</li>
                     <li>7天无理由退货</li>
                     <li class="font_top_i">|</li>
                     <li>15天免费换货</li>
                     <li class="font_top_i">|</li>
                     <li>满150元包邮</li>
                     <li class="font_top_i">|</li>
                     <li>520余家售后网点</li>
                 </ul>
             </div>
             <div class="foot_bottom">
                 <div class="foot_bottom_l">
                     <dl>
                         <dt>帮助中心</dt>
                         <dd>购物指南</dd>
                         <dd>支付方式</dd>
                         <dd>配送方式</dd>
                     </dl>
                     <dl>
                         <dt>服务支持</dt>
                         <dd>售后政策</dd>
                         <dd>自助服务</dd>
                         <dd>相关下载</dd>
                     </dl>
                     <dl>
                         <dt>大米之家</dt>
                         <dd>大米之家</dd>
                         <dd>服务网点</dd>
                         <dd>预约亲临到店服务</dd>
                     </dl>
                     <dl>
                         <dt>关注我们</dt>
                         <dd>新浪微博</dd>
                         <dd>大米部落</dd>
                         <dd>官方微信</dd>
                     </dl>
                 </div>
                 <div class="foot_bottom_r">
                     <a>400-100-5678</a>
                     <a>周一至周日 8:00-18:00</a>
                     <a>（仅收市话费）</a>
                     <span> 24小时在线客服</span>
                 </div>
             </div>
         </div>
         <div class="foot_note_box">
             <div class="foot_note_wrap">
                 <div class="foot_note_con">
                     <span class="foot_logo"><img src="${pageContext.request.contextPath}/img/mi/mi-logo.png" width="38px" height="38px"></span>
						<span class="foot_note_txt">
							<a>大米网</a><h>|</h><a>MIUI</a><h>|</h><a>米聊</a><h>|</h><a>多看书城</a><h>|</h><a>大米路由器</a><h>|</h><a>大米后院</a><h>|</h><a>大米天猫店</a><h>|</h><a>大米淘宝直营店</a><h>|</h><a>大米网盟</a><h>|</h><a>问题反馈</a><h>|</h><a>Select Region</a>
						    <a> 5555555号</a>
						</span>
                 </div>

             </div>
         </div>
     </div>

<script type="text/javascript" src="js/xiaomi.js"></script>

</body>
</html>