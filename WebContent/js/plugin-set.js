jQuery( document ).ready( function() {
			
	    // Magnific Popup img
        jQuery( '.big-img-1' )
            .magnificPopup( {
                type: 'image'
            } );
			
// Magnific Popup dailymotion
$('.big-video').magnificPopup({
  type: 'iframe',
  iframe: {
    patterns: {
      dailymotion: {
        index: 'dailymotion.com',
        id: function(url) {        
            var m = url.match(/^.+dailymotion.com\/(video|hub)\/([^_]+)[^#]*(#video=([^_&]+))?/);
            if (m !== null) {
                if(m[4] !== undefined) {
                    return m[4];
                }
                return m[2];
            }
            return null;
        },
        src: 'http://www.dailymotion.com/embed/video/%id%'
      }
    }
  }
});

// Magnific Popup youtube
$('.big-youtube').magnificPopup({
    disableOn: 700,
    type: 'iframe',
    mainClass: 'mfp-with-zoom mfp-img-mobile',
    removalDelay: 0,
    preloader: false,
    fixedContentPos: false,
    iframe: {
        patterns: {
            youtube: {
                src: 'http://www.youtube.com/embed/%id%?autoplay=1&rel=0'
            }
        }
    }
});

// vimeo video
$('.vim-video').magnificPopup({
  type: 'iframe',
  iframe: {
     markup: '<div class="mfp-iframe-scaler">'+
                '<div class="mfp-close"></div>'+
                '<iframe class="mfp-iframe" frameborder="0" allowfullscreen></iframe>'+
                '<div class="mfp-title">Some caption</div>'+
              '</div>'
  },
  callbacks: {
    markupParse: function(template, values, item) {
     values.title = item.el.attr('title');
    }
  }
});

//popup video player
$('.popup-video').magnificPopup({ 
    type: 'iframe', 
    mainClass: 'mfp-fade', 
    removalDelay: 160, 
    preloader: false, 
    fixedContentPos: false, 
    iframe: { 
     markup: '<div class="mfp-iframe-scaler">'+ 
       '<div class="mfp-close"></div>'+ 
       '<iframe class="mfp-iframe" frameborder="0" allowfullscreen></iframe>'+ 
       '</div>', 

     srcAction: 'iframe_src', 
     } 
}); 
        // step work
        var jQuerycontainerstep = jQuery( '#step-text' );
        jQuerycontainerstep.isotope( {
            itemSelector: '.cont',
            filter: '.planing',
            hiddenStyle: {
                opacity: 0
            },
            visibleStyle: {
                opacity: 1
            }
        } );
        jQuery( '.filt-step' )
            .on( 'click', function( e ) {
                e.preventDefault();
                var jQuerythis = jQuery( this );
                if ( jQuerythis.hasClass( 'active' ) ) {
                    return false;
                }
                var jQueryoptionSet = jQuerythis.parents();
                jQueryoptionSet.find( '.active' )
                    .removeClass( 'active' );
                jQuerythis.addClass( 'active' );
                var selector = jQuery( this )
                    .attr( 'data-filter' );
                jQuerycontainerstep.isotope( {
                    filter: selector,
                } );
                return false;
            } );
        // service
        var jQuerycontainer = jQuery( '#services' );
        jQuerycontainer.isotope( {
            itemSelector: '.service',
            filter: '.passion',
            hiddenStyle: {
                opacity: 0
            },
            visibleStyle: {
                opacity: 1
            }
        } );
        jQuery( '.filt-serv' )
            .on( 'click', function( e ) {
                e.preventDefault();
                var jQuerythis = jQuery( this );
                if ( jQuerythis.hasClass( 'selected' ) ) {
                    return false;
                }
                var jQueryoptionSet = jQuerythis.parents();
                jQueryoptionSet.find( '.selected' )
                    .removeClass( 'selected' );
                jQuerythis.addClass( 'selected' );
                var selector = jQuery( this )
                    .attr( 'data-filter' );
                jQuerycontainer.isotope( {
                    filter: selector,
                } );
                return false;
            } );

        // projects width gallery
        var $Wcontainerpro = jQuery( '#projects-wrap' );
        $Wcontainerpro.isotope( {
            itemSelector: '.w-gallery',
            filter: '*'
        } );
        jQuery( '.filt-projects-w' )
            .on( 'click', function( e ) {
                e.preventDefault();
                var $this = jQuery( this );
                if ( $this.hasClass( 'selected' ) ) {
                    return false;
                }
                var $optionSetpro = $this.parents();
                $optionSetpro.find( '.selected' )
                    .removeClass( 'selected' );
                $this.addClass( 'selected' );
                var selector = $( this )
                    .attr( 'data-project' );
                $Wcontainerpro.isotope( {
                    filter: selector,
                } );
                return false;
            });

  // layout Isotope after each image loads
  $Wcontainerpro.imagesLoaded().progress( function() {
  $Wcontainerpro.isotope('layout');
  });


    // set mansory gallery max width
    var maingall = jQuery('#w-gallery-container');
    if (maingall.length) {
    var masonry = new Macy({
            container: '#w-gallery-container',
            trueOrder: false,
            waitForImages: true,
            margin: 15,
            columns: 3,
            breakAt: {
              1200: {
                columns: 3,
              },
              940: {
                columns: 2,
              },
              520: {
                columns: 2,
              },
              400: {
                columns: 1
              }
            }
          });
    } else {
       //nothing happen
    }

  // filter galery hide
  $(".filtter-icon").on("click", function() {
      $("#filter-porto").fadeToggle(600);
      $("#filter-hide").toggleClass('show');
  });

  // owlCarousel home img
  $("#imghome").owlCarousel({
        margin:15,
        responsiveClass:true,
        nav:false,
        mouseDrag: false,
        touchDrag: true,
        responsive:{
        0:{
            items:1,
            mouseDrag: true,
        },
        320:{
            items:1,
            mouseDrag: true,
        },
        414:{
            items:1,
            loop:true,
            mouseDrag: true,
        },
        800:{
            items:1,
            loop:true,
            mouseDrag: true,
        },
        1024:{
            items:1,
            loop:true,
         }
        }
        });

  // owlCarousel gallery
  $("#owl-testimonial").owlCarousel({
        margin:15,
        responsiveClass:true,
        responsive:{
        0:{
            items:1,
        },
        320:{
            items:1,
        },
        414:{
            items:1,
            loop:true,
        },
        800:{
            items:1,
            loop:true,
        },
        1024:{
            items:1,
            loop:true,
         }
        }
        });

        // owlCarousel gal
        $("#owl-gal").owlCarousel({
        margin:15,
        responsiveClass:true,
        responsive:{
        0:{
            items:1,
            nav:true,
            stagePadding: 0
        },
        320:{
            items:1,
            nav:true,
            stagePadding: 0
        },
        414:{
            items:1,
            nav:true,
            loop:true,
            stagePadding: 0
        },
        800:{
            items:2,
            nav:true,
            loop:true,
            stagePadding: 0
        },
        1024:{
            items:2,
            nav:true,
            loop:true,
            stagePadding: 0
         }
        },
        nav:true,
        navText : ['<i class="fa fa-angle-left" aria-hidden="true"></i>','<i class="fa fa-angle-right" aria-hidden="true"></i>']
        });

        // owlCarousel gal
        $("#owl-detail").owlCarousel({
        margin:15,
        responsiveClass:true,
        responsive:{
        0:{
            items:1,
            nav:true,
            stagePadding: 0
        },
        320:{
            items:1,
            nav:true,
            stagePadding: 0
        },
        414:{
            items:1,
            nav:true,
            loop:true,
            stagePadding: 0
        },
        800:{
            items:1,
            nav:true,
            loop:true,
            stagePadding: 0
        },
        1024:{
            items:1,
            nav:true,
            loop:true,
            stagePadding: 0
         }
        },
        nav:true,
        navText : ['<i class="fa fa-angle-left" aria-hidden="true"></i>','<i class="fa fa-angle-right" aria-hidden="true"></i>']
        });

		// owlCarousel gal
        $("#owl-team").owlCarousel({
        responsiveClass:true,
        responsive:{
        0:{
            items:1,
            nav:true,
            margin:0,
            stagePadding: 0
        },
        320:{
            items:1,
            nav:true,
            margin:0,
            stagePadding: 0
        },
        414:{
            items:1,
            nav:true,
            loop:true,
            margin:0,
            stagePadding: 0
        },
        800:{
            items:2,
            nav:true,
            loop:true,
            margin:30,
            stagePadding: 0
        },
        1024:{
            items:2,
            nav:true,
            loop:true,
            margin:30,
            stagePadding: 0
         }
        },
        nav:true,
        navText : ['<i class="fa fa-angle-left" aria-hidden="true"></i>','<i class="fa fa-angle-right" aria-hidden="true"></i>']
        });

        // owlCarousel brand
        $("#owl-brand").owlCarousel({
        responsiveClass:true,
        responsive:{
        0:{
            items:2,
            nav:false,
            margin:0,
            stagePadding: 0
        },
        320:{
            items:3,
            nav:false,
            margin:0,
            stagePadding: 0
        },
        414:{
            items:4,
            nav:false,
            loop:true,
            margin:0,
            stagePadding: 0
        },
        800:{
            items:5,
            nav:false,
            loop:true,
            margin:0,
            stagePadding: 0
        },
        1024:{
            items:6,
            nav:false,
            loop:true,
            margin:0,
            stagePadding: 0
         }
        },
        nav:false,
        navText : ['<i class="fa fa-angle-left" aria-hidden="true"></i>','<i class="fa fa-angle-right" aria-hidden="true"></i>']
        });
  
  // owl projects detail
  var projectsBig = $("#projectsBig");
  projectsBig.owlCarousel( {
        margin:15,
        responsiveClass:true,
        responsive:{
        0:{
            items:1,
            nav:true,
            stagePadding: 0
        },
        320:{
            items:1,
            nav:true,
            stagePadding: 0
        },
        414:{
            items:1,
            nav:true,
            loop:true,
            stagePadding: 0
        },
        800:{
            items:1,
            nav:true,
            loop:true,
            stagePadding: 0
        },
        1024:{
            items:1,
            nav:true,
            loop:true,
            stagePadding: 0
         }
        },
        nav:true,
        navText : ['<i class="fa fa-angle-left" aria-hidden="true"></i>','<i class="fa fa-angle-right" aria-hidden="true"></i>']
        });

        // fucntion show hide detail
        jQuery('.hide-detail').on( "click", function() {
            $(this).hide();
            $('.show-detail').show();
            $('.detaillist').slideUp('fast');
        });
         jQuery('.show-detail').on( "click", function() {
            $(this).hide();
            $('.hide-detail').show();
            $('.detaillist').slideDown(300);
        });
			
		// revolution slider
        var revapi;
        revapi = jQuery( '#revolution-slider-half' )
            .revolution( {
                delay:9000,
				startwidth:960,
				startheight:630,
                onHoverStop: "on",
                thumbWidth: 100,
                thumbHeight: 50,
                thumbAmount: 3,
                touchenabled: "on",
                stopAtSlide: -1,
                stopAfterLoops: -1,
                touchenabled: "on",
                navigationType:"none",
                navigationArrows:"solo",
                navigationStyle:"preview1",
                touchenabled:"on",
                onHoverStop:"on",
                swipe_velocity: 0.7,
                swipe_min_touches: 1,
                swipe_max_touches: 1,
                drag_block_vertical: false,                                 
                keyboardNavigation:"on",
                navigationHAlign:"center",
                navigationVAlign:"bottom",
                navigationHOffset:0,
                navigationVOffset:20,
                soloArrowLeftHalign:"left",
                soloArrowLeftValign:"center",
                soloArrowLeftHOffset:20,
                soloArrowLeftVOffset:0,
                soloArrowRightHalign:"right",
                soloArrowRightValign:"center",
                soloArrowRightHOffset:20,
                soloArrowRightVOffset:0,
                dottedOverlay: "",
                fullWidth: "on",
                stopAfterLoops:0,
                stopAtSlide:1,
                shadow: 0
            } );
			
			
 } );