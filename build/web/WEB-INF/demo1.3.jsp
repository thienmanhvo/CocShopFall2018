
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>LuonaShop</title>
        <link rel="icon" href="img/favicon (1).ico" type="image/x-icon" />	
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="eCommerceAssets/styles/offer.css" rel="stylesheet" type="text/css">	
        <link href="eCommerceAssets/styles/header.css" rel="stylesheet" type="text/css">	
        <link href="eCommerceAssets/styles/layout.css" rel="stylesheet" type="text/css">
        <link href="eCommerceAssets/styles/content.css" rel="stylesheet" type="text/css">
        <link href="eCommerceAssets/styles/footer.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="js/thien.js" type="text/javascript"></script>

    </head>
    <s:if test="%{#session.ROLE.equals('admin')}">
        <s:action executeResult="true" name="LoadProductAction" namespace="/"/>
    </s:if>
    <s:else>
        <body class="bg">
            <div id="mainWrapper">
                <button onclick="topFunction()" id="button-to-top" title="Click to top"><i class="fa fa-chevron-up "></i>
                </button>

                <%@include file="top_nav.jsp" %>


                <!--	<script src="js/scrolls-thien.js" type="text/javascript"></script>-->
                <div id="offer" class="animate-bottom">
                    <div class="display-item">
                        <div class="item-left">
                            <div class="top-product">
                                <div class="top-product-wrap">
                                    <h4 class="top-product-fix">BEST SELLER
                                        <a><i class="onright fa fa-angle-right button-top" onclick="plusDivsProduct(1)">  </i></a>
                                        <a><i class="onright fa fa-angle-left"  onclick="plusDivsProduct(-1)"></i> </a>			
                                    </h4>
                                </div>
                            </div>

                            <div class="intro-product">
                                <s:iterator value="%{listAllPro}"  status="counter">
                                    <s:if test="%{listAllPro.get(#counter.count-1).isBest == true}">
                                        <div class="slide">
                                            <s:set var="path" value="%{listAllPro.get(#counter.count-1).getListImg().get(0).getPath()}"/>
                                            <div class="product image">
                                                <img alt="sample" src="<s:text name="#path"/>" height="300px" width="100%"></div>
                                            <p class="productContent center"><s:property value="%{listAllPro.get(#counter.count-1).productName}"/> </p>

                                            <s:if test="%{listAllPro.get(#counter.count-1).isSale == true}">
                                                <p class="price center"><s:property value="%{listAllPro.get(#counter.count-1).priceSale}"/>VNĐ</p>
                                            </s:if>
                                            <s:else>
                                                <p class="price center"><s:property value="%{listAllPro.get(#counter.count-1).priceSell}"/>VNĐ</p>
                                            </s:else>
                                            <p class="center star"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></p>

                                            <!--<button class="middle"><i class="fa fa-cart-plus center"></i></button>-->
                                            <s:form action="AddProductToCartAction" theme="simple">
                                                <s:hidden value="%{listAllPro.get(#counter.count-1).productID}" name="idProD"/>
                                                <s:submit type ="button" value=""  theme="simple" cssClass="fa fa-cart-plus center middle" title="Add to Cart"/>
                                            </s:form>

                                        </div>
                                    </s:if>
                                </s:iterator>
                            </div>
                        </div>
                        <div class="right-offer">
                            <div id="myslideFrame">
                                <img class="mySlides animate-fading" src="img/maxresdefault (4).jpg" height="530px" width="100%"  >
                                <img class="mySlides animate-fading" src="img/5617089rg_unicorn_gundam__4.jpg" height="530px" width="100%">
                                <img class="mySlides animate-fading" src="img/Banner01_1.png" height="530px" width="100%">

                                <button class="left-right" style="position:absolute;margin-top:210px;left:0" onmousedown="plusDivs(-1);pauseCarousel();" onmouseup="startCarousel()"><i class="fa fa-angle-left"></i></button>

                                <button class="left-right" style="position:absolute;margin-top:210px;right:0" onmousedown="plusDivs(1);pauseCarousel();" onmouseup="startCarousel()"><i class="fa fa-angle-right"></i></button>

                                <div style="width:100%" class="offer-select">

                                    <span onmousedown="currentDiv(1);pauseCarousel();" class="offer-badge demo offer-border offer-transparent offer-hover-white" onmouseup="startCarousel()"></span>

                                    <span onmousedown="currentDiv(2);pauseCarousel();" class="offer-badge demo offer-border offer-transparent offer-hover-white" onmouseup="startCarousel()"></span>

                                    <span onmousedown="currentDiv(3);pauseCarousel();" class="offer-badge demo offer-border offer-transparent offer-hover-white" onmouseup="startCarousel()"></span>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div id="content" class="animate-bottom-offer">

                    <div class="item-left-content">

                        <div class="top-product-content">
                            <div class="top-product-wrap-content">
                                <h4 class="top-product-fix-content">GIẢM GIÁ ĐẶC BIỆT
                                    <a><i class="onright fa fa-angle-right button-top" onclick="plusDivsContent(1)">  </i></a>
                                    <a><i class="onright fa fa-angle-left"  onclick="plusDivsContent(-1)"></i> </a>			
                                </h4>
                            </div>
                        </div>

                        <div class="content-product">
                            <s:iterator value="%{listAllPro}"  status="counter">
                                <s:if test="%{listAllPro.get(#counter.count-1).isSale == true}">
                                    <div class="slideContent">
                                        <!--					<div class="sale"><b>SALE</b></div>-->

                                        <s:set var="path" value="%{listAllPro.get(#counter.count-1).getListImg().get(0).getPath()}"/>
                                        <div class="product image"><img alt="sample" src="<s:text name="#path"/>" height="300px" width="100%"></div>
                                        <p class="productContent center"><s:property value="%{listAllPro.get(#counter.count-1).productName}"/> </p>
                                        <p class="price center"><del><s:property value="%{listAllPro.get(#counter.count-1).priceSell}"/>VNĐ</del><br>
                                            <s:property value="%{listAllPro.get(#counter.count-1).priceSale}"/>VNĐ</p>
                                        <p class="center star"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-half-empty"></i></p>

                                        <s:form action="AddProductToCartAction" theme="simple">
                                            <s:hidden value="%{listAllPro.get(#counter.count-1).productID}" name="idProD"/>
                                            <s:submit type ="button" value=""  theme="simple" cssClass="fa fa-cart-plus center middle" title="Add to Cart"/>
                                        </s:form>
                                    </div>
                                </s:if>
                            </s:iterator>
                        </div>	
                    </div>
                    <div class="intro" >
                        <div class="innerIntro">
                            <div class="inner2">

                                <a class="leftintro animate-opacity" href="intro.html">
                                    Giới thiệu Công Ty 
                                </a>


                                <a class="leftintronear animate-zoom" href="distinction.html">
                                    Phân biệt các dòng Mô hình
                                </a>	


                                <div class="midintro"> <h3>Welcome to Luona ✦Gundam Store✦</h3> 
                                    <hr style="width: 20px;height: 3px">
                                    <p style="color: #fe9d0c ;font-size: 30px"><strong>Luona <br> ✦Gundam Store✦</strong></p>
                                    <p><strong>CHUYÊN CUNG CẤP CÁC DÒNG MODELS CAO CẤP</strong></p>				
                                </div>	


                                <a class="rightintronear animate-zoom" href="commitment.html">
                                    Cam kết bán hàng
                                </a>


                                <a class="rightintro animate-opacity" href="warranty.html">
                                    Chế độ bảo hành
                                </a>		  

                            </div>
                            <div class="footerIntro">
                                <div class="footerIntrop">
                                    <h4>QUÁ TRÌNH PHÁT TRIỂN</h4>
                                    <p>Ngày đầu thành lập chỉ với 1 nhân viên và nhiều khó khăn. Với tiêu chí vương lên là nhà cung cấp hàng đầu các mô hình cao cấp chúng tôi không ngùng học hỏi và hoàn thiện bản thân. Nhờ vào uy tính LuonaToys càng lúc càng khẳng định được thị phần tại Hồ Chí Minh.  </p>
                                </div>
                                <div class="footerIntroul">
                                    <h4>TRIẾT LÝ KINH DOANH CỦA CHÚNG TÔI</h4>
                                    <ul>
                                        <li>Procedures : ( Tư vấn chuyên nghiệp )</li>
                                        <li>ProService : ( Phục vụ chuyên nghiệp )</li>
                                        <li>ProProduct : (Sản phẩm chuyên nghiệp )</li>
                                        <li>ProWarranty: ( Bảo hành chuyên nghiệp)</li>


                                    </ul>


                                </div>


                            </div>
                        </div>
                    </div>

                </div>

                <div id="footer-content" class="animate-bottom-content">

                    <div class="display-footer-content">

                        <div class="item-left-footer">
                            <div class="top-product">
                                <div class="top-product-wrap-footer">
                                    <h4 class="top-product-fix">SẢN PHẨM MỚI
                                        <a><i class="onright fa fa-angle-right button-top" onclick="plusDivsFooter(1)">  </i></a>
                                        <a><i class="onright fa fa-angle-left"  onclick="plusDivsFooter(-1)"></i> </a>			
                                    </h4>
                                </div>
                            </div>

                            <div class="intro-product">
                                <s:iterator value="%{listAllPro}"  status="counter">
                                    <s:if test="%{listAllPro.get(#counter.count-1).isNew == true}">
                                        <s:set var="path" value="%{listAllPro.get(#counter.count-1).getListImg().get(0).getPath()}"/>
                                        <div class="slideFooter">
                                            <div class="product image"><img alt="sample" src="<s:text name="#path"/>" height="300px" width="100%"></div>			  
                                            <p class="productContent center"><s:property value="%{listAllPro.get(#counter.count-1).productName}"/> </p>
                                            <s:if test="%{listAllPro.get(#counter.count-1).isSale == true}">
                                                <p class="price center"><s:property value="%{listAllPro.get(#counter.count-1).priceSale}"/>VNĐ</p>
                                            </s:if>
                                            <s:else>
                                                <p class="price center"><s:property value="%{listAllPro.get(#counter.count-1).priceSell}"/>VNĐ</p>
                                            </s:else>
                                            <p class="center star"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-half-empty"></i></p>

                                            <s:form action="AddProductToCartAction" theme="simple">
                                                <s:hidden value="%{listAllPro.get(#counter.count-1).productID}" name="idProD"/>
                                                <s:submit type ="button" value=""  theme="simple" cssClass="fa fa-cart-plus center middle" title="Add to Cart"/>
                                            </s:form>
                                        </div>
                                    </s:if>
                                </s:iterator>
                            </div>
                            <div class="comment">
                                <div class="top-comment">
                                    <div class="top-comment-wrap-footer">
                                        <h4 class="top-product-fix">Ý KIẾN KHÁNH HÀNG
                                            <a><i class="onright fa fa-angle-right button-top" onclick="plusDivsComment(1)">  </i></a>
                                            <a><i class="onright fa fa-angle-left"  onclick="plusDivsComment(-1)"></i> </a>			
                                        </h4>
                                    </div>
                                </div>
                                <div class="intro-comment">
                                    <div class="slideComment">
                                        <div class="comment-alignment image"><a href="https://www.facebook.com/thienquy.tran.3" class="linkComment" target="new"><img class="face box-shadow" alt="sample" src="img/face/24991610_1116536068482729_4227555423807420582_n.jpg" height="200px" width="80%"></a></div>
                                        <p class="price center"><a href="https://www.facebook.com/thienquy.tran.3" class="linkComment"  target="new">Thiên Quý</a></p>
                                        <p class="commentContent center"><i class="fa fa-quote-left"></i>&nbsp;Shop bán hàng chất lượng.Giá tốt so với thị trường.Sẽ còn quay lại.&nbsp;<i class="fa fa-thumbs-up"></i>&nbsp;&nbsp;<i class="fa fa-quote-right"></i></p>
                                    </div>
                                    <div class="slideComment">
                                        <div class="comment-alignment image"><a href="https://www.facebook.com/khoi.truong.1253" class="linkComment" target="new"><img class="face box-shadow" alt="sample" src="img/face/21751532_708118946063132_4947968726779038749_n.jpg" height="200px" width="80%"></a></div>
                                        <p class="price center"><a href="https://www.facebook.com/khoi.truong.1253" class="linkComment"  target="new">Khôi Trương</a></p>
                                        <p class="commentContent center"><i class="fa fa-quote-left"></i>&nbsp;Hhaaa! Xứng đáng 5 sao vì thái độ phục vụ cực tốt uy tín và gói hàng rất kỹ đã mua 3 sản phẩm của shop rồi <i class="fa fa-thumbs-up"></i><i class="fa fa-thumbs-up"></i> &nbsp;feel best&nbsp; <i class="fa fa-thumbs-up"></i><i class="fa fa-thumbs-up"></i>&nbsp;&nbsp;<i class="fa fa-quote-right"></i></p>
                                    </div>
                                    <div class="slideComment">
                                        <div class="comment-alignment image"><a href="https://www.facebook.com/nhanvaio.sony" class="linkComment" target="new"><img class="face box-shadow" alt="sample" src="img/face/27545196_991313414378774_8127157928237290213_n.jpg" height="200px" width="80%"></a></div>
                                        <p class="price center"><a href="https://www.facebook.com/nhanvaio.sony" class="linkComment"  target="new">Thanh Nhàn</a></p>
                                        <p class="commentContent center"><i class="fa fa-quote-left"></i>&nbsp;Ko nói nhiều 5 sao&nbsp;<i class="fa fa-thumbs-up"></i>&nbsp;&nbsp;<i class="fa fa-quote-right"></i></p>
                                    </div>   
                                </div>

                            </div>


                        </div>
                        <div class="right-offer-fotter">
                            <div class="top-product-right">
                                <div class="top-product-wrap-footer center">
                                    <h4 class="top-product-fix">SẢN PHẨM
                                        <a><i class="onright fa fa-angle-right button-top" onclick="plusDivsRight(1)">  </i></a>
                                        <a><i class="onright fa fa-angle-left"  onclick="plusDivsRight(-1)"></i> </a>			
                                    </h4>
                                </div>
                            </div>	
                            <div id="content-product">
                                <s:set var="countSearch" value="0"/>

                                <s:iterator status="counter" begin="0" end="%{numOfPageHome-1}" var="i">
                                    <div class="slide-right-footer">
                                        <s:iterator begin="0" end="1" var="j">
                                            <div class="productRow"><!-- Each product row contains info of 3 elements -->
                                                <s:if test="%{(listAllPro.size() - (#countSearch)) <3}">
                                                    <s:set var="count2" value="%{listAllPro.size() - #countSearch}"/>
                                                </s:if>
                                                <s:else>
                                                    <s:set var="count2" value="3"/>
                                                </s:else>
                                                <s:subset start="%{#countSearch}" count="#count2" source="listAllPro" >
                                                    <s:iterator>
                                                        <article class="productInfo"><!-- Each individual product description -->
                                                            <s:set var="path" value ="%{listAllPro.get(#countSearch).getListImg().get(0).getPath()}"/>
                                                            <div class="image"><img class="box-shadow" alt="sample" src="<s:text name="#path"/>" height="250px" width="100%"></div>
                                                            <p class="productContent"><s:property value="%{listAllPro.get(#countSearch).productName}"/> </p>
                                                            <s:if test="%{listAllPro.get(#countSearch).isSale == true}">
                                                                <p class="price center"><s:property value="%{listAllPro.get(#countSearch).priceSale}"/>VNĐ</p>
                                                            </s:if>
                                                            <s:else>
                                                                <p class="price center"><s:property value="%{listAllPro.get(#countSearch).priceSell}"/>VNĐ</p>
                                                            </s:else>
                                                            <p class="star-right-product"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></p>
                                                            <!--<button class="middle-right-product"><i class="fa fa-cart-plus center"></i></button>-->
                                                            <s:form action="AddProductToCartAction" theme="simple">
                                                                <s:hidden value="%{listAllPro.get(#countSearch).productID}" name="idProD"/>
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

                <%@include file="footer.jsp" %>

            </div>

            <div class="aa">
                <div class="bodya">
                    <canvas id="sakura"></canvas>
                    <div class="btnbg">
                    </div>
                    <!-- sakura shader -->
                    <script id="sakura_point_vsh" type="x-shader/x_vertex">
                        uniform mat4 uProjection;
                        uniform mat4 uModelview;
                        uniform vec3 uResolution;
                        uniform vec3 uOffset;
                        uniform vec3 uDOF;  //x:focus distance, y:focus radius, z:max radius
                        uniform vec3 uFade; //x:start distance, y:half distance, z:near fade start

                        attribute vec3 aPosition;
                        attribute vec3 aEuler;
                        attribute vec2 aMisc; //x:size, y:fade

                        varying vec3 pposition;
                        varying float psize;
                        varying float palpha;
                        varying float pdist;

                        //varying mat3 rotMat;
                        varying vec3 normX;
                        varying vec3 normY;
                        varying vec3 normZ;
                        varying vec3 normal;

                        varying float diffuse;
                        varying float specular;
                        varying float rstop;
                        varying float distancefade;

                        void main(void) {
                        // Projection is based on vertical angle
                        vec4 pos = uModelview * vec4(aPosition + uOffset, 1.0);
                        gl_Position = uProjection * pos;
                        gl_PointSize = aMisc.x * uProjection[1][1] / -pos.z * uResolution.y * 0.5;

                        pposition = pos.xyz;
                        psize = aMisc.x;
                        pdist = length(pos.xyz);
                        palpha = smoothstep(0.0, 1.0, (pdist - 0.1) / uFade.z);

                        vec3 elrsn = sin(aEuler);
                        vec3 elrcs = cos(aEuler);
                        mat3 rotx = mat3(
                        1.0, 0.0, 0.0,
                        0.0, elrcs.x, elrsn.x,
                        0.0, -elrsn.x, elrcs.x
                        );
                        mat3 roty = mat3(
                        elrcs.y, 0.0, -elrsn.y,
                        0.0, 1.0, 0.0,
                        elrsn.y, 0.0, elrcs.y
                        );
                        mat3 rotz = mat3(
                        elrcs.z, elrsn.z, 0.0, 
                        -elrsn.z, elrcs.z, 0.0,
                        0.0, 0.0, 1.0
                        );
                        mat3 rotmat = rotx * roty * rotz;
                        normal = rotmat[2];

                        mat3 trrotm = mat3(
                        rotmat[0][0], rotmat[1][0], rotmat[2][0],
                        rotmat[0][1], rotmat[1][1], rotmat[2][1],
                        rotmat[0][2], rotmat[1][2], rotmat[2][2]
                        );
                        normX = trrotm[0];
                        normY = trrotm[1];
                        normZ = trrotm[2];

                        const vec3 lit = vec3(0.6917144638660746, 0.6917144638660746, -0.20751433915982237);

                        float tmpdfs = dot(lit, normal);
                        if(tmpdfs < 0.0) {
                        normal = -normal;
                        tmpdfs = dot(lit, normal);
                        }
                        diffuse = 0.4 + tmpdfs;

                        vec3 eyev = normalize(-pos.xyz);
                        if(dot(eyev, normal) > 0.0) {
                        vec3 hv = normalize(eyev + lit);
                        specular = pow(max(dot(hv, normal), 0.0), 20.0);
                        }
                        else {
                        specular = 0.0;
                        }

                        rstop = clamp((abs(pdist - uDOF.x) - uDOF.y) / uDOF.z, 0.0, 1.0);
                        rstop = pow(rstop, 0.5);
                        //-0.69315 = ln(0.5)
                        distancefade = min(1.0, exp((uFade.x - pdist) * 0.69315 / uFade.y));
                        }
                    </script>
                    <script id="sakura_point_fsh" type="x-shader/x_fragment">
                        #ifdef GL_ES
                        //precision mediump float;
                        precision highp float;
                        #endif

                        uniform vec3 uDOF;  //x:focus distance, y:focus radius, z:max radius
                        uniform vec3 uFade; //x:start distance, y:half distance, z:near fade start

                        const vec3 fadeCol = vec3(0.08, 0.03, 0.06);

                        varying vec3 pposition;
                        varying float psize;
                        varying float palpha;
                        varying float pdist;

                        //varying mat3 rotMat;
                        varying vec3 normX;
                        varying vec3 normY;
                        varying vec3 normZ;
                        varying vec3 normal;

                        varying float diffuse;
                        varying float specular;
                        varying float rstop;
                        varying float distancefade;

                        float ellipse(vec2 p, vec2 o, vec2 r) {
                        vec2 lp = (p - o) / r;
                        return length(lp) - 1.0;
                        }

                        void main(void) {
                        vec3 p = vec3(gl_PointCoord - vec2(0.5, 0.5), 0.0) * 2.0;
                        vec3 d = vec3(0.0, 0.0, -1.0);
                        float nd = normZ.z; //dot(-normZ, d);
                        if(abs(nd) < 0.0001) discard;

                        float np = dot(normZ, p);
                        vec3 tp = p + d * np / nd;
                        vec2 coord = vec2(dot(normX, tp), dot(normY, tp));

                        //angle = 15 degree
                        const float flwrsn = 0.258819045102521;
                        const float flwrcs = 0.965925826289068;
                        mat2 flwrm = mat2(flwrcs, -flwrsn, flwrsn, flwrcs);
                        vec2 flwrp = vec2(abs(coord.x), coord.y) * flwrm;

                        float r;
                        if(flwrp.x < 0.0) {
                        r = ellipse(flwrp, vec2(0.065, 0.024) * 0.5, vec2(0.36, 0.96) * 0.5);
                        }
                        else {


                        r = ellipse(flwrp, vec2(0.065, 0.024) * 0.5, vec2(0.58, 0.96) * 0.5);
                        }

                        if(r > rstop) discard;

                        vec3 col = mix(vec3(1.0, 0.8, 0.75), vec3(1.0, 0.9, 0.87), r);
                        float grady = mix(0.0, 1.0, pow(coord.y * 0.5 + 0.5, 0.35));
                        col *= vec3(1.0, grady, grady);
                        col *= mix(0.8, 1.0, pow(abs(coord.x), 0.3));
                        col = col * diffuse + specular;

                        col = mix(fadeCol, col, distancefade);

                        float alpha = (rstop > 0.001)? (0.5 - r / (rstop * 2.0)) : 1.0;
                        alpha = smoothstep(0.0, 1.0, alpha) * palpha;

                        gl_FragColor = vec4(col * 0.5, alpha);
                        }
                    </script>
                    <!-- effects -->
                    <script id="fx_common_vsh" type="x-shader/x_vertex">
                        uniform vec3 uResolution;
                        attribute vec2 aPosition;

                        varying vec2 texCoord;
                        varying vec2 screenCoord;

                        void main(void) {
                        gl_Position = vec4(aPosition, 0.0, 1.0);
                        texCoord = aPosition.xy * 0.5 + vec2(0.5, 0.5);
                        screenCoord = aPosition.xy * vec2(uResolution.z, 1.0);
                        }
                    </script>
                    <script id="bg_fsh" type="x-shader/x_fragment">
                        #ifdef GL_ES
                        //precision mediump float;
                        precision highp float;
                        #endif

                        uniform vec2 uTimes;

                        varying vec2 texCoord;
                        varying vec2 screenCoord;

                        void main(void) {
                        vec3 col;
                        float c;
                        vec2 tmpv = texCoord * vec2(3, 0.9) - vec2(0.95, 1);
                        c = exp(-pow(length(tmpv) * 1.5, 0.3));
                        col = mix(vec3(0, 0, 0), vec3(1,1,1) * 1.5, c);
                        gl_FragColor = vec4(col * 0.5, 1.0);

                        }
                    </script>
                    <script id="fx_brightbuf_fsh" type="x-shader/x_fragment">
                        #ifdef GL_ES
                        //precision mediump float;
                        precision highp float;
                        #endif
                        uniform sampler2D uSrc;
                        uniform vec2 uDelta;

                        varying vec2 texCoord;
                        varying vec2 screenCoord;

                        void main(void) {
                        vec4 col = texture2D(uSrc, texCoord);
                        gl_FragColor = vec4(col.rgb * 2.0 - vec3(0.5), 1.0);
                        }
                    </script>
                    <script id="fx_dirblur_r4_fsh" type="x-shader/x_fragment">
                        #ifdef GL_ES
                        //precision mediump float;
                        precision highp float;
                        #endif
                        uniform sampler2D uSrc;
                        uniform vec2 uDelta;
                        uniform vec4 uBlurDir; //dir(x, y), stride(z, w)

                        varying vec2 texCoord;
                        varying vec2 screenCoord;

                        void main(void) {
                        vec4 col = texture2D(uSrc, texCoord);
                        col = col + texture2D(uSrc, texCoord + uBlurDir.xy * uDelta);
                        col = col + texture2D(uSrc, texCoord - uBlurDir.xy * uDelta);
                        col = col + texture2D(uSrc, texCoord + (uBlurDir.xy + uBlurDir.zw) * uDelta);
                        col = col + texture2D(uSrc, texCoord - (uBlurDir.xy + uBlurDir.zw) * uDelta);
                        gl_FragColor = col / 5.0;
                        }
                    </script>
                    <!-- effect fragment shader template -->
                    <script id="fx_common_fsh" type="x-shader/x_fragment">
                        #ifdef GL_ES
                        //precision mediump float;
                        precision highp float;
                        #endif
                        uniform sampler2D uSrc;
                        uniform vec2 uDelta;

                        varying vec2 texCoord;
                        varying vec2 screenCoord;

                        void main(void) {
                        gl_FragColor = texture2D(uSrc, texCoord);
                        }
                    </script>
                    <!-- post processing -->
                    <script id="pp_final_vsh" type="x-shader/x_vertex">
                        uniform vec3 uResolution;
                        attribute vec2 aPosition;
                        varying vec2 texCoord;
                        varying vec2 screenCoord;
                        void main(void) {
                        gl_Position = vec4(aPosition, 0.0, 1.0);
                        texCoord = aPosition.xy * 0.5 + vec2(0.5, 0.5);
                        screenCoord = aPosition.xy * vec2(uResolution.z, 1.0);
                        }
                    </script>
                    <script id="pp_final_fsh" type="x-shader/x_fragment">
                        #ifdef GL_ES
                        //precision mediump float;
                        precision highp float;
                        #endif
                        uniform sampler2D uSrc;
                        uniform sampler2D uBloom;
                        uniform vec2 uDelta;
                        varying vec2 texCoord;
                        varying vec2 screenCoord;
                        void main(void) {
                        vec4 srccol = texture2D(uSrc, texCoord) * 2.0;
                        vec4 bloomcol = texture2D(uBloom, texCoord);
                        vec4 col;
                        col = srccol + bloomcol * (vec4(1.0) + srccol);
                        col *= smoothstep(1.0, 0.0, pow(length((texCoord - vec2(0.5)) * 2.0), 1.2) * 0.5);
                        col = pow(col, vec4(0.45454545454545)); //(1.0 / 2.2)

                        gl_FragColor = vec4(col.rgb, 1.0);
                        gl_FragColor.a = 1.0;
                        }
                    </script>
                </div>
                <script src="js/effect.js"></script>	
            </div>	

            <script src="js/scrolls-thien.js" type="text/javascript"></script>









































        </body>
    </s:else>
</html>
