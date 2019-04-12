<%-- 
    Document   : myaccount
    Created on : Dec 13, 2018, 2:09:56 AM
    Author     : benfi
--%>

<!doctype html>

<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="utf-8">
        <title>Luona Shop</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" href="img/favicon (1).ico" type="image/x-icon" />	
        <link href="eCommerceAssets/styles/header.css" rel="stylesheet" type="text/css">	
        <link href="eCommerceAssets/styles/layout.css" rel="stylesheet" type="text/css">
        <link href="eCommerceAssets/styles/footer.css" rel="stylesheet" type="text/css">
        <link href="eCommerceAssets/styles/search.css" rel="stylesheet" type="text/css">
        <link href="eCommerceAssets/styles/content.css" rel="stylesheet" type="text/css">	
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!--        <script src="js/thien.js" type="text/javascript"></script>-->
        <script src="js/validatejs.js" type="text/javascript"></script>
        <script src="js/search.js" type="text/javascript"></script>
    </head>

    <body class="bg">
        <div id="mainWrapper">
            <button onclick="topFunction()" id="button-to-top" title="Click to top"><i class="fa fa-chevron-up"></i>
            </button>
            <%@include file="top_nav.jsp"%>
            <div class="search animate-bottom-offer">
                <p class="center" style="padding-top: 50px;"><a href="index.jsp">Trang chủ</a> /  Đăng ký</p>
                <center>
                    <h1>Search Page </h1>
                    <p style="font-size: 20px"></p>
                    <h2 style="color: green"><s:property value="%{#request.SUCCESS}"/></h2>
                </center>
                <s:if test="%{listPro!=null}">
                    <s:if test="%{listPro.size()>0}">
                        <%--<s:iterator value="listPro" status="counter"></s:iterator>--%>

                        <div class="wrap-search">

                            <div id="footer-content" class="animate-bottom-content" style="padding: 0% 10% 0% 10%; width: 80%!important">

                                <div class="display-footer-content">

                                    <div class="right-offer-fotter" style="width: 100%!important">
                                        <div class="top-product-right">
                                            <div class="top-product-wrap-footer center" style="
                                                 height: 40px;
                                                 padding-top: 0px!important;
                                                 padding-left: 20px;
                                                 margin-bottom: 0px;">
                                                <h4 class="top-product-fix" style="padding-top: 12px;text-align: center">SẢN PHẨM
                                                    <a><i class="onright fa fa-angle-right button-top" onclick="plusDivsSearch(1)" style="padding: 0 30px 0 30px" ></i></a>
                                                    <a><i class="onright fa fa-angle-left"  onclick="plusDivsSearch(-1)"></i> </a>			
                                                </h4>
                                            </div>
                                        </div>	
                                        <div id="content-product">
                                            <s:set var="countSearch" value="0"/>

                                            <s:iterator status="counter" begin="0" end="%{numOfPage-1}" var="i">
                                                <div class="slide-right-footer">

                                                    <s:iterator begin="0" end="1" var="j">
                                                        <div class="productRow"><!-- Each product row contains info of 3 elements -->
                                                            <s:if test="%{(listPro.size() - (#countSearch)) <3}">
                                                                <s:set var="count2" value="%{listPro.size() - #countSearch}"/>
                                                            </s:if>
                                                            <s:else>
                                                                <s:set var="count2" value="3"/>
                                                            </s:else>
                                                            <s:subset start="%{#countSearch}" count="#count2" source="listPro" >
                                                                <%--<s:property value="#countSearch"/>--%>

                                                                <s:iterator>

                                                                    <%--<s:property value="%{#count2}"/>--%>
                                                                    <%--<s:property value="%{#countSearch}"/>--%>

                                                                    <article class="productInfo">
                                                                        <s:set var="path" value ="%{listPro.get(#countSearch).getListImg().get(0).getPath()}"/>
                                                                        <!-- Each individual product description -->
                                                                        <%--<s:property value="#path"/>--%>
                                                                        <div class="image"><img class="box-shadow" alt="sample" src="<s:text name="#path"/>" height="250px" width="100%"></div>
                                                                        <p class="productContent"><s:property value="productName"/></p>
                                                                        <p class="price"><s:property value="priceSell"/>VNĐ</p>

                                                                        <p class="star-right-product"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></p>
<!--                                                                        <button class="middle-right-product"><i class="fa fa-cart-plus center"></i></button>-->
                                                                            <s:form action="AddProductToCartInSearch" theme="simple">
                                                                                <s:hidden value="%{listPro.get(#countSearch).productID}" name="idProD"/>
                                                                                <s:hidden value="%{proDSearch}" name="lastSearch"/>
                                                                                <s:submit type ="button" value=""  theme="simple" cssClass="fa fa-cart-plus center middle-right-product" title="Add to Cart"/>
                                                                            </s:form>
                                                                    </article>
                                                                    <s:set var="countSearch" value="%{(#countSearch)+1}"/>
                                                                </s:iterator>
                                                            </s:subset>
                                                        </div>
                                                    </s:iterator>

                                                </div>
                                            </s:iterator>
                                        </div>
                                    </div>		
                                </div>
                            </div>
                        </div>
                    </s:if>
                    <s:else>
                        <h2 class="center" style="color: red">No Record Found</h2>
                    </s:else>
                </s:if>

            </div>
            <%@include file="footer.jsp" %>

        </div>

        <script src="js/scrolls-thien.js" type="text/javascript"></script>		

    </body>
</html>
