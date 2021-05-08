// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { initStarRating } from '../plugins/init_star_rating';
import { initSwiper } from '../plugins/init_swiper';
import { initLightBox } from '../plugins/init_light_box_vanilla';



// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

//remove google sign in hash
var href = window.location.href;
if (href[href.length - 1] === "#") {
  if (typeof window.history.replaceState == "function") {
    history.replaceState({}, "", href.slice(0, -1));
  }
}

const changeBtnState = () => {
  const deliveryInput = document.getElementById('deliveryInput')
  const deliveryBtn = document.getElementById('deliveryBtn')

  deliveryInput.addEventListener('click', () => {
    deliveryBtn.disabled = false;
    console.log('hye')
  });
}


document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  initMapbox();
  initAutocomplete();
  initStarRating();
  initSwiper();
  initLightBox();
  changeBtnState();
});


