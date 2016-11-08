  $ ->

    window.broadcastSubmitLobbyClick = () ->
      console.log("submitLobby clicked being broadcasted!")
      App.lobby.submitLobby(
        "submitLobby"
      )

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
        console.log($("#student-cookie").val())
        console.log($(".answerText").val())
        console.log($(this).attr("game_id"))
        console.log($(this).attr("team_id"))
        console.log($(this).attr("player_number"))
        console.log($(this).attr("series"))

        # add params in order
        App.lobby.answer(
          $(this).attr("game_id"),
          $(this).attr("team_id"),
          $(this).attr("player_number"),
          $(this).attr("series"),
          $(".answerText").val(),
          $("#student-cookie").val()
        )
