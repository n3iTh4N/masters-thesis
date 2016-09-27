App.lobby = App.cable.subscriptions.create "LobbyChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    # alert(data)

    console.log(data['teamButton'])
    console.log(data['student'])
    console.log(data['i'])
    console.log(data['j'])
    console.log(data['x'])
    console.log(JSON.stringify(data['y']))

    # reset the previously owned team if any
    for x in $(".pickTeamButton")
      if "#{x.value}" == "#{data['x']}"
        console.logs("a previously owned button detected")
        x.value = x.id

    # change button label to be owned by current_student
    $("##{data['teamButton']}").val(data['x'])

    # change the studentAttr label
    $("#studentAttr").html(JSON.stringify(data['y']))

  enter: (student)->
    @perform 'enter', student: student

  pickTeam: (pickedTeam, i, j)->
    @perform 'pickTeam',
    teamButton: pickedTeam,
    student: $('#student-cookie').val(),
    i: i,
    j: j

  leave: ->
    @perform 'leave'
