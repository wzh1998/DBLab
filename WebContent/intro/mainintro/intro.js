// HTML document is loaded
jQuery(window).on("load", function(){     
 "use strict";

  // var preloader
  var loader = jQuery( '.preloader, .preloader-white' );
  var bgpreloader = jQuery( '.bg-preloader-white' );
  var bgpreloaderbot = jQuery( '.bg-preloader-white-bot' );
  
  // var intro
  var revIntro = jQuery('#revolution-intro'); // id name your slider
  var urls  = ['../index.html']; // change with your url  
  var totalslide  = 6; // change total slide here
  
// start function
loader.fadeOut( 'fast', function() {	
 "use strict";
 
 // variable sound
 var idSound = jQuery('#playerintro');
 var playing = true;
 var n = document.getElementById('playerintro');

 // preloader fade
 bgpreloader.addClass('bg-hide');
      setTimeout(function() {
        bgpreloaderbot.addClass('bg-hide');
      }, 600);
 
     //revolution slider start
     showintro();
     function showintro() {
        var revapi;
        revapi = revIntro
            .revolution( {
				delay: 9000,
                startwidth: 1170,
                startheight: 600,
                onHoverStop: "none",
                thumbWidth: 100,
                thumbHeight: 50,
                thumbAmount: 3,
                navigationArrows:"none", 
                stopLoop:"on",
                stopAfterLoops: 0,
                stopAtSlide: totalslide, 
                touchenabled: "on",
                navigationType: "none",
                dottedOverlay: "",
                fullWidth: "on",
                fullScreen: "on",
                shadow: 0
            });	
     }

   // start sound
   idSound[0].volume = 0;
   idSound.animate({
   volume: 1
   }, 1000);
   n.play();
   n.muted = false;
   
//main intro
$(function() {
   var totdel = 0;
   var totspeed = 0;
   jQuery("#revolution-intro li").each(function() {
     var $this = $(this);
	 var timeframe = parseInt($(this).attr("data-endframe"));
	 var hox = timeframe + 0 ;
	 totdel += parseInt($(this).attr("data-delay"));
	 totspeed += parseInt($(this).attr("data-masterspeed"));
	 var total = totdel+totspeed;
	 var tot = total + hox;
	 if (tot===tot) {
     setTimeout(soundoff,  tot);
	 console.log(tot);
   	}
 });
   
   //sound end frame
   function soundoff() {
	   revIntro.revpause();
	   playing = false;
       idSound[0].volume = 1;
       idSound.animate({
       volume: 0
       }, 1000);
	   setTimeout(directpage, 1000);
    }
	
	jQuery(window).on("blur", function(e){
	 revIntro.revpause();
	   playing = false;
       idSound[0].volume = 1;
       idSound.animate({
       volume: 0
       }, 300);
       setTimeout(directpage, 300);
     });
	
   //skipp function
   function skipp() {
	   revIntro.revpause();
	   if (playing === false) {
       n.play();
       playing = true;
       idSound[0].volume = 0;
       idSound.animate({
         volume: 0
       }, 300);
       } else {
       playing = false;
       idSound[0].volume = 1;
       idSound.animate({
         volume: 0
       }, 300);
       }
	   setTimeout(directpage, 300);
    }

   //sound button
   var isound = jQuery('.soundOnintro');
   var ioffsound = jQuery('.soundOffintro');
   jQuery('#play-sound').on("click", function(e) {
    isound.toggleClass('hide');
	ioffsound.toggleClass('hide');
	if (playing === false) {
       n.play();
       playing = true;
       idSound[0].volume = 0;
       idSound.animate({
         volume: 1
       }, 600);
       } else {
       playing = false;
       idSound[0].volume = 1;
       idSound.animate({
         volume: 0
       }, 600);
     }
    });
   
  // skipp button
  jQuery('#skipintro').on("click", function(e) {
    setTimeout(skipp, 10);
  }); 
  
  //change your path url here
  function directpage() {
	   return window.location.href = urls; 
  }

});
//main intro end
});
// end function
});
// HTML document is loaded end



