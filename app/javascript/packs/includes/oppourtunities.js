$(function(){

  $("#toggleDetails").on("click", function(){
    var details = $("#opp-details"); 
    
    details.toggleClass("open");
    if(details.hasClass("open")){
      $(this).text("Show less")
    } else {
      $(this).text("Show more")
    }


  });

  $("#send-message-to-user").on("click", function(){
    var user_id = $("#user_id").val(),
        first_name = $("#message-first-name").val(),
        last_name = $("#message-last-name").val(),
        email = $("#message-email").val(),
        message = $("#message-text").val();

    $.ajax({
      url: "/user/message",
      method: "post",
      dataType: "json",
      data: {
        user_id: user_id,
        first_name: first_name,
        last_name: last_name,
        email: email,
        message: message

      }, 
      success: function(data){
        $("#contact-modal form").remove();
        $("#send-message-to-user").remove();
        $("#contact-modal .modal-body").html("<p>Your message has been sent successfully!</p>");
        

      }
      
    });
  });

  $('#contact-modal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget); // Button that triggered the modal

    var modal = $(this);


  })
  

 

});