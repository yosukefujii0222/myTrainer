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
//= require_tree .

$(function() {

  $('.signup-show').click(function(){
    $('#signup-modal').fadeIn();
  })

  $('#login-show').click(function(){
    $('#login-modal').fadeIn();
  })

  $('#pay-show').click(function(){
    $('#pay-modal').fadeIn();
  })

  $('.close-modal').click(function(){
    $('#signup-modal').fadeOut();
    $('#login-modal').fadeOut();
    $('#pay-modal').fadeOut();
  })
})


$(function(){

  function buildHTML(chat){
    var html = `<div class="chat-body-left">
                  <div class="chat-body-container">
                    <div class="sender-info">
                      <span>${chat.trainer}</span>
                      <span>${chat.date}</span>
                    </div>
                    <div class="chat-body">
                      <span>${chat.body}</span>
                    </div>
                  </div>
                  <div class="clear"></div>
                </div>
                <div class="clear"></div>`
    return html;
  }

  $('#trainer_post').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })

    .done(function(data){
      var html = buildHTML(data);
      $('.chat-body-wrapper').append(html)
      $('.input-body').val('')
      $('html, body').animate({
        scrollTop: $(document).height()
      }, 1500);
      return false;
    })
    .fail(function(){
      alert('error');
    })
  })
})

$(function(){

  function buildHTML(chat){
    var html = `<div class="chat-body-right">
                  <div class="chat-body-container">
                    <div class="sender-info">
                      <span>${chat.user}</span>
                      <span>${chat.date}</span>
                    </div>
                    <div class="chat-body">
                      <span>${chat.body}</span>
                    </div>
                  </div>
                  <div class="clear"></div>
                </div>
                <div class="clear"></div>`
    return html;
  }

  $('#user_post').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.chat-body-wrapper').append(html)
      $('.input-body').val('')
      $('html, body').animate({
        scrollTop: $(document).height()
      }, 1500);
      return false;
    })
    .fail(function(){
      alert('error');
    })
  })
})

$(function(){
  var element = document.getElementById("chat_id");
  var positionY = element.offsetTop;
  element.scrollTo(0, positionY);
})

