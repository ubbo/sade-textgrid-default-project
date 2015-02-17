/*------------------------------------------------------------------
Project:	HighLand
Version:	1.3
Created: 		18/10/2013
Last change:	07/03/2014
-------------------------------------------------------------------*/
var pathArray = window.location.pathname.split( '/' );
if ( pathArray[4] != 'textgrid' ){
        $('div#sidebar li a').each(){ $(this).attr('href', $(this).attr('href').replace(/textgrid/g, pathArray[4]));}
    }

// Search box toggle
// =================
$('#search-btn').on('click', function() {
	$("#search-icon").toggleClass('fa-search fa-times margin-2');
	$("#search-box").toggleClass('show hidden animated fadeInUp');
	return false;
});

// Smooth scrolling for UI elements page
// =====================================
$(document).ready(function(){
   $('a[href*=#buttons],a[href*=#panels], a[href*=#info-boards], a[href*=#navs], a[href*=#alerts], a[href*=#thumbnails], a[href*=#social], a[href*=#section-header],a[href*=#page-tip], a[href*=#block-header], a[href*=#tags]').bind("click", function(e){
	  var anchor = $(this);
	  $('html, body').stop().animate({
		 scrollTop: $(anchor.attr('href')).offset().top
	  }, 1000);
	  e.preventDefault();
   });
   return false;
});

// 404 error page smile
// ====================
$('#search-404').on('focus', function() {
	$("#smile").removeClass("fa-meh-o flipInX");
	$("#smile").addClass("fa-smile-o flipInY");
});

$('#search-404').on('blur', function() {
	$("#smile").removeClass("fa-smile-o flipInY");
	$("#smile").addClass("fa-meh-o flipInX");
});
// Sign up popovers
// ================
$(function(){
	$('#InEmail').popover();
});

$(function(){
	$('#projectname').popover();
});

$(function(){
	$('#Password1').popover();
});

$(function(){
	$('#newuser').popover();
});

$(function(){
	$('#tPassword2').popover();
});

// Profile - Status Update 
// =======================

$('#update-status').on('click', function() {
	$(".user-status > p").toggleClass("show hidden");
	$(".user-status > form").toggleClass("hidden show");
	return false;
});

$('.user-status > form > button').on('click', function() {
	$(".user-status > p").toggleClass("show hidden");
	$(".user-status > form").toggleClass("hidden show");
	return false;
});

// Lost password form
//===================

$('.pwd-lost > .pwd-lost-q > a').on('click', function() {
	$(".pwd-lost > .pwd-lost-q").toggleClass("show hidden");
	$(".pwd-lost > .pwd-lost-f").toggleClass("hidden show animated fadeIn");
	return false;
});
