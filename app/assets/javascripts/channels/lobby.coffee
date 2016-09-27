App.lobby = App.cable.subscriptions.create "LobbyChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
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
      alert("after processing answer")
      alert(data['question_id'])
      alert(data['question_answer'])
      alert(data['person_answer'])
      alert(data['verdict'])
      alert(data['next'])
      alert("cookies")
      alert(data['student_cookie'])
      alert($("#student-cookie").val())

      if $("#student-cookie").val() == data['student_cookie']
        $("#questionPane").html(data['question_id'])
        $(".answerButton").attr("series",data['next'])

    if data['from'] == "wronganswer"
      alert("wronganswer")

  enter: (student)->
    @perform 'enter', student: student

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
