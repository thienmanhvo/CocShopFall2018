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
        <link href="eCommerceAssets/styles/register.css" rel="stylesheet" type="text/css">	
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!--<script src="js/thien.js" type="text/javascript"></script>-->
        <script src="js/validatejs.js" type="text/javascript"></script>
    </head>

    <body class="bg">
        <div id="mainWrapper">
            <button onclick="topFunction()" id="button-to-top" title="Click to top"><i class="fa fa-chevron-up"></i>
            </button>
            <%@include file="WEB-INF/top_nav.jsp"%>
            <div class="register animate-bottom-offer">
                <p class="center" style="padding-top: 50px;"><a href="demo1.3.html">Trang chủ</a> /  Đăng ký</p>
                <div class="wrap-register">
                    <center>
                        <h2 style="width: 30%">ĐĂNG KÝ THÔNG TIN TÀI KHOẢN</h2>
                        <div id="outputFailed"><s:actionerror/></div>
                        <h2 id="success"><s:actionmessage/></h2>
                        <div id="outputBlank"></div>
                        <!--onSubmit="validateRes(document.registration,event);"-->
                        <s:form action="RegistrationAction" name="registration">
                            <s:textfield name="lastname" label="lastname" theme="simple" placeholder="Họ:" id="ho"/>
                            <div id="outputLastName"><s:fielderror fieldName="lastname"/></div>    
                            <s:textfield name="firstname" label="firstname" theme="simple" placeholder="Tên:" id="ten"/>
                            <div id="outputName"><s:fielderror fieldName="firstname"/></div>

                            <s:textfield name="email" label="email" theme="simple" placeholder="Email:" id="email"/>
                            <div id="outputEmail"><s:fielderror fieldName="email"/></div>

                            <s:password name="password" label="password" theme="simple" placeholder="Mật khẩu:" id="matkhau"/>
                            <div id="outputPass"><s:fielderror fieldName="password"/></div>

                            <s:password name="passwordRe" label="passwordRe" theme="simple" placeholder="Nhập lại mật khẩu:" id="matkhauRe"/>
                            <div id="outputPassRe"><s:fielderror fieldName="passwordRe"/></div>

                            <s:submit value="ĐĂNG KÝ" theme="simple" cssClass="button-form" />
                        </s:form>
                    </center>
                </div>


            </div>



            <footer class="animate-bottom-footer"> 
                <!-- This is the footer with default 3 divs -->
                <div>
                    <p class="font"><i class="fa fa-map-marker"></i>: KP1, 48A Dương Thị Mười, Tân Hưng Thuận, Quận 12, Hồ Chí Minh</p>
                </div>
                <div>
                    <p class="font">&nbsp;<i class="fa fa-mobile-phone"></i>: 016 335 77 999 (Giao hàng toàn quốc)
                    </p>
                    <p><i class="fa fa-envelope"></i>: benficacronaldo@gmail.com</p>
                </div>
                <div class="footerlinks">
                    <p class="font"><a href="https://www.facebook.com/thiennb1643216" title="Facebook" target="new"><i class="fa fa-facebook"></i>&nbsp;&nbsp;Facebook&nbsp;&nbsp;</a></p>

                    <p class="font"><a href="https://twitter.com/thienmanhvo" title="Twitter" target="new"><i class="fa fa-twitter"></i>&nbsp;&nbsp;Twitter&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></p>
                    <p class="font"><a href="https://www.instagram.com/tne68616e/" title="Instagram" target="new"><i class="fa fa-instagram"></i>&nbsp;&nbsp;Instagram&nbsp;</a></p>
                </div>

                <p style="color: white"> Copyright &copy; 2018-2018 Luona Communications Inc. All rights reserve</p>
            </footer>

        </div>










        <script src="js/scrolls-thien.js" type="text/javascript"></script>		

    </body>
</html>
