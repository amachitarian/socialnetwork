// Place all the behaviors and hooks related to the matching controller here.
//All this logic will automatically be available in application.js.
//  You can use CoffeeScript in this file: http://coffeescript.org/
function follow(url, id, button) {
  console.log(button);
  var method = $(button).hasClass("unfollow") ? "DELETE" : "POST";
  console.log(method);

  $.ajax({
    method: method,
    url: url + ".json"
  })
    .done(function(response) {
      $(button).toggleClass("unfollow");
      $(button).toggleClass("btn-warning");
      $(button).toggleClass("btn-default");
      var href = $(button).attr("href");
      if (method === "POST") {
        href = href.replace("/follow", "/unfollow");
        $(button).html("Unfollow");
         console.log(response.followers.length)
        $("#follow-count-" + id).html(response.followers.length);
      } else {
        href = href.replace("/unfollow", "/follow");
        $(button).html("Follow");
        console.log(response.followers.length)
        $("#follow-count-" + id).html(response.followers.length);
      }
      $(button).attr("href", href);
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
    follow(href, user_id, this);
    e.preventDefault();
  });
});
