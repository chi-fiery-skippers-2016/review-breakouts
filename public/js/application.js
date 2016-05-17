$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()


  //Figure out what your event will be tied - Dom class, element, id
  // What event do you want?
  // Does is need to be delegated?  Is that thing there when the page loads?
  // Decide if I need to prevent Default
  // Make ajax call
    // what route?
      // am I sending back the right things?  Partial, json, text?
    // Do I need to send data?
    // what do I do when it's done?

  $("a").on("click", function(event){
    event.preventDefault();

    var newCatUrl = $(this).attr("href");

    var request = $.ajax({
      url: newCatUrl
    });

    request.done(function(response){
      $("#catForm").append(response);
    });
  });

  $("#catForm").on("submit", "form", function(event){
    event.preventDefault();

    var createCatUrl = $(this).attr("action");

    var request = $.ajax({
      url: createCatUrl,
      method: "POST",
      dataType: "JSON",
      data: $(this).serialize()
    });

    request.done(function(response){
      $("ul").append(`<li>${response.name} - ${response.breed}</li>`);
    });

    request.fail(function(response){
      var full_messages = JSON.parse(response.responseText);

    });

  });

});
