App.teacher = App.cable.subscriptions.create "TeacherChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    console.log("we made it back")
    # alert("hey")

    # if data came from generateLayout
    if data['from'] == "generateLayout"
      $("#generationPane").html(data['generatedLayout'])
      $.getScript("/jsdrag/modernizr.custom.js")
      $.getScript("/jsdrag/draggabilly.pkgd.min.js")
      $.getScript("/jsdrag/dragdrop.js")
      $.getScript("/jsdrag/dynamic.js")

    if data['from'] == "saveLinks"
      console.log(data['message'])

  saveLinks: (links, from) ->
    @perform 'saveLinks',
    links: links,
    from: from


  generateLayout: (teams, ppteam, questions, from) ->
    @perform 'generateLayout',
    teams: teams,
    ppteam: ppteam,
    questions: questions,
    from: from
