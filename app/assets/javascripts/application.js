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
  var spy_elems = document.querySelectorAll('.scrollspy');
  var spy_instances = M.ScrollSpy.init(spy_elems, {});
  var tip_elems = document.querySelectorAll('.tooltipped');
  var tip_instances = M.Tooltip.init(tip_elems, {
    position: "top",
    delay:1
  });
  modal_elems = document.querySelectorAll('.modal');
  modal_instances = M.Modal.init(modal_elems, {});
  var fab_elems = document.querySelectorAll('.fixed-action-btn');
  var fab_instances = M.FloatingActionButton.init(fab_elems, {direction:'left'});
  sidenav_elem = document.querySelector('.sidenav-sidenav');
  sidenav_instance = new M.Sidenav(sidenav_elem, {});
  notification_elem = document.querySelector('.notification-sidenav');
  notification_instance = new M.Sidenav(notification_elem, {edge: 'right'});
  $('.tabs').tabs({
      //swipeable : true,
      //responsiveThreshold : 1920
    });
  $('.collapsible').collapsible();
  $('.modal-content a').click(function(){
    if(modal_instances)
      console.log(modal_instances[0].destroy());
  });
});
document.addEventListener('turbolinks:before-cache', function() {
  sidenav_elem = document.querySelector('.sidenav-sidenav');
  notification_elem = document.querySelector('.notification-sidenav');
  notification_instance = M.Sidenav.getInstance(notification_elem);
  if (notification_instance){
    notification_instance.destroy();
  }
  sidenav_instance = M.Sidenav.getInstance(sidenav_elem);
  if (sidenav_instance){
    sidenav_instance.destroy();
  }
  modal_elems = document.querySelectorAll('.modal');
  modal_instances = M.Modal.getInstance(modal_elems, {});
  if(modal_instances){
    modal_instances.destroy();
  }
});
