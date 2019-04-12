/*jshint globalstrict: true*/
'use strict';
//slideshow
var slideIndex = 0;
var t;
var dots;
//var maxheight = 0;
var timedelay = 9000;

window.onload = function () {
//var x = document.getElementsByClassName("mySlides");
//var parent_elem = document.getElementById('myslideFrame');
//var widthRatio = parseInt(parent_elem.offsetWidth) / parseInt(x[0].width);
//
//for (var i = 0; i < x.length; i++) {
//
//if (x[i].height > maxheight)
//{
//maxheight = x[i].height;
//}
//}
//
//document.getElementById('myslideFrame').style.height = maxheight * widthRatio + "px";
    showDivs(slideIndex);
    tachchu();
    carousel();
    showDivsProduct(slideIndexProduct);
    showDivsContent(slideIndexContent);
    showDivsFooter(slideIndexFooter);
    showDivsRight(slideIndexRight);
    showDivsComment(slideIndexComment);
};

function plusDivs(n) {
    showDivs(slideIndex += n);
}

function currentDiv(n) {
    showDivs(slideIndex = n);
}
function showDivs(n) {
    var i = 0;
    var x = document.getElementsByClassName("mySlides");
    dots = document.getElementsByClassName("demo");

    if (n > x.length) {
        slideIndex = 1;
    }

    if (n < 1) {
        slideIndex = x.length;
    }

    for (i = 0; i < x.length; i++) {
        x[i].style.display = "none";
    }

    for (i = 0; i < dots.length; i++) {

        dots[i].className = dots[i].className.replace(" offer-border-red", "");

    }

    x[slideIndex - 1].style.display = "inline-block";
    dots[slideIndex - 1].className += " offer-border-red";

}

function carousel() {

    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
        x[i].style.display = "none";
        dots[i].className = dots[i].className.replace(" offer-border-red", "");
    }
    slideIndex++;

    if (slideIndex > x.length) {
        slideIndex = 1;
    }

    x[slideIndex - 1].style.display = "inline-block";
    dots[slideIndex - 1].className += " offer-border-red";
    t = setTimeout(carousel, timedelay);
}

function pauseCarousel() {
    clearTimeout(t);
}

function startCarousel() {
    t = setTimeout(carousel, timedelay);
}

//tachchu

var s = String("CHÚNG TÔI TẠO NÊN SỰ KHÁC BIỆT");
var j = 0;
var res = s.split("");

function runChar() {
    var p = document.getElementById("Ads");
    p.innerHTML += res[j];
    j++;
    if (j > res.length) {
        j = 0;
        p.innerHTML = "";
    }
}

function tachchu() {
  window.setInterval(runChar, 100);
}


//bestseller
var slideIndexProduct = 1;

function plusDivsProduct(n) {
    showDivsProduct(slideIndexProduct += n);
}

function showDivsProduct(n) {
    var i;
    var x = document.getElementsByClassName("slide");
    if (n > x.length) {
        slideIndexProduct = 1;
    }
    if (n < 1) {
        slideIndexProduct = x.length;
    }
    for (i = 0; i < x.length; i++) {
        x[i].style.display = "none";
    }
    x[slideIndexProduct - 1].style.display = "block";
}

//discout


var slideIndexContent = 1;

function plusDivsContent(n) {
    showDivsContent(slideIndexContent += n);
}

function showDivsContent(n) {
    var i;
    var x = document.getElementsByClassName("slideContent");
    if (n > x.length) {
        slideIndexContent = 1;
    }
    if (n < 1) {
        slideIndexContent = x.length;
    }
    for (i = 0; i < x.length; i++) {
        x[i].style.display = "none";
    }
    x[slideIndexContent - 1].style.display = "block";
}


var slideIndexFooter = 1;

function plusDivsFooter(n) {
    showDivsFooter(slideIndexFooter += n);
}

function showDivsFooter(n) {
    var i;
    var x = document.getElementsByClassName("slideFooter");
    if (n > x.length) {
        slideIndexFooter = 1;
    }
    if (n < 1) {
        slideIndexFooter = x.length;
    }
    for (i = 0; i < x.length; i++) {
        x[i].style.display = "none";
    }
    x[slideIndexFooter - 1].style.display = "block";
}

var slideIndexRight = 1;

function plusDivsRight(n) {
    showDivsRight(slideIndexRight += n);
}

function showDivsRight(n) {
    var i;
    var x = document.getElementsByClassName("slide-right-footer");
    if (n > x.length) {
        slideIndexRight = 1;
    }
    if (n < 1) {
        slideIndexRight = x.length;
    }
    for (i = 0; i < x.length; i++) {
        x[i].style.display = "none";
    }
    x[slideIndexRight - 1].style.display = "block";
}


var slideIndexComment = 1;

function plusDivsComment(n) {
    showDivsComment(slideIndexComment += n);
}

function showDivsComment(n) {
    var i;
    var x = document.getElementsByClassName("slideComment");
    if (n > x.length) {
        slideIndexComment = 1;
    }
    if (n < 1) {
        slideIndexComment = x.length;
    }
    for (i = 0; i < x.length; i++) {
        x[i].style.display = "none";
    }
    x[slideIndexComment - 1].style.display = "block";
}