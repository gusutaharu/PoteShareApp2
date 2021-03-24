$(function(){
  $('.nav-trigger').click(function(){
    var $menu = $('.header-nav-menu');
    if ($menu.hasClass('open')){
      $menu.removeClass('open');
      $menu.css('display','none');
    }else{
      $menu.addClass('open');
      $menu.css('display','block');
    }
  });
});