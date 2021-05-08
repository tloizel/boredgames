const initLightBox = () => {


  const modal = document.querySelector("#lol");
  const img_modal = document.querySelector("#lol2");
  const show_images = document.querySelectorAll(".img_tag");

  show_images.forEach((image) => {
    image.addEventListener('click', () => {
      console.log( image.dataset.img)
      img_modal.src = image.dataset.img;
      modal.style.display = "block";
    });
  });

  modal.addEventListener('click', () => {
    modal.style.display= "none"
  })

};

export { initLightBox };
