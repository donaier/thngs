window.addEventListener("turbolinks:load", () => {
  $('.quasi-modal .overlay').click( function(){
      $('.quasi-modal').removeClass('active')
    }
  );
});
