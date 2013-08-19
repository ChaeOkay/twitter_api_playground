$(document).ready(function() {
  $('form').on('submit', function(e){
    e.preventDefault();

    $('div.tweets').html('<img src="spinner.gif">')
    
    var username = $(this).serialize();


    $.ajax({
      url:  this.action,
      type: this.method,
      data: username
    }).done(function(data){

      $('div.tweets').html(data);

    });
  });
});
