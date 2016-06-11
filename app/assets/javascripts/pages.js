
$(document).scroll(function() {
  var footerHeight = $('.footer').height();
  var height_to_retrieve = footerHeight + 110;
  console.log(height_to_retrieve)
  if($('.broker-form-column').offset().top + $('.broker-form-column').height() >= $('.footer').offset().top)
    $('.broker-form-column').css('height', 'calc(100vh - '+height_to_retrieve+'px)');
  if($(document).scrollTop() + window.innerHeight < $('.footer').offset().top)
    $('.broker-form-column').css('height', 'calc(100vh - 70px)'); // restore when you scroll up
});




var formPusher = $('.broker-form-column-pusher'),
  formPusherHeight = formPusher.height(),
  scroll;

$(window).scroll(function () {
  scroll = $(this).scrollTop();
  formPusher.height(formPusherHeight - (scroll)/4)
});


// var EVENTS = "change";

// $(document).ready(function() {
//   $('#new_broker .form-control').on(EVENTS, function(event){
//     var element = $(this);
//     var value = element.val();
//     var id = element.attr('id');

//     if (value == ""){
//       var isValid = false;
//     }else{
//       var isValid = true;
//     };

//     if (element.is('#broker_first_name')) {
//       aide = "Veuillez saisir votre prénom";
//     }
//     else if (element.is('#broker_last_name')) {
//       aide = "Veuillez saisir votre nom";
//     }
//     else if (element.is('#broker_phone_number')) {
//       value_without_whitespace = value.replace(/\s+/g, '');
//       isValid = (/^(0|\+33)[1-9]\d{8}$/).test(value_without_whitespace);
//       aide = "Le numéro de téléphone n'est pas valide";
//     }
//     else if (element.is('#broker_email')) {
//       isValid = (/^[-a-z0-9~!$%^&*_=+}{\'?]+(\.[-a-z0-9~!$%^&*_=+}{\'?]+)*@([a-z0-9_][-a-z0-9_]*(\.[-a-z0-9_]+)*\.(aero|arpa|biz|com|coop|edu|gov|info|int|mil|museum|name|net|org|pro|travel|mobi|[a-z][a-z])|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,5})?$/i).test(value);
//       aide = "L'adresse e-mail n'est pas valide";
//     }
//     else if (element.is('#broker_password')) {
//       if (value.length > 6) {
//         isValid = true;
//       };
//       aide = "Votre mot de passe doit contenir 6 caractères au minimum";
//     };

//     if (isValid != true){
//       $(element).parent().removeClass('has-success').removeClass('has-feedback').addClass('has-error').addClass('has-feedback');
//       $(element).attr('aria-describedby', 'helpBlock');
//       if ($(element).next("span").length > 0) {
//         }
//       else{
//       $(element).after('<span id="helpBlock" class="help-block">'+ aide +'.</span>');
//       };
//     }
//     else {
//       $(element).parent().removeClass('has-error').removeClass('has-feedback').addClass('has-success').addClass('has-feedback');
//       $(element).removeAttr('aria-describedby');
//       $(element).next("span").remove();
//     };

//   activateButton();

//   });

//   $('#button-broker-form').on("click", function() {
//     $('.broker-form-column').html("<p class='text-center'><strong>Merci ! Nous avons bien reçu vos coordonnées. Un membre de notre équipe va prendre contact avec vous rapidement. Créez dès maintenant la vitrine de votre agence</strong></p> <br><a href='#' class='cta-transaction' > Créer ma vitrine</a>");
//   });
// });

// function activateButton() {
//   var numberOfValidFields = $('.has-success').length;
//   if(numberOfValidFields == 4) {
//     $('.btn-success').removeAttr('disabled');
//   }
//   else{
//     $('.btn-success').attr('disabled', '').html('Please fill everything');
//   };
// };



// var EVENTS = "click";

// $(document).ready(function() {
//   $('#button-broker-form').on(EVENTS, function(event){
//     if ($('#broker_first_name').val() == ""){
//       aide = "Veuillez saisir votre prénom";
//       $('#broker_first_name').parent().removeClass('has-success').removeClass('has-feedback').addClass('has-error').addClass('has-feedback');
//       $('#broker_first_name').attr('aria-describedby', 'helpBlock');
//       if ($('#broker_first_name').next("span").length > 0) {
//         }
//       else{
//       $('#broker_first_name').after('<span id="helpBlock" class="help-block">'+ aide +'.</span>');
//       };
//     }

//     else if ($('#broker_last_name').val() == ""){
//       aide = "Veuillez saisir votre prénom";
//       $('#broker_last_name').parent().removeClass('has-success').removeClass('has-feedback').addClass('has-error').addClass('has-feedback');
//       $('#broker_last_name').attr('aria-describedby', 'helpBlock');
//       if ($('#broker_last_name').next("span").length > 0) {
//         }
//       else{
//       $('#broker_last_name').after('<span id="helpBlock" class="help-block">'+ aide +'.</span>');
//       };
//     }

//     else if ((/^[-a-z0-9~!$%^&*_=+}{\'?]+(\.[-a-z0-9~!$%^&*_=+}{\'?]+)*@([a-z0-9_][-a-z0-9_]*(\.[-a-z0-9_]+)*\.(aero|arpa|biz|com|coop|edu|gov|info|int|mil|museum|name|net|org|pro|travel|mobi|[a-z][a-z])|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,5})?$/i).test($('#broker_email').val())){
//       aide = "Veuillez saisir votre prénom";
//       $('#broker_email').parent().removeClass('has-success').removeClass('has-feedback').addClass('has-error').addClass('has-feedback');
//       $('#broker_email').attr('aria-describedby', 'helpBlock');
//       if ($('#broker_email').next("span").length > 0) {
//         }
//       else{
//       $('#broker_email').after('<span id="helpBlock" class="help-block">'+ aide +'.</span>');
//       };
//     };


//     // activateButton();
//   });

//   // $('#button-broker-form').on("click", function() {
//   //   $('.broker-form-column').html("<p class='text-center'><strong>Merci ! Nous avons bien reçu vos coordonnées. Un membre de notre équipe va prendre contact avec vous rapidement. Créez dès maintenant la vitrine de votre agence</strong></p> <br><a href='#' class='cta-transaction' > Créer ma vitrine</a>");
//   // });
// });


// function activateButton() {
//   var numberOfValidFields = $('.has-success').length;
//   if(numberOfValidFields == 1) {
//     $('.btn-success').removeAttr('disabled');
//     $('.broker-form-column').html("<p class='text-center'><strong>Merci ! Nous avons bien reçu vos coordonnées. Un membre de notre équipe va prendre contact avec vous rapidement. Créez dès maintenant la vitrine de votre agence</strong></p> <br><a href='#' class='cta-transaction' > Créer ma vitrine</a>");
//   }
//   else{
//     $('.btn-success').attr('disabled', '').html('Please fill everything');
//   };
// };











