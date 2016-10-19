$ ->

  $(".generateButton").click ->
    console.log($("#teams").val())
    App.teacher.generateLayout(
      $("#teams").val(),
      $("#ppteam").val(),
      $("#questions").val()
    )

  $(".grid__item").hover ->
    # console.log($(this).attr("qid"))
