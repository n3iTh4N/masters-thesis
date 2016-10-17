$ ->
  $(".generateButton").click ->
    console.log($("#teams").val())
    App.teacher.generateLayout(
      $("#teams").val(),
      $("#ppteam").val(),
      $("#questions").val()
    )
