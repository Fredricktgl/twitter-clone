$(document).on("turbolinks:load", function(){

  $('textarea').click(function () {
    $(this).animate({ height: "6em"}, 200); 
  });
  
})

