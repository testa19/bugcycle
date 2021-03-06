// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .
$(function() {
  $(document).on('click', '.sorting a, .pagination a', function() {
    history.pushState(null, document.title, this.href);
  });

  $(document).on('submit', '#search-frm', function() {
    history.pushState(null, document.title, $("#search-frm").attr("action") + "?" + $("#search-frm").serialize());
  });

  $(document).on('change', '#filter-form :checkbox', function() {
    $( 'form#filter-form' ).trigger("submit.rails"); 
    history.pushState(null, document.title, $("#filter-form").attr("action") + "?" + $("#filter-form").serialize());
  });

  $("#filter-form").submit(function() {
    history.pushState(null, document.title, $("#filter-form").attr("action") + "?" + $("#filter-form").serialize());
  });

  $(window).bind("popstate", function() {
      $.getScript(location.href);
      $("input#search").val(new URLSearchParams(window.location.search).get('search'));
    });
});