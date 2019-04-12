<%-- 
    Document   : editproduct
    Created on : Dec 16, 2018, 8:57:31 AM
    Author     : benfi
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8">
        <title>Đăng ký</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" href="img/favicon (1).ico" type="image/x-icon" />	
        <link href="eCommerceAssets/styles/header.css" rel="stylesheet" type="text/css">	
        <link href="eCommerceAssets/styles/layout.css" rel="stylesheet" type="text/css">
        <link href="eCommerceAssets/styles/footer.css" rel="stylesheet" type="text/css">
        <link href="eCommerceAssets/styles/edituser.css" rel="stylesheet" type="text/css">	
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!--<script src="js/thien.js" type="text/javascript"></script>-->
        <script src="js/validatejs.js" type="text/javascript"></script>
    </head>

    <body class="bg">

        <div id="mainWrapper">
            <button onclick="topFunction()" id="button-to-top" title="Click to top"><i class="fa fa-chevron-up"></i>
            </button>

            <div class="register animate-bottom-offer">
                <p class="center" style="padding-top: 50px;"><a href="index.jsp">Trang chủ</a> /  Đăng ký</p>
                <center>
                    <h1>Edit Product </h1>
                    <p style="font-size: 20px">Change product details here.</p>
                </center>
                <div class="wrap-register">
                    <div class="right-detail">


                        <center>
                            <h2 style="width: 30%">Product Details</h2>
                            <div id="outputFailed" class="center"><s:actionerror/></div>
                            <div class="center"><s:actionmessage theme="simple" cssStyle="color: green;font-size: 20px;"/></div>

                            <div id="outputBlank"></div>
                            <!--onSubmit="validateRes(document.registration,event);"-->
                            <s:form action="UpdateProductInfoAction">

                                <div style="display: flex">
                                    <div style="width: 50%">

                                        Product ID: <s:textfield name="productID"  theme="simple" placeholder="Product ID:" cssClass="textFieldChangePass"
                                                     value="%{#request.PRODUCTTOEDIT.productID}" readonly="true"/>
                                        <div id="outputName"></div>
                                        <s:fielderror fieldName="productID" cssStyle="text-align: left; color:red;"/>

                                        Product Name: <s:textfield name="productName"  theme="simple" placeholder="Product Name:" cssClass="textFieldChangePass"
                                                     value="%{#request.PRODUCTTOEDIT.productName}"/>
                                        <div id="outputLastName"></div>    
                                        <s:fielderror fieldName="productName" cssStyle="text-align: left; color:red;"/>

                                        Description:  <s:textfield name="description"  theme="simple" placeholder="Description:" cssClass="textFieldChangePass"  
                                                     value="%{#request.PRODUCTTOEDIT.description}"/>
                                        <div id="outputEmail"></div>
                                        <s:fielderror fieldName="description" cssStyle="text-align: left; color:red;"/>

                                        Price Sell:  <s:textfield name="priceSell"  theme="simple" placeholder="Price Sell:" cssClass="textFieldChangePass"
                                                     value="%{#request.PRODUCTTOEDIT.priceSell}" type="number" />
                                        <div id="outputUsername"></div>
                                        <s:fielderror fieldName="priceSell" cssStyle="text-align: left; color:red;"/>

                                        <div class="center" style="margin:0 23% 0 23%">

                                        </div>
                                    </div>
                                    <div style="width: 50%">

                                        Price In:  <s:textfield name="priceIn"  theme="simple" placeholder="Price In:" cssClass="textFieldChangePass"
                                                     value="%{#request.PRODUCTTOEDIT.priceIn}" type="number"/>
                                        <div id="outputCity"><s:fielderror fieldName="priceIn" cssStyle="text-align: left; color:red;"/></div>    

                                        Quantity: <s:textfield name="quantity"  theme="simple" placeholder="Quantity:" cssClass="textFieldChangePass" 
                                                     value="%{#request.PRODUCTTOEDIT.quantity}" type="number"/>
                                        <div id="outputPhone"><s:fielderror fieldName="quantity" theme="simple" cssStyle="text-align: left; color:red;"/></div>

                                        Price Sale:<s:textfield name="priceSale"  theme="simple" placeholder="Price Sale:" cssClass="textFieldChangePass"
                                                     value="%{#request.PRODUCTTOEDIT.priceSale}" type="number"/>
                                        <div id="outputAddress"><s:fielderror fieldName="priceSale" cssStyle="text-align: left; color:red;"/></div>

                                        <div style="display: flex;margin-top: 2%">
                                            <div style="float: left;margin: 2% 10% 2% 10%;">
                                                IsNew:
                                                <s:select list="list" headerKey="0" theme="simple" name="isNew" value="%{#request.PRODUCTTOEDIT.isNew}" cssStyle="font-size: 17px;"/>
                                            </div>
                                            <div style="float: left;margin: 2% 10% 2% 10%;">
                                                IsBest:
                                                <s:select list="list" headerKey="0" theme="simple" name="isBest" value="%{#request.PRODUCTTOEDIT.isBest}" cssStyle="font-size: 17px;"/>
                                            </div>
                                            <div style="float: left;margin: 2% 10% 2% 10%;">
                                                IsSale:
                                                <s:select list="list" headerKey="0" theme="simple" name="isSale" value="%{#request.PRODUCTTOEDIT.isSale}" cssStyle="font-size: 17px;"/>
                                            </div>


                                        </div>
                                        <p style="font-size: 17px" class="center">Category:<p>
                                            <s:select list="listCate"  headerKey="0" theme="simple" name="selectedCate" value="selectedCate" cssStyle="font-size: 17px; height: 32px;" />

                                    </div>
                                </div>
                                <s:hidden name="keyPro" value="%{#request.keyPro}"/>
                                <s:hidden name="lastSearchProductValue" value="%{#request.lastSearchProductValue}"/>
                                <s:submit value="Save Change" theme="simple" cssClass="button-form"  />
                            </s:form>
                        </center>


                    </div>

                </div>


            </div>


        </div>
        <script src="js/scrolls-thien.js" type="text/javascript"></script>		

    </body>
</html>
