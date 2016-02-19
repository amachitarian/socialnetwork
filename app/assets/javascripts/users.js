// Place all the behaviors and hooks related to the matching controller here.
//All this logic will automatically be available in application.js.
//  You can use CoffeeScript in this file: http://coffeescript.org/
function follow(url, id) {
  $.ajax({
    method: "POST",
    url: url + ".json"
  })
    .done(function(response) {
      $("#follow-count-" + id).animate({"background-color": "#5cb85c" }, 2000).html(response.followers.length);
    })

    // .fail(function( xhr ) {
    //   console.log(xhr.responseJSON);
    //   var response = xhr.responseJSON;
    //   var error_message = $("<span/>");
    //   error_message.addClass("error");
    //   error_message.html(response.errors.post[0]);
    //   error_message.insertAfter($("#post-counter-" + id));
    // });
}


$(document).ready(function() {
  $(".follow").click(function(e) {
    var href = $(this).attr("href");
    var user_id = $(this).attr("data-user-id");
    follow(href, user_id);
    e.preventDefault();
  });
});
