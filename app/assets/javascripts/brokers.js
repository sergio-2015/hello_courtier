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

  $('#add_an_expertise_1').click(function() {
    console.log("ok clicked");
    if($('#expertise_group_1').hasClass("hidden")) {
      console.log("ok I recognize the condition");
      $('#expertise_group_1').removeClass( "hidden" );
    }
    else {
      $('#expertise_group_1').addClass( "hidden" );
    };
  });

  $('#add_an_expertise_2').click(function() {
    console.log("ok clicked");
    if($('#expertise_group_2').hasClass("hidden")) {
      console.log("ok I recognize the condition");
      $('#expertise_group_2').removeClass( "hidden" );
    }
    else {
      $('#expertise_group_2').addClass( "hidden" );
    };
  });

  $('#add_an_expertise_3').click(function() {
    console.log("ok clicked");
    if($('#expertise_group_3').hasClass("hidden")) {
      console.log("ok I recognize the condition");
      $('#expertise_group_3').removeClass( "hidden" );
    }
    else {
      $('#expertise_group_3').addClass( "hidden" );
    };
  });



});







