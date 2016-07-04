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


$(document).scroll(function() {
  var footerHeight = $('.footer').height();
  var height_to_retrieve = footerHeight + 110;
  console.log(height_to_retrieve)
  if($('#results-map').offset().top + $('#results-map').height() >= $('.footer').offset().top)
    $('#results-map').css('height', 'calc(100vh - '+height_to_retrieve+'px)');
  if($(document).scrollTop() + window.innerHeight < $('.footer').offset().top)
    $('#results-map').css('height', 'calc(100vh - 70px)'); // restore when you scroll up
});

$(document).ready(function() {
  $('#show_agency_phone_number').click(function() {
    $('#show_agency_phone_number').addClass( "hidden" );
    $('#agency_phone_number_is_shown').removeClass( "hidden" );
  });
  $('#agency_phone_number_is_shown').click(function() {
    $('#agency_phone_number_is_shown').addClass( "hidden" );
    $('#show_agency_phone_number').removeClass( "hidden" );
  });
});


// height: calc(100vh - 70px)
