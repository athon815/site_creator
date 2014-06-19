// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .

$(function(){ $(document).foundation(); });

    var key = "draft",
        contentEl = document.getElementById("content");

    $(document).ready(function() {
        function checkPosition() {
            if ($(this).scrollTop() > 200) {
                $('.go-top').fadeIn(500);
            } else {
                $('.go-top').fadeOut(300);
            }
        }
        // Show or hide the sticky footer button
        $(window).scroll(checkPosition);

        // Animate the scroll to top
        $('.go-top').click(function(event) {
            event.preventDefault();

            $('html, body').animate({scrollTop: 100}, 300);
        })

        checkPosition();
    }); //btw i dont really know what some of this means. go over it when meet with chris or ryan!!



    $("#change").on('keyup',function(){
      $("#section_body").val($("#section").html());
    });

    // step1: figure out keyup function to update hidden fields
    // step2: figure out how to have default values section.body
    // step3: edit page, replace html @page.sections.each do |section| 
    // 