/**
* Template Name: UpConstruction - v1.3.0
* Template URL: https://bootstrapmade.com/upconstruction-bootstrap-construction-website-template/
* Author: BootstrapMade.com
* License: https://bootstrapmade.com/license/
*/
document.addEventListener('DOMContentLoaded', () => {
  "use strict";

  /**
   * Preloader
   */
  const preloader = document.querySelector('#preloader');
  if (preloader) {
    window.addEventListener('load', () => {
      preloader.remove();
    });
  }

  /**
   * Mobile nav toggle
   */

  const mobileNavShow = document.querySelector('.mobile-nav-show');
  const mobileNavHide = document.querySelector('.mobile-nav-hide');

  document.querySelectorAll('.mobile-nav-toggle').forEach(el => {
    el.addEventListener('click', function(event) {
      event.preventDefault();
      mobileNavToogle();
    })
  });

  function mobileNavToogle() {
    document.querySelector('body').classList.toggle('mobile-nav-active');
    mobileNavShow.classList.toggle('d-none');
    mobileNavHide.classList.toggle('d-none');
  }

  /**
   * Hide mobile nav on same-page/hash links
   */
  document.querySelectorAll('#navbar a').forEach(navbarlink => {

    if (!navbarlink.hash) return;

    let section = document.querySelector(navbarlink.hash);
    if (!section) return;

    navbarlink.addEventListener('click', () => {
      if (document.querySelector('.mobile-nav-active')) {
        mobileNavToogle();
      }
    });

  });

  /**
   * Toggle mobile nav dropdowns
   */
  const navDropdowns = document.querySelectorAll('.navbar .dropdown > a');

  navDropdowns.forEach(el => {
    el.addEventListener('click', function(event) {
      if (document.querySelector('.mobile-nav-active')) {
        event.preventDefault();
        this.classList.toggle('active');
        this.nextElementSibling.classList.toggle('dropdown-active');

        let dropDownIndicator = this.querySelector('.dropdown-indicator');
        dropDownIndicator.classList.toggle('bi-chevron-up');
        dropDownIndicator.classList.toggle('bi-chevron-down');
      }
    })
  });

  /**
   * Scroll top button
   */
  const scrollTop = document.querySelector('.scroll-top');
  if (scrollTop) {
    const togglescrollTop = function() {
      window.scrollY > 100 ? scrollTop.classList.add('active') : scrollTop.classList.remove('active');
    }
    window.addEventListener('load', togglescrollTop);
    document.addEventListener('scroll', togglescrollTop);
    scrollTop.addEventListener('click', window.scrollTo({
      top: 0,
      behavior: 'smooth'
    }));
  }

  /**
   * Initiate glightbox
   */
  const glightbox = GLightbox({
    selector: '.glightbox'
  });

  /**
   * Porfolio isotope and filter
   */
  let portfolionIsotope = document.querySelector('.portfolio-isotope');

  if (portfolionIsotope) {

    let portfolioFilter = portfolionIsotope.getAttribute('data-portfolio-filter') ? portfolionIsotope.getAttribute('data-portfolio-filter') : '*';
    let portfolioLayout = portfolionIsotope.getAttribute('data-portfolio-layout') ? portfolionIsotope.getAttribute('data-portfolio-layout') : 'masonry';
    let portfolioSort = portfolionIsotope.getAttribute('data-portfolio-sort') ? portfolionIsotope.getAttribute('data-portfolio-sort') : 'original-order';

    window.addEventListener('load', () => {
      let portfolioIsotope = new Isotope(document.querySelector('.portfolio-container'), {
        itemSelector: '.portfolio-item',
        layoutMode: portfolioLayout,
        filter: portfolioFilter,
        sortBy: portfolioSort
      });

      let menuFilters = document.querySelectorAll('.portfolio-isotope .portfolio-flters li');
      menuFilters.forEach(function(el) {
        el.addEventListener('click', function() {
          document.querySelector('.portfolio-isotope .portfolio-flters .filter-active').classList.remove('filter-active');
          this.classList.add('filter-active');
          portfolioIsotope.arrange({
            filter: this.getAttribute('data-filter')
          });
          if (typeof aos_init === 'function') {
            aos_init();
          }
        }, false);
      });

    });

  }

  /**
   * Init swiper slider with 1 slide at once in desktop view
   */
  new Swiper('.slides-1', {
    speed: 600,
    loop: true,
    autoplay: {
      delay: 5000,
      disableOnInteraction: false
    },
    slidesPerView: 'auto',
    pagination: {
      el: '.swiper-pagination',
      type: 'bullets',
      clickable: true
    },
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    }
  });

  /**
   * Init swiper slider with 2 slides at once in desktop view
   */
  new Swiper('.slides-2', {
    speed: 600,
    loop: true,
    autoplay: {
      delay: 5000,
      disableOnInteraction: false
    },
    slidesPerView: 'auto',
    pagination: {
      el: '.swiper-pagination',
      type: 'bullets',
      clickable: true
    },
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
    breakpoints: {
      320: {
        slidesPerView: 1,
        spaceBetween: 20
      },

      1200: {
        slidesPerView: 2,
        spaceBetween: 20
      }
    }
  });

  /**
   * Initiate pURE cOUNTER
   */
  new PureCounter();

  /**
   * Animation on scroll function and init
   */
  function aos_init() {
    AOS.init({
      duration: 800,
      easing: 'slide',
      once: true,
      mirror: false
    });
  }
  window.addEventListener('load', () => {
    aos_init();
  });

});


// add show/hidden functionality to the registration form

  document.getElementById('togglePassword').addEventListener('click', function () {
    const passwordInput = document.getElementById('password');
    
    if (passwordInput.type === 'password') {
      passwordInput.type = 'text';
      this.textContent = 'Hide';
    } else {
      passwordInput.type = 'password';
      this.textContent = 'Show';
    }
  });


  // redirection, handling

  $(document).ready(function() {
    // Attach a submit event handler to the form
    $('form.registration-form').submit(function(event) {
      event.preventDefault(); // Prevent the default form submission
  
      // Get the form data and submit it using AJAX
      var formData = $(this).serialize();
      $.ajax({
        type: 'POST',
        url: 'http://127.0.0.1:8001/api/users',
        data: formData,
        success: function(response) {
          // Check if the response indicates success and contains a redirect URL
          if (response.message === 'User created successfully' && response.redirect_url) {
            // Redirect to the specified URL
            window.location.href = response.redirect_url;
          }
        },
        error: function(error) {
          // Handle the error if needed
          console.error('Error:', error);
        }
      });
    });
  });
  

  // //handling registration form

  // // document.getElementById('register').addEventListener('click', function () {
  // //   const formData = {
  // //     firstname: document.getElementById('firstname').value,
  // //     lastname: document.getElementById('lastname').value,
  // //     matricule: document.getElementById('matricule').value,
  // //     email: document.getElementById('email').value,
  // //     phone: document.getElementById('phone').value,
  // //     password: document.getElementById('password').value
  // //   };
    
  // //   axios.post('http://127.0.0.1:8001/api/users', formData)
  // //     .then(response => {
  // //       // Handle successful response
  // //       console.log(response.data);
  // //       // Redirect to a success page or perform other actions
  // //     })
  // //     .catch(error => {
  // //       // Handle error
  // //       console.error(error);
  // //       // Display error message or perform other error handling
  // //     });
  // // });


  // document.getElementById('register').addEventListener('submit', async function(event) {
  //   event.preventDefault();
  //   console.log('Form submitted')

  //   const formData = new FormData(this);
  //   const response = await fetch('http://127.0.0.1:8000/api/users', {
  //     method: 'POST',
  //     body: formData
  //   });

  //   if (response.ok) {
  //     const responseData = await response.json();
  //     // Handle success response
  //     console.log('User created successfully:', responseData);
  //     // You can show a success message to the user here
  //   } else {
  //     // Handle error response
  //     console.error('Error submitting form');
  //     // You can show an error message to the user here
  //   }
  // });

  // document.getElementById('togglePassword').addEventListener('click', function() {
  //   const passwordInput = document.getElementById('password');
  //   if (passwordInput.type === 'password') {
  //     passwordInput.type = 'text';
  //     this.textContent = 'Hide';
  //   } else {
  //     passwordInput.type = 'password';
  //     this.textContent = 'Show';
  //   }
  // });