
/*jshint globalstrict: true*/
'use strict';
//slideshow
//scroll-nav

window.onscroll = function() {
myFunction();
scrollFunction();
};
window.onresize= function(){
Checkfull();	
};
var navbar = document.getElementById("nav-top");
var sticky = navbar.offsetTop;
//var search = document.getElementById("search-wrap");
var search = document.getElementById("form-in");
function myFunction() {

  if (window.pageYOffset >= sticky) {
    navbar.classList.add("sticky");
	search.style.display="inline-block"; 
  } else {
    navbar.classList.remove("sticky");
	search.style.display="none"; 
  }
}


//scroll-to-top



function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        document.getElementById("button-to-top").style.display = "block";
		
    } else {
        document.getElementById("button-to-top").style.display = "none";
		document.getElementById("form-in").style.display = "none";   
    }
}

// click to top
function topFunction() {
    document.body.scrollTop = 0; 
    document.documentElement.scrollTop = 0; 

}


function hideAndShowEffect(a){
	    var x = document.getElementsByClassName(a);
		var y= document.getElementById("on");
		var z= document.getElementById("off");
		var n= document.getElementById("hide-show-effect");
    if (x[0].style.display === "none") {
        x[0].style.display = "block";
		z.style.display ="none";
		y.style.display="block";
		n.style.backgroundColor="#613336";
    } else {
        x[0].style.display = "none";
		z.style.display ="block";
		y.style.display="none";
		n.style.backgroundColor="#333";
    }
}

//function hideAndShowButton(){
//	var x=document.getElementsByClassName("on");
//    if (x.style.display === "none") {
//        x.style.display = "block";
//    } else {
//        x.style.display = "none";
//    }
//}

//function hideAndShowEffect(){
//	    var x = document.getElementsByClassName("aa");
//    if (x[0].style.display === "none") {
//        x[0].style.display = "block";
//    } else {
//        x[0].style.display = "none";
//    }
//}





function showHideNav(){
	var x= document.getElementsByClassName("li");
	
	for(var i=0;i<x.length;i++){
		if(x[i].style.display==="none"){
			x[i].style.display="block";
		}else{
			x[i].style.display = "none";
		}
	}
}
function Checkfull(){
	var w = window.innerWidth;
	var x= document.getElementsByClassName("li");
	if(w>1480){
		for(var i=0;i<x.length;i++){
			x[i].style.display="block";
		}
	}else{
		for(var j=0;j<x.length;j++){
			x[j].style.display="none";
		}
	}	
}