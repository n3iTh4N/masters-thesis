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
