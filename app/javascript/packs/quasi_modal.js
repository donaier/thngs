window.addEventListener("turbolinks:load", () => {
  $('.quasi-modal .overlay').on('click', function(){
    $('.quasi-modal').removeClass('active');
  });

  $('#header-logo').on('mouseenter touchstart', function(){
    $('.board-nav .overlay').addClass('active');
    $('.board-nav ul').addClass('open');
  });

  $('.board-nav .overlay').on('click', function(){
    $('.board-nav .overlay').removeClass('active');
    $('.board-nav ul').removeClass('open');
  });
});
