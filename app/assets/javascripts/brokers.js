// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  $('#password_change').click(function() {
    console.log("ok clicked");
    if($('#password_change_fields').hasClass("hidden")) {
      console.log("ok I recognize the condition");
      $('#password_change_fields').removeClass( "hidden" );
    }
    else {
      $('#password_change_fields').addClass( "hidden" );
    };
  });





});







