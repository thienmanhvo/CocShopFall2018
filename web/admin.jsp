<%-- 
    Document   : admin
    Created on : Dec 12, 2018, 11:41:42 PM
    Author     : benfi
--%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <s:if test="%{#session.ROLE.equals('admin')}">
        <s:if test="%{searchUserTypeList == null}">
            <s:action executeResult="true" name="AccessAdminAction" namespace="/"/>
        </s:if>
        <s:else>
            <head>
                <meta charset="utf-8">
                <title>Login</title>
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <link rel="icon" href="img/favicon (1).ico" type="image/x-icon" />		
                <link href="eCommerceAssets/styles/layout.css" rel="stylesheet" type="text/css">
                <link href="eCommerceAssets/styles/admin.css" rel="stylesheet" type="text/css">	
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
                <!--<script src="js/thien.js" type="text/javascript"></script>-->
                <script src="js/validatejs.js" type="text/javascript"></script>

            </head>

            <body class="bg">
                <div id="mainWrapper" style="margin-top: 50px">
                    <button onclick="topFunction()" id="button-to-top" title="Click to top"><i class="fa fa-chevron-up"></i>
                    </button>




                    <div id="admin" class="animate-bottom-offer">
                        <div class="wrap-form" style="padding-bottom: 100px">	
                            <center>
                                <div>
                                    <h2 style="width: 30%">Wellcome Admin <s:property value="%{#session.USERLOGIN}"/>!</h2>
                                    <div style="font-size: 30px">
                                        <a class="click" href="/CocShop/AccessInsertProduct.action">Click here to insert new Product</a>
                                    </div>
                                    <br/>

                                    <s:url id="myaccount" action="AccessUpdateAction">
                                        <s:param name="email" value="%{#session.USERLOGIN}" />
                                    </s:url>
                                    <s:a href="%{myaccount}" cssClass="click" cssStyle="font-size: 20px">Click here to change your account information</s:a>
                                        <br/>
                                        <div  style="padding: 20px 0px 20px 0px">
                                            <a href="/CocShop/LogoutAction.action" class="click">Log Out</a>
                                        </div>
                                    </div>
                                </center>  
                                <div style="width: 100%">
                                    <div class="userLeftContent">
                                        <h2 class="center">User management</h2>
                                    <s:if test="%{listSearchUser !=null}">
                                        <s:if test="%{listSearchUser.size()==0}">
                                            <div  style="color: red;text-align: center">
                                                <h2>Nothing Found!</h2> 
                                            </div>
                                        </s:if>

                                    </s:if>
                                    <!--in thong bao thanh cong hay that bai-->
                                    <div style="color: red;text-align: center"> 
                                        <h2><s:property value="%{#session.ERROR}"/></h2>
                                    </div>
                                    <div style="color: green;text-align: center">
                                        <h2><s:property value="%{#session.SUCCESS}"/></h2>
                                    </div>
                                    <!--noi dung chinh-->
                                    <div style="margin: 0 25% 0 25%;width: 50%">
                                        <s:form action="SearchUserAction" theme="simple">
                                            <div style="margin: 0 10% 0 10%;">
                                                <h3>Select Type to Search: </h3>
                                                <s:select label="Select Type to Search" 
                                                          headerKey="-1" headerValue="Select Type to Search"
                                                          list="searchUserTypeList" name="selectedSearchUserType" 
                                                          value="selectedSearchUserType" theme="simple" cssStyle="height: 30px"/>
                                            </div>
                                            <br/>
                                            <div style="margin: 0 10% 0 10%;">
                                                <s:textfield theme="simple" placeholder="Search" cssStyle="    margin-bottom: 20px;
                                                             height: 30px;
                                                             width: 100%;
                                                             font-size: 15px;padding-left: 5px" name="userSearch"/>
                                                <h3 style="color: red"><s:property  value="%{#request.SEARCHINVALID}"/></h3>

                                            </div>
                                            <div style="float: left;margin-left: 10%;padding-bottom: 30px"><s:submit value="Submit" cssClass="button-form" theme="simple"/></div>

                                        </s:form>
                                    </div>
                                    <div style="padding-bottom: 50px">
                                        <s:if test="%{listSearchUser !=null}">
                                            <s:if test="%{listSearchUser.size()>0}">
                                                <table border="1" style="padding-bottom: 50px;width: 100%" id="t01">
                                                    <thead>
                                                        <tr>
                                                            <th>No</th>
                                                            <th>Email</th>
                                                            <th>Username</th>
                                                            <th>Lastname</th>
                                                            <th>Firstname</th>
                                                            <th>Role</th>
                                                            <th>Telephone</th>
                                                            <th>Address</th>
                                                            <th>City</th>
                                                            <th>Delete</th>
                                                            <th>Update</th>
                                                        </tr>
                                                    </thead>
                                                    <s:iterator value="listSearchUser" status="counter">
                                                        <tbody>
                                                            <tr>
                                                                <td><s:property value="%{#counter.count}"/></td>
                                                                <td><s:property value="email"/></td>
                                                                <td><s:property value="username"/></td>
                                                                <td><s:property value="lastname"/></td>
                                                                <td><s:property value="firstname"/></td>
                                                                <td><s:property value="role"/></td>
                                                                <td><s:property value="telephone"/></td>
                                                                <td><s:property value="address"/></td>
                                                                <td><s:property value="city"/></td>
                                                                <td>
                                                                    <s:url id="DeleteLink" action="DeleteUserAction" >
                                                                        <s:param name="findWhat" value="%{selectedSearchUserType}" />
                                                                        <s:param name="key" value="%{email}"/>
                                                                        <s:param name="lastSearchUserValue" value="%{userSearch}" />
                                                                    </s:url>
                                                                    <s:a href="%{DeleteLink}" onclick="confirmBox(event);" them="simple" cssClass="delete">Delete</s:a>
                                                                    </td>
                                                                    <td>
                                                                    <s:form action="EditUserAction" theme="simple">
                                                                        <s:hidden name="findWhat" value="%{selectedSearchUserType}" />
                                                                        <s:hidden name="key" value="%{email}"/>
                                                                        <s:hidden name="lastSearchUserValue" value="%{userSearch}"/>
                                                                        <s:submit value="Edit" cssStyle="width:100%" theme="simple"/>
                                                                    </s:form>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </s:iterator>
                                                </table>
                                            </s:if>
                                        </s:if>
                                    </div>
                                </div>
                                <s:if test="%{listSearchProduct !=null}">
                                    <s:if test="%{listSearchProduct.size()==0}">
                                        <div  style="color: red;text-align: center">
                                            <h2>Nothing Found!</h2> 
                                        </div>
                                    </s:if>

                                </s:if>
                                <div class="productRightContent" style="margin-top: 100px">
                                    <h3 class="center">Product management</h3>
                                    <!--in thong bao thanh cong hay that bai-->
                                    <div style="color: red;text-align: center"> 
                                        <h2><s:property value="%{#session.ERRORPRO}"/></h2>
                                    </div>
                                    <div style="color: green;text-align: center">
                                        <h2><s:property value="%{#session.SUCCESSPRO}"/></h2>
                                    </div>

                                    <!--noi dung chinh-->
                                    <div style="margin: 0 25% 0 25%;width: 50%">

                                        <!--form search-->
                                        <s:form action="SearchProductActionByAdmin" theme="simple">
                                            <div style="margin: 0 10% 0 10%;">
                                                <h3>Search By Name or ID: </h3>
                                            </div>
                                            <br/>
                                            <div style="margin: 0 10% 0 10%;">
                                                <s:textfield theme="simple" placeholder="Search" cssStyle="    margin-bottom: 20px;
                                                             height: 30px;
                                                             width: 100%;
                                                             font-size: 15px;padding-left: 5px" name="productSearch"/>
                                                <h3 style="color: red"><s:property  value="%{#request.SEARCHPROINVALID}"/></h3>

                                            </div>
                                            <div style="float: left;margin-left: 10%;padding-bottom: 30px">
                                                <s:submit value="Submit" cssClass="button-form" theme="simple"/>
                                            </div>

                                        </s:form>
                                    </div>

                                    <div style="padding-bottom: 50px">
                                        <s:if test="%{listSearchProduct !=null}">
                                            <s:if test="%{listSearchProduct.size()>0}">
                                                <table border="1" style="padding-bottom: 50px;width: 100%" id="t02">
                                                    <thead>
                                                        <tr>
                                                            <th>No</th>
                                                            <th>ProductID</th>
                                                            <th>ProductName</th>
                                                            <th>Quantity</th>
                                                            <th>PriceSell</th>
                                                            <th>PriceSale</th>
                                                            <th>PriceIn</th>
                                                            <th>Description</th>
                                                            <th>isSale</th>
                                                            <th>isBest</th>
                                                            <th>isNew</th>
                                                            <th>Cate_ID</th>
                                                            <th>Delete</th>
                                                            <th>Edit</th>
                                                        </tr>
                                                    </thead>
                                                    <s:iterator value="listSearchProduct" status="counter">
                                                        <tbody>
                                                            <tr>
                                                                <td><s:property value="%{#counter.count}"/></td>
                                                                <td><s:property value="productID"/></td>
                                                                <td><s:property value="productName"/></td>
                                                                <td><s:property value="quantity"/></td>
                                                                <td><s:property value="priceSell"/></td>
                                                                <td><s:property value="priceSale"/></td>
                                                                <td><s:property value="priceIn"/></td>
                                                                <td><s:property value="description"/></td>
                                                                <td><s:property value="isSale"/></td>
                                                                <td><s:property value="isBest"/></td>
                                                                <td><s:property value="isNew"/></td>
                                                                <td><s:property value="cate_ID"/></td>

                                                                <td>
                                                                    <s:url id="DeleteLinkProduct" action="DeleteProductAction" >      
                                                                        <s:param name="keyPro" value="%{productID}"/>
                                                                        <s:param name="lastSearchProductValue" value="%{productSearch}" />
                                                                    </s:url>
                                                                    <s:a href="%{DeleteLinkProduct}" onclick="confirmBox(event);" them="simple" cssClass="delete">Delete</s:a>
                                                                    </td>
                                                                    <td>
                                                                    <s:form action="EditProdctAction" theme="simple">
                                                                        <s:hidden name="keyPro" value="%{productID}"/>
                                                                        <s:hidden name="lastSearchProductValue" value="%{productSearch}"/>
                                                                        <s:submit value="Edit" cssStyle="width:100%" theme="simple"/>
                                                                    </s:form>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </s:iterator>
                                                </table>
                                            </s:if>
                                        </s:if>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>


                </div>
                <script src="js/scrolls-thien.js" type="text/javascript"></script>		
            </body>
        </s:else>
    </s:if>
    <s:else>
        <s:action executeResult="true" name="AccessAdminAction" namespace="/"/>
    </s:else>
</html>
