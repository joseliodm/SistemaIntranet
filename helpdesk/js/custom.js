$(function () {

    // animate on scroll
    new WOW().init();
});

/*====================================================
                        WORK
====================================================*/
$(function () {

    $("#work").magnificPopup({
        delegate: 'a', // child items selector, by clicking on it popup will open
        type: 'image',
        gallery: {
            enabled: true
        }

    });
});

/*====================================================
                        TEAM
====================================================*/
$(function () {

    $("#team-members").owlCarousel({
        items: 3,
        autoplay: true,
        smartSpeed: 700,
        loop: true,
        autoplayHoverPause: true,
		responsive: {
		  0: {
			items: 1
		  },
		  480: {
			items: 2
		  },
		  768: {
			items: 3
		  }
		}
    });
});


/*====================================================
                        TESTIMONIALS
====================================================*/
$(function () {

    $("#customers-testimonials").owlCarousel({
        items: 1,
        autoplay: true,
        smartSpeed: 700,
        loop: true,
        autoplayHoverPause: true
    });
});


/*====================================================
                        STATS
====================================================*/
$(function () {
    $('.counter').counterUp({
        delay: 10,
        time: 2000
    });

});

/*====================================================
                        CLIENTS
====================================================*/
$(function () {

    $("#clients-list").owlCarousel({
        items: 6,
        autoplay: true,
        smartSpeed: 700,
        loop: true,
        autoplayHoverPause: true,
		responsive: {
		  0: {
			items: 1
		  },
		  480: {
			items: 3
		  },
		  768: {
			items: 5
		  },
		  992: {
			items: 6
		  }
		}
    });
});

/*====================================================
                        NAVIGATION
====================================================*/
// Show/Hide transparent black navigation
$(function () {

    $(window).scroll(function () {

        if ($(this).scrollTop() < 50) {
            // hide nav
            $("nav").removeClass("vesco-top-nav");
            $("#back-to-top").fadeOut();

        } else {
            // show nav
            $("nav").addClass("vesco-top-nav");
            $("#back-to-top").fadeIn();
        }
    });
});
// Close mobile menu on click
$(function(){
    
    $(".navbar-collapse ul li a").on("click touch", function(){
       
        $(".navbar-toggle").click();
    });
});

  function switchToSheet(id) {
          if (document.getElementById('sheet-menu')) {
            document.getElementById('sheet-button-' + activeSheetId)
                .className = '';
            document.getElementById('sheet-button-' + id).className = 'active';
          }

          document.getElementById(activeSheetId).style.display = 'none';
          document.getElementById(id).style.display = '';
          activeSheetId = id;

          // posObjs() is defined in embeddedObjectJs (see EmbeddedObjectHtmlBuilder.java)
          posObjs();
          return false;
        }
        
        function init() {
        var optPageSwitcher;
        
        function resize() {
          var optMobileWebHeader = document.getElementById('docs-ml-header-id');
          var optTopBar = document.getElementById('top-bar');
          var optFooter = document.getElementById('footer');
          var sheetsViewport = document.getElementById('sheets-viewport');

          if (optMobileWebHeader) {
            sheetsViewport.style.marginTop = optMobileWebHeader.offsetHeight +
                (optTopBar ? optTopBar.offsetHeight : 0) + 'px';
          }
          var adjustedHeight = window.innerHeight -
              (optTopBar ? optTopBar.offsetHeight : 0) -
              (optFooter ? optFooter.offsetHeight : 0);
          var adjustedWidth = window.innerWidth;
          sheetsViewport.style.width = (adjustedWidth + 'px');
          sheetsViewport.style.height = (adjustedHeight + 'px');
          if (optPageSwitcher) {
            optPageSwitcher.resize(adjustedWidth, adjustedHeight);
          }
        }
        resize();
        window.onresize = resize;
        var currentUrl = window.location.href;
        var newUrl = currentUrl.replace('?sle=true&', '?');
        newUrl = newUrl.replace('?sle=true', '');
        newUrl = newUrl.replace('&sle=true&', '&');
        newUrl = newUrl.replace('&sle=true', '');
        window.history.replaceState(null, '', newUrl);
        }





        