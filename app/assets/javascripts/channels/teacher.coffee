App.teacher = App.cable.subscriptions.create "TeacherChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    console.log("we made it back")
    # alert("hey")
    $("#generationPane").html(data['generatedLayout'])
    $.getScript("/jsdrag/modernizr.custom.js")
    $.getScript("/jsdrag/draggabilly.pkgd.min.js")
    $.getScript("/jsdrag/dragdrop.js")
    $.getScript("/jsdrag/dynamic.js")

  generateLayout: (teams, ppteam, questions) ->
    @perform 'generateLayout',
    teams: teams,
    ppteam: ppteam,
    questions: questions
