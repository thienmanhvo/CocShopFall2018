// JavaScript Document
/*jshint globalstrict: true*/
'use strict';
var ck_email = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
var ck_password = /^[A-Za-z0-9!@#$%^&8()_]{6,20}$/;
function validateForm(form, e) {
    var email = form.email.value;
    var password = form.password.value;
    if (email === null || email === "" || password === null || password === "") {
//			document.write("Không được để trống");
        document.getElementById("outputDiv1").innerHTML = "<p>Email và Mật khẩu không được để trống.</p>";
        e.preventDefault();
    } else {
        document.getElementById("outputDiv1").innerHTML = "<p></p>";
        if (!ck_email.test(email)) {
            document.getElementById("outputDiv2").innerHTML = "<p>Email phải có @ ví dụ example@gmail.com</p>";
            e.preventDefault();
        } else {
            document.getElementById("outputDiv2").innerHTML = "<p></p>";
        }
        if (!ck_password.test(password)) {
            document.getElementById("outputDiv3").innerHTML = "<p>Password phải từ 6 đến 20 ký tự</p>";
            e.preventDefault();
        } else {
            document.getElementById("outputDiv3").innerHTML = "<p></p>";
        }
    }
    //fname.value.length==0
//    return count === 0;
}
function validateText(inputtxt) {
    var regLetter = /[A-Za-z]+$/;
    if (inputtxt.value.match(regLetter)) {
        alert("Your name have accepted : you can try another");
        return true;
    } else {
        alert('Please input alphabet char only');
        return false;
    }
}
var ck_name = /[A-Za-z0-9 ]{1,20}$/;
function validateRes(form, e) {
    var email = form.email.value;
    var password = form.password.value;
    var rePassword = form.passwordRe.value;
    var count = 0;
    var ho = form.lastname.value;
    var ten = form.firstname.value;
    if (email === null || email === "" || password === null || password === "" || ho === null || ho === "" || ten === null || ten === "" || rePassword === null || rePassword === "") {
//			document.write("Không được để trống");
        document.getElementById("outputBlank").innerHTML = "<p>Email , Mật khẩu, Họ và Tên không được để trống.</p>";
        count++;
        e.preventDefault();
    } else {
        document.getElementById("outputBlank").innerHTML = "<p></p>";

        if (!ck_email.test(email)) {
            document.getElementById("outputEmail").innerHTML = "<p>Email phải có @ ví dụ example@gmail.com</p>";
            count++;
            e.preventDefault();
        } else {
            document.getElementById("outputEmail").innerHTML = "<p></p>";
        }
        if (!ck_password.test(password)) {
            document.getElementById("outputPass").innerHTML = "<p>Password phải từ 6 đến 20 ký tự</p>";
            count++;
            e.preventDefault();
        } else {
            document.getElementById("outputPass").innerHTML = "<p></p>";
        }
        if (rePassword !== password) {
            document.getElementById("outputPassRe").innerHTML = "<p>Mật khẩu và Mật khẩu nhập lại không khớp</p>";
            count++;
            e.preventDefault();
        } else {
            document.getElementById("outputPassRe").innerHTML = "<p></p>";
        }
//			fname.value.length==0


        if (!ck_name.test(ten)) {
            document.getElementById("outputLastName").innerHTML = "<p>Họ không được chứa ký tự đặc biệt</p>";
            count++;
            e.preventDefault();
        } else {
            document.getElementById("outputLastName").innerHTML = "<p></p>";
        }
        if (!ck_name.test(ho)) {
            document.getElementById("outputName").innerHTML = "<p>Tên không được chứa ký tự đặc biệt</p>";
            count++;
            e.preventDefault();
        } else {
            document.getElementById("outputName").innerHTML = "<p></p>";
        }
    }
    if (count > 0) {
        document.getElementById("outputFailed").innerHTML = "<p>Tạo tài khoản thất bại</p>";
    } else {
        document.getElementById("outputFailed").innerHTML = "<p></p>";
    }


}
////	var ck_name=/[A-Za-z0-9 ]{3,20}$/;
//	var ck_email=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
////	var ck_uername = /^[A-Za-z0-9_]{1,20}$/;
//	var ck_password= /^[A-Za-z0-9!@#$%^&8()_](6,20)$/;	
//	
//function validate(form){
////		var name = form.name.value;
//		var email=form.email.value;
////		var username=form.username.value;
//		var password = form.matkhau.value;
////		var gender = form.gender.value;
//		var errors =[];
//	
////	if(!ck_name.test(name)){
////		errors[errors.length]="You valid name.";
////	}
//	if(!ck_email.test(email)){
//		errors[errors.length] = "You must enter a valid email address.";
//	}	
////	if(!ck_uername.test(username)){
////		errors[errors.length]="You valid UserName no special char .";
////	}
//	if(!ck_password.test(password)){
//		errors[errors.length]="You must enter a valid Password";
//	}
////	if(gender===0){
////		errors[errors.length]="Select Gender";
////	}
//	if(errors.length>0){
//		reportErrors(errors);
//		return false;
//	}
//	return true;
//}
//	function reportErrors(errors){
//		var msg = "Please Enter Valide Data...\n";
//		for(var i = 0;i<errors.length;i++){
//			var numError = i+1;
//			msg+="\n" + numError +". " + errors[i];
//		}
//		alert(msg);	
//	}

function confirmBox(e) {
    var answer;
    answer = window.confirm("Are your sure?");
    if (answer !== true) {
        e.preventDefault();
    }
}
 