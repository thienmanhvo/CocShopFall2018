/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var slideIndexSearch = 1;
window.onload = function () {

    showDivsSearch(slideIndexSearch);
};


function plusDivsSearch(n) {
    showDivsSearch(slideIndexSearch += n);
}

function showDivsSearch(n) {
    var i;
    var x = document.getElementsByClassName("slide-right-footer");
    if (n > x.length) {
        slideIndexSearch = 1;
    }
    if (n < 1) {
        slideIndexSearch = x.length;
    }
    for (i = 0; i < x.length; i++) {
        x[i].style.display = "none";
    }
    x[slideIndexSearch - 1].style.display = "block";
}


