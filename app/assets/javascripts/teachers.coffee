$ ->

  $(".generateButton").click ->
    console.log($("#teams").val())
    App.teacher.generateLayout(
      $("#teams").val(),
      $("#ppteam").val(),
      $("#questions").val(),
      "generateLayout"
    )

  $(".grid__item").hover ->
    # console.log($(this).attr("qid"))

  window.saveLinks = (links) ->
    # console.log(game_id)
    App.teacher.saveLinks(
      links,
      "saveLinks"
    )
