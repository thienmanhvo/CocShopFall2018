<%-- 
    Document   : edituser
    Created on : Dec 16, 2018, 4:08:07 AM
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
                    <h1>Edit Acount </h1>
                    <p style="font-size: 20px">Change user personal details here.</p>
                </center>
                <div class="wrap-register">
                    <div class="right-detail">


                        <center>
                            <h2 style="width: 30%">Personal Details</h2>
                            <div id="outputFailed"><s:actionerror/></div>
                            <div><s:actionmessage theme="simple" cssStyle="color: green;font-size: 20px;"/></div>

                            <div id="outputBlank"></div>
                            <!--onSubmit="validateRes(document.registration,event);"-->
                            <s:form action="UpdateUserInfoAction">

                                <div style="display: flex">
                                    <div style="width: 50%">

                                        <s:textfield name="firstname"  theme="simple" placeholder="First Name" cssClass="textFieldChangePass"
                                                     value="%{#request.USERTOEDIT.firstname}"/>
                                        <div id="outputName"></div>
                                        <s:fielderror fieldName="firstname" cssStyle="text-align: left; color:red;"/>

                                        <s:textfield name="lastname"  theme="simple" placeholder="Last Name" cssClass="textFieldChangePass"
                                                     value="%{#request.USERTOEDIT.lastname}"/>
                                        <div id="outputLastName"></div>    
                                        <s:fielderror fieldName="lastname" cssStyle="text-align: left; color:red;"/>

                                        <s:textfield name="email"  theme="simple" placeholder="Email:" cssClass="textFieldChangePass" readonly="true" 
                                                     value="%{#request.USERTOEDIT.email}"/>
                                        <div id="outputEmail"></div>
                                        <s:fielderror fieldName="email" cssStyle="text-align: left; color:red;"/>

                                        <s:textfield name="username"  theme="simple" placeholder="Username:" cssClass="textFieldChangePass"
                                                     value="%{#request.USERTOEDIT.username}" />
                                        <div id="outputUsername"></div>
                                        <s:fielderror fieldName="username" cssStyle="text-align: left; color:red;"/>
                                    </div>
                                    <div style="width: 50%">

                                        <s:textfield name="city"  theme="simple" placeholder="City:" cssClass="textFieldChangePass"
                                                     value="%{#request.USERTOEDIT.city}"/>
                                        <div id="outputCity"><s:fielderror fieldName="city" cssStyle="text-align: left; color:red;"/></div>    

                                        <s:textfield name="phone"  theme="simple" placeholder="Phone:" cssClass="textFieldChangePass" 
                                                     value="%{#request.USERTOEDIT.telephone}"/>
                                        <div id="outputPhone"><s:fielderror fieldName="phone" theme="simple" cssStyle="text-align: left; color:red;"/></div>

                                        <s:textfield name="address"  theme="simple" placeholder="Address:" cssClass="textFieldChangePass"
                                                     value="%{#request.USERTOEDIT.address}"/>
                                        <div id="outputAddress"><s:fielderror fieldName="address" cssStyle="text-align: left; color:red;"/></div>


                                    </div>
                                </div>
                                <s:hidden name="findWhat" value="%{#request.findWhat}" />
                                <s:hidden name="key" value="%{#request.key}"/>
                                <s:hidden name="lastSearchUserValue" value="%{#request.lastSearchUserValue}"/>
                                <s:submit value="Save Change" theme="simple" cssClass="button-form" />
                            </s:form>
                        </center>


                    </div>

                </div>


            </div>


        </div>
        <script src="js/scrolls-thien.js" type="text/javascript"></script>		

    </body>
</html>
