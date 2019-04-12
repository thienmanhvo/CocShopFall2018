
<%-- 
    Document   : top_nav
    Created on : Dec 12, 2018, 8:55:39 PM
    Author     : benfi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<nav class="header">
    <!-- This is the header content. It contains Logo and links -->

    <a id="logo" class="animate-top-logo" href="index.jsp"> <img src="img/thien4.png" alt="sample logo" height="100px" width= "260px">
        <!-- Company Logo text --> 
    </a>

    <div id="headerLinks" class="animate-top">
        <div class="headheader">
            <div style="padding-top: 4px;display: flex">
                <s:if test="%{#session.USERLOGIN !=null}">
                    <div>
                        <s:url id="myaccount" action="AccessUpdateAction">
                            <s:param name="email" value="%{#session.USERLOGIN}" />
                        </s:url>
                        <s:a href="%{myaccount}">Hello <s:property value="%{#session.USERLOGIN}"/></s:a>
                            /
                        <s:url id="logout" action="LogoutAction" >

                        </s:url>
                        <s:a href="%{logout}">Log Out</s:a>
                            <!--<a href="login.jsp" target="_self" title="Logout">Log Out</a>-->
                            /
                        </div>
                </s:if>
                <s:else>
                    <div style="width: 37px"><a href="login.jsp" target="_self" title="Login" data_temp_dwid="1">Login</a></div>&nbsp/&nbsp
                    <div style="width: 60px"><a href="register.jsp" title="Register" data_temp_dwid="2">Register</a></div>       
                </s:else>
                <div style="width: 37px">
                    <s:url id="viewCart" action="ViewCartAction" >

                    </s:url>
                    <s:a href="%{viewCart}" title="Cart"><i class="fa fa-cart-plus"></i></s:a>
                    </div>
                    <!--<div style="width: 37px"><a href="" title="Cart" data_temp_dwid="3"><i class="fa fa-cart-plus"></i></a> </div>-->

                </div>	
                <div class="formhead">
                    <!--                <form  action="/action_page.php" >
                                        <button type="submit"><i class="fa fa-search"></i></button>
                                        <input type="text" placeholder="Search" >
                                    </form>-->
                <s:form action="SearchProductAction" theme="simple">
                    <s:submit type ="button" value="" theme="simple" cssClass="fa fa-search"></s:submit>
                    <s:textfield theme="simple" placeholder="Search" name="proDSearch"/>
                </s:form>
            </div>
            <div style="height: 20px;width: 100px;display: flex;justify-content:space-around;padding-top: 3px">
                <div style="width: 20px"><a href="https://www.facebook.com/thiennb1643216" title="facebook" data_temp_dwid="4" style="border-right: solid 1px #000000"><i class="fa fa-facebook"></i></a> </div>

                <div style="width: 20px;border-left: #000000 solid 1px"><a href="https://www.instagram.com/tne68616e/" title="instagram" data_temp_dwid="5"><i class="fa fa-instagram"></i></a> </div>
                <div style="width: 20px;border-left: #000000 solid 1px"><a href="https://twitter.com/thienmanhvo" title="Twitter" data_temp_dwid="6"><i class="fa fa-twitter"></i></a> </div>
            </div>	
        </div>
        <div>
            <marquee behavior="alternate" direction="up" width="80%">
                <marquee direction="left" behavior="alternate"><p id="Ads"></p></marquee>
            </marquee>
        </div>
    </div>

</nav>
<div id="nav-top" class="animate-opacity-nav">

    <ul>
        <li class="li"><a class="active" href="index.jsp">TRANG CHỦ</a></li>
        <li class="dropdown li">
            <a href="demo1.3.html#footer-content" class="dropbtn">GUNDAM</a>
            <div class="dropdown-content">
                <a href="#">HG 1/144 (145)</a>
                <a href="#">RG 1/144 (22)</a>
                <a href="#">MG 1/100 (100)</a>
                <a href="#">BB - SD (19)</a>
                <a href="#">PG 1/60 (3)</a>
            </div>


        </li>
        <li class="li"><a href="#contact">FIGURE</a></li>
        <li class="li"><a href="#contact">MODELS</a></li>
        <!--			<li class="li"><a href="#contact">SOUL OF CHOGOKIN</a></li>-->
        <!--
                                <li style="width: 20%;margin-left: 15px">			
                                        <form id="form-in" action="/action_page.php" >
                                                        <input class="search-in" type="text" placeholder="Search" >
                                                        <button class="button-search-in" type="submit"><i class="fa fa-search"></i></button>		
                                        </form>
                                </li>
        -->
        <li class="li"><a href="#contact">PHỤ KIỆN</a></li>
        <li class="li"><a href="#contact">TIN TỨC</a></li>

        <li class="dropdown li ">
            <a href="demo1.3.html#content" target="_self" class="dropbtn">GIỚI THIỆU</a>
            <div class="dropdown-content">
                <a href="intro.jsp">Giới thiệu Shop</a>
                <a href="distinction.jsp">Phân biệt các dòng mô hình</a>
                <a href="commitment.jsp">Cam kết bán hàng</a>
                <a href="warranty.jsp">Chế độ bảo hành</a>
            </div>
        </li>
        <li class="li"><a href="#contact">LIÊN HỆ</a></li>

        <!--
                                  <div id="search-wrap">
                                        <form id="form-in" action="/action_page.php" >
                                                        <button class="button-search-in" type="submit"><i class="fa fa-search"></i></button>
                                                        <input class="search-in" type="text" placeholder="Search" >
                                        </form>
                                        </div>
        -->				

        <button title="Bật/Tắt hiệu ứng" id="hide-show-effect" name="hideshow" onMouseDown="hideAndShowEffect('bodya')"><i class="fa fa-toggle-on" id ="on"></i><i class="fa fa-toggle-off" id="off"></i></button>
        <div class="search-nav">
            <s:form action="SearchProductAction" theme="simple" id="form-in">
                <s:textfield theme="simple" placeholder="Search" name="proDSearch" cssClass="search-in"/>
                <s:submit type ="button" value="" theme="simple" cssClass="fa fa-search button-search-in" ></s:submit>          
            </s:form>
            <!--            <form id="form-in" action="/action_page.php" >
                            <input class="search-in" type="text" placeholder="Search" >
                            <button class="button-search-in" type="submit"><i class="fa fa-search"></i></button>		
                        </form>-->

        </div>
        <a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="showHideNav()" title="Hiện Menu"><i class="fa fa-bars"> MENU</i></a>
    </ul>


</div>