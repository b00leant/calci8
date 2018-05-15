// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require jquery.turbolinks
//= require moment.min
//= require moment.locales
//= require draggabilly.pkgd.min
//= require mdDateTimePicker
//= require materialize
//= require turbolinks
//= require_tree .

document.addEventListener('turbolinks:load', function() {
  elem = document.querySelector('.sidenav-sidenav');
  instance = new M.Sidenav(elem, {});
  elem2 = document.querySelector('.notification-sidenav');
  instance2 = new M.Sidenav(elem2, {edge: 'right'});
  $('.tabs').tabs({
      //swipeable : true,
      //responsiveThreshold : 1920
    });
  $('.collapsible').collapsible();

});
document.addEventListener('turbolinks:before-visit', function() {
  elem = document.querySelector('.sidenav-sidenav');
  elem2 = document.querySelector('.notification-sidenav');
  instance2 = M.Sidenav.getInstance(elem2);
  if (instance2){
    instance2.destroy();
  }
  instance = M.Sidenav.getInstance(elem);
  if (instance){
    instance.destroy();
  }
});
