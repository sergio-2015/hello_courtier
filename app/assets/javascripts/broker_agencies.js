// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).ready(function() {
  $('.results-header-affiner-btn').click(function() {
    $("html, body").animate({ scrollTop: 0 }, "slow");
    $('.results-search-form.collapse').collapse('toggle');
    return false;
  });
});


var EVENTS = "click";

$(document).ready(function() {
  $('.results-search-form-bloc-item').on(EVENTS, function(event){
    var element = $(this);
    var elementInput = $("input", this);
    elementInput.prop("checked", !elementInput.prop("checked"));
  });
  $(':checkbox').change(function() {
    var element = $(this);
    element.prop("checked", !element.prop("checked"));
  });
});




