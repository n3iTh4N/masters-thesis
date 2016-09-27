  $ ->
    $(".pickTeamButton").click ->
      # alert($('#student-cookie').val())
      # alert($(this).attr("value"))

      if $(this).attr("value") == $(this).attr("id")

        App.lobby.pickTeam(
          $(this).attr("value"),
          $(this).attr("i"),
          $(this).attr("j")
        )

    $(".answerButton").click ->
        alert($("#student-cookie").val())
        alert($(".answerText").val())
        alert($(this).attr("game_id"))
        alert($(this).attr("team_id"))
        alert($(this).attr("player_number"))
        alert($(this).attr("series"))

        # add params in order
        App.lobby.answer(
          $(this).attr("game_id"),
          $(this).attr("team_id"),
          $(this).attr("player_number"),
          $(this).attr("series"),
          $(".answerText").val(),
          $("#student-cookie").val()
        )
