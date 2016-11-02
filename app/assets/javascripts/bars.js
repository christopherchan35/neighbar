// $(document).on('turbolinks:load', function(){
// })

$(document).ready(function(){
  newFormListener();
})

var newFormListener = function(){
  $('#new_bar').on('ajax:success', function(event, response){
    console.log("ajax")
    console.log(response);
  })
}
