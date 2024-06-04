/* full page carousel */
$(document).ready(function () {
    $('.owl-carousel-CustomSuit').owlCarousel({
      loop:true,
      autoplay: true,
      autoplayTimeout: 2000,
      autoplayHoverPause: true,
      margin:10,
      navText: ['<span class="fa-solid fa-angle-right" aria-hidden="true"></span>','<span class="fa-solid fa-angle-right" aria-hidden="true"></span>'],
      nav:true,
      dots: true,
      items:1,
      responsive:{
          0:{
              items:1,
              dots: false,
          },
          700:{
              items:1,
              dots: false,
              
          },
          768:{
              items:1
          }
      }
    })
  });


  $(document).ready(function () {
    $('.owl-carousel-CustomSuit2').owlCarousel({
      loop:true,
      autoplay: true,
      autoplayTimeout: 2000,
      autoplayHoverPause: true,
      margin:5,
      navText: ['<span class="fa-solid fa-angle-right fa-2xl" aria-hidden="true"></span>','<span class="fa-solid fa-angle-right fa-2xl" aria-hidden="true"></span>'],
      nav:true,
      dots: false,
      items:2.1,
      responsive:{
        0: {
          items: 1,
         
          
        },
        
        764: {
          items: 2.1,   
        },

        2652: {
          items: 2.1,
         
        

          
        },
      }
    })
  });

  $(document).ready(function () {
    $('.owl-choose-Date-and-Time').owlCarousel({
      loop:false,
      autoplay: false,
      autoplayTimeout: 2000,
      autoplayHoverPause: true,
      margin:10,
      navText: ['<span class="fa-solid fa-angle-down fa-rotate-90"></span>','<span class="fa-solid fa-angle-up fa-rotate-90"></span>'],
      nav:true,
      dots: false,
      responsive:{
          0:{
              items:3
          },
          600:{
              items:4
          },
          1000:{
              items:4
          }
      }
    })
  });
  

  $(document).ready(function () {
    $('.owl-Ready-madesingle-Product').owlCarousel({
      loop:false,
      autoplay: false,
      autoplayTimeout: 2000,
      autoplayHoverPause: true,
      margin:10,
      navText: ['<span class="fa-solid fa-angle-down fa-rotate-90"></span>','<span class="fa-solid fa-angle-up fa-rotate-90"></span>'],
      nav:true,
      dots: false,
      responsive:{
          0:{
              items:1
          },
          600:{
              items:1
          },
          1000:{
              items:1
          }
      }
    })
  });


  $(document).ready(function () {
    $('.owl-select-your-fabric').owlCarousel({
      loop:false,
      autoplay: false,
      autoplayTimeout: 2000,
      autoplayHoverPause: true,
      margin: 10,
      navText: ['<span class="fa-solid fa-angle-down fa-rotate-90"></span>','<span class="fa-solid fa-angle-up fa-rotate-90"></span>'],
      nav:true,
      dots: false,
      responsive:{
          0:{
              items:3
          },
          600:{
              items:3
          },
          1000:{
              items:3
          }
      }
    })
  });

  /////////////// navbar /////////////////

  var originalNavbar = document.getElementById('original-navbar');
  var scrolledNavbar = document.getElementById('scrolled-navbar');
  
  window.addEventListener('scroll', function () {
    if (window.pageYOffset > 75) {
      if(originalNavbar) {
        originalNavbar.style.display = 'none';
        scrolledNavbar.style.display = 'block';
      }
      
    } else {
      if(originalNavbar) {
        originalNavbar.style.display = 'block';
      scrolledNavbar.style.display = 'none';
      }
      
    }
  });
  


document.addEventListener("DOMContentLoaded", function () {
  const navbar = document.getElementById("navbar1");

  window.addEventListener("scroll", function () {
    const scrollPosition = window.scrollY;

    
    const scrollThreshold = 50;

    if (scrollPosition > scrollThreshold) {
      if(navbar) {
        navbar.classList.add("scrolled"); 
      }
      
    } else {
      if(navbar) {
        navbar.classList.remove("scrolled"); 
      }
      
    }
  });
});



document.addEventListener("DOMContentLoaded", function () {
  const navbar = document.getElementById("navbar2");

  window.addEventListener("scroll", function () {
    const scrollPosition = window.scrollY;

    
    const scrollThreshold = 0;

    if (scrollPosition > scrollThreshold) {
      if(navbar) {
        navbar.classList.add("scrolled"); 
      }
      
    } else {
      if(navbar) {
        navbar.classList.remove("scrolled"); 
      }
      
    }
  });
});

function shownavbarOffcanvaspage(idToShow) {
  // Hide all size calculators
  for (let i = 1; i <= 2; i++) {
      const navbarOffcanvaspageId = 'navbarOffcanvaspage' + i;
      document.getElementById(navbarOffcanvaspageId).style.display = 'none';
  }

  // Show the selected size calculator
  document.getElementById(idToShow).style.display = 'block';
}

/////////////// navbar end /////////////////


// Back-to-top-button 

let mybutton = document.getElementById("btn-back-to-top");
let scrollTopWhite = document.getElementById("scrollTopWhite");
let scrollTopBlack = document.getElementById("scrollTopBlack");

window.onscroll = function () {
    scrollFunction();
};

function scrollFunction() {
    let scrollPosition = document.body.scrollTop || document.documentElement.scrollTop;
    let windowHeight = window.innerHeight;
    let scrollPercentage = (scrollPosition / (document.documentElement.scrollHeight - windowHeight)) * 100;

    if (scrollPercentage > 75) {
        // Show white scroll top button and hide black scroll top button
        scrollTopWhite.classList.remove("d-none");
        scrollTopBlack.classList.add("d-none");
    } else {
        // Show black scroll top button and hide white scroll top button
        scrollTopWhite.classList.add("d-none");
        scrollTopBlack.classList.remove("d-none");
    }

    if (scrollPosition > 500) {
        mybutton.style.display = "block";
    } else {
        mybutton.style.display = "none";
    }
}

mybutton.addEventListener("click", backToTop);

function backToTop() {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
}







// gsap.registerPlugin(ScrollTrigger);
// let sections = gsap.utils.toArray(".panel");
// gsap.to(sections, {
//   xPercent: -55 * (sections.length - 1),
//   ease: "none",
//   scrollTrigger: {
//     trigger: ".element",
//     pin: true,
//     scrub: 1,
//     snap: 1 / (sections.length - 1),
//     end: () => "+=" + document.querySelector(".element").offsetWidth
//   }
// });


function newFunction(){
  var element = document.getElementById("Contactusform ");
   element.reset()
}

function priceShow(currency, price) {
  return `${currency} ${price}`;
}  