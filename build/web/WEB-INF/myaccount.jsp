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
        <title>Đăng ký</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" href="img/favicon (1).ico" type="image/x-icon" />	
        <link href="eCommerceAssets/styles/header.css" rel="stylesheet" type="text/css">	
        <link href="eCommerceAssets/styles/layout.css" rel="stylesheet" type="text/css">
        <link href="eCommerceAssets/styles/footer.css" rel="stylesheet" type="text/css">
        <link href="eCommerceAssets/styles/myaccount.css" rel="stylesheet" type="text/css">	
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!--<script src="js/thien.js" type="text/javascript"></script>-->
        <script src="js/validatejs.js" type="text/javascript"></script>
    </head>

    <body class="bg">
        <s:if test="%{#session.USERLOGIN == null}">
            <s:action name="AccessUpdateAction" executeResult="true" namespace="/"/>
        </s:if>
        <s:else>


            <div id="mainWrapper">
                <button onclick="topFunction()" id="button-to-top" title="Click to top"><i class="fa fa-chevron-up"></i>
                </button>
                <s:if test="%{!#session.ROLE.equals('admin')}">
                    <%@include file="top_nav.jsp"%>
                </s:if>


                <div class="register animate-bottom-offer">
                    <p class="center" style="padding-top: 50px;"><a href="index.jsp">Trang chủ</a> /  Đăng ký</p>
                    <center>
                        <h1>My Acount </h1>
                        <p style="font-size: 20px">Change your personal details or your password here.</p>
                    </center>
                    <div class="wrap-register">
                        <div class="left-detail">
                            <center>
                                <h2>Change Password</h2>
                                <div style="color: green;font-size: 20px;"> <s:property value="%{#request.SUCCESS}"/></div>

                                <s:form action="ChangePasswordAction">
                                    <s:hidden name="email" value="%{#session.USERLOGIN}"/>
                                    <s:password name="password" theme="simple" placeholder="Old Password:" cssClass="textFieldChangePass"/>
                                    <div id="outputPass"></div>   
                                    <s:fielderror fieldName="password" cssStyle="text-align: left; color:red;"/>
                                    <s:password name="newPassword" theme="simple" placeholder="New Password" cssClass="textFieldChangePass"/>
                                    <div id="outputNewPass"></div>   
                                    <s:fielderror fieldName="newPassword" cssStyle="text-align: left; color:red;"/>
                                    <s:password name="newPasswordRe" theme="simple" placeholder="Retype New Password" cssClass="textFieldChangePass"/>
                                    <div id="outputPassRe"></div>   
                                    <s:fielderror fieldName="newPasswordRe" cssStyle="text-align: left; color:red;"/>
                                    <s:submit value="Save New Password" theme="simple" cssClass="button-change-pass"/>
                                </s:form>
                            </center>
                        </div>
                        <div class="right-detail">


                            <center>
                                <h2 style="width: 30%">Personal Details</h2>
                                <div id="outputFailed"><s:actionerror/></div>
                                <div><s:actionmessage theme="simple" cssStyle="color: green;font-size: 20px;"/></div>

                                <div id="outputBlank"></div>
                                <!--onSubmit="validateRes(document.registration,event);"-->
                                <s:form action="ChangeInfoAction">
                                    <div style="display: flex">
                                        <div style="width: 50%">

                                            <s:textfield name="firstname"  theme="simple" placeholder="First Name" cssClass="textFieldChangePass"
                                                         value="%{#session.USER.firstname}"/>
                                            <div id="outputName"></div>
                                            <s:fielderror fieldName="firstname" cssStyle="text-align: left; color:red;"/>

                                            <s:textfield name="lastname"  theme="simple" placeholder="Last Name" cssClass="textFieldChangePass"
                                                         value="%{#session.USER.lastname}"/>
                                            <div id="outputLastName"></div>    
                                            <s:fielderror fieldName="lastname" cssStyle="text-align: left; color:red;"/>

                                            <s:textfield name="email"  theme="simple" placeholder="Email:" cssClass="textFieldChangePass" readonly="true" 
                                                         value="%{#session.USER.email}"/>
                                            <div id="outputEmail"></div>
                                            <s:fielderror fieldName="email" cssStyle="text-align: left; color:red;"/>

                                            <s:textfield name="username"  theme="simple" placeholder="Username:" cssClass="textFieldChangePass"
                                                         value="%{#session.USER.username}" />
                                            <div id="outputUsername"></div>
                                            <s:fielderror fieldName="username" cssStyle="text-align: left; color:red;"/>
                                        </div>
                                        <div style="width: 50%">

                                            <s:textfield name="city"  theme="simple" placeholder="City:" cssClass="textFieldChangePass"
                                                         value="%{#session.USER.city}"/>
                                            <div id="outputCity"><s:fielderror fieldName="city" cssStyle="text-align: left; color:red;"/></div>    

                                            <s:textfield name="phone"  theme="simple" placeholder="Phone:" cssClass="textFieldChangePass" 
                                                         value="%{#session.USER.telephone}"/>
                                            <div id="outputPhone"><s:fielderror fieldName="phone" theme="simple" cssStyle="text-align: left; color:red;"/></div>

                                            <s:textfield name="address"  theme="simple" placeholder="Address:" cssClass="textFieldChangePass"
                                                         value="%{#session.USER.address}"/>
                                            <div id="outputAddress"><s:fielderror fieldName="address" cssStyle="text-align: left; color:red;"/></div>

                                        </div>
                                    </div>


                                    <s:submit value="Save Change" theme="simple" cssClass="button-form" />
                                </s:form>
                            </center>


                        </div>

                    </div>


                </div>
                <s:if test="%{!#session.ROLE.equals('admin')}">
                    <%@include file="footer.jsp" %>
                </s:if>
            </div>
        </s:else>
        <script src="js/scrolls-thien.js" type="text/javascript"></script>		

    </body>
</html>
