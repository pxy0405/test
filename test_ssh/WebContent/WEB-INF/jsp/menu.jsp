<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="https://cdn.goeasy.io/goeasy.js"></script>
<script type="text/javascript">
	var goEasy = new GoEasy({
	    appkey: 'bac4091d-b42f-495f-8c83-bcd877758047',
	
	     });
	
	 goEasy.subscribe({
         channel: 'Sakura_first',
         onMessage: function(message){
             alert('收到：'+message.content); 
         }
     });
</script>
     <div class="head_box">
         <div id="head_wrap">
             <div id="head_nav">
                 <a class="head_nav_a" href="${sessionScope.loginUserName }/test_ssh/index.action">村艺茶具商城</a>
                 <span>|</span>
                 <a class="head_nav_a">MIUI</a>
                 <span>|</span>
                 <a class="head_nav_a">米聊</a>
                 <span>|</span>
                 <a class="head_nav_a">游戏</a>
                 <span>|</span>
                 <a class="head_nav_a">多看阅读</a>
                 <span>|</span>
                 <a class="head_nav_a">云服务</a>
                 <span>|</span>
                 <a class="head_nav_a">大米移动版</a>
                 <span>|</span>
                 <a class="head_nav_a">问题反馈</a>
                 <span>|</span>
                 <a class="head_nav_a" id="Select_Region_but">Select Region</a>
             </div>
             <div id="head_right">
                 <div id="head_landing">
                <c:set var="UserName" scope="session" value="${sessionScope.loginUserName }"/>
                 <c:choose>  
				    <c:when test="${empty UserName}">    <!--如果 --> 
					    <a class="head_nav_a" href="${pageContext.request.contextPath}/User_loginPage.action">登录</a>
	                     <span>|</span>
	                     <a class="head_nav_a"  href="${pageContext.request.contextPath}/User_registerPage.action">注册</a>
	                
				    </c:when>  
				      
				    <c:otherwise>  <!--否则 -->  
				    		${sessionScope.loginUserName }
                     <span>|</span>
                     <a class="head_nav_a" href="${pageContext.request.contextPath}/order_findByUid.action">我的订单</a>
	                     <span>|</span>
                     <a class="head_nav_a"  href="${pageContext.request.contextPath}/User_quit.action">退出</a>
					</c:otherwise>  
				 </c:choose>
                		
                 </div>
                 <div id="head_car">
                     <a class="head_car_text" href="${pageContext.request.contextPath}/cart_myCart.action">购物车（0）</a>
                     <div id="car_content" style="height: 0px;width:0px ;background-color: #edffc6;z-index: 999">
                         <a class="car_text"></a>
                     </div>
                 </div>
             </div>
         </div>
     </div>
     <div id="main_head_box">
         <div id="menu_wrap">
            <%--  <div id="menu_logo">
                 <img  src="${pageContext.request.contextPath}/img/mi/xiaomi_logo.png">
             </div> --%>
             <div id="menu_nav">
                 <ul>
                 	<c:forEach var="c" items="${sessionScope.cList }">
		                	<li><a href="${ pageContext.request.contextPath }/product_findByCid.action?cid=${c.cid }&page=1">${c.cname }</a></li>
		              </c:forEach>
                 </ul>
             </div>
             <div id="find_wrap">
                 <div id="find_bar">
                     <input type="text" id="find_input">
                 </div>
                 <div id="find_but">GO</div>
             </div>
         </div>
     </div>
          <div id="menu_content_bg" style="height: 0px;">
         <div id="menu_content_wrap">
             <ul style="top: 0px;">
             </ul>
         </div>
     </div>