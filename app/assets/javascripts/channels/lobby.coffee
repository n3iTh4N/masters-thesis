App.lobby = App.cable.subscriptions.create "LobbyChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel

    if data['from'] == "submitLobby"
      console.log("gotBackFromSubmitLobby")
      console.log($(".submitLobby").attr("clicked"))
      $(".submitLobby").attr("hidden",false)

    # alert(data)
    if data['from'] == "pickTeam"
      console.log(data['teamButton'])
      console.log(data['student'])
      console.log(data['i'])
      console.log(data['j'])
      console.log(data['x'])
      console.log(JSON.stringify(data['y']))

      # reset the previously owned team if any
      for x in $(".pickTeamButton")
        if "#{x.value}" == "#{data['x']}"
          console.log("a previously owned button detected")
          x.value = x.id

      # change button label to be owned by current_student
      $("##{data['teamButton']}").val(data['x'])

      # change the studentAttr label
      $("#studentAttr").html(JSON.stringify(data['y']))

    if data['from'] == "correctanswer"
      console.log("after processing answer")
      console.log(data['nextc'])
      console.log(data['next'])
      console.log(data['question_id'])
      console.log(data['question_answer'])
      console.log(data['person_answer'])
      console.log(data['verdict'])
      console.log(data['next'])
      console.log("cookies")
      console.log(data['student_cookie'])
      console.log($("#student-cookie").val())

      if $("#student-cookie").val() == data['student_cookie']
        $("#questionPane").html("<font class='cute-question-number'>question " + data['next'] + "</font><br/><font class='cute-header-formal'>" + data['nextc'] + "</font>")

        $(".answerButton").attr("series",data['next'])

        # reset drop-area__item colors and ans property
        for x in $('.drop-area__item')
          # console.log(x.style.backgroundColor)
          x.style.backgroundColor = 'rgba(0, 0, 0, 0.09)'
          x.setAttribute("ans", "0");

    if data['from'] == "wronganswer"
      if $("#student-cookie").val() == data['student_cookie']
        alert("Incorrect answer. Please try again.")

  enter: (student)->
    @perform 'enter', student: student

  submitLobby: (from) ->
    @perform 'submitLobby',
    from: from

  answer: (game_id, team_id, player_number, series, answerText, studentCookie) ->
    @perform 'answer',
    game_id: game_id,
    team_id: team_id,
    player_number: player_number,
    series: series
    answerText: answerText
    studentCookie: studentCookie

  pickTeam: (pickedTeam, i, j)->
    @perform 'pickTeam',
    teamButton: pickedTeam,
    student: $('#student-cookie').val(),
    i: i,
    j: j

  leave: ->
    @perform 'leave'
