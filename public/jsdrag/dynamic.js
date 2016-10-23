(function() {

  // save games
  /*
  $( ".saveGameButton" ).click(function() {
    alert( "saveGameButton clicked" );
    $('.drop-area__item').each(function(i, obj) {
      console.log("777" + $(this).attr('team') + " " + $(this).attr('playernum')
                        + " " + $(this).attr('series') + " " + $(this).attr('next')
                        + " " + $(this).attr('qid'));
    });
  });
  */

  $('.saveGameButton').unbind('click').bind('click', function (e) {

    console.log( "saveGameButton clicked");
    var links = [];
    $('.drop-area__item').each(function(i, obj) {
      /*
      x = "{'game_id': '777', " + "'team_id': " + $(this).attr('team') + ", 'player_number': " + $(this).attr('playernum')
                        + ", 'series': " + $(this).attr('series') + ", 'next': " + $(this).attr('next')
                        + ", 'qid': " + $(this).attr('qid') + "}"
                        */
      var obj = { "game_id" : $("#gameid").val(),
                  "team_id" : $(this).attr("team"),
                  "player_number" : $(this).attr("playernum"),
                  "series" : $(this).attr("series"),
                  "question_id" : $(this).attr("qid"),
                  "next" : $(this).attr("next")
      };
      // saveLink(obj.game_id, obj.team_id, obj.player_number, obj.series, obj.question_id, obj.next_);
      // push obj to links array
      links.push(obj);
    });
    // alert(links[0].game_id);
    saveLinks(links);
    saveGame($("#gamename").val(), $("#teams").val(), $("#ppteam").val());
  });

  // set tooltip to draggables
  $('.grid__item').each(function(i, obj) {
    $(this).tooltip({
      track: true
    });
  });

  // set tooltip to droppables
  $('.drop-area__item').each(function(i, obj) {
    $(this).tooltip({
      track: true
    });
    $(this).html(" ⋆ ");
  });

  // regex search for questions
  var $rows = $('#searchtable tr');
  $('#search').keyup(function() {

      var val = '^(?=.*\\b' + $.trim($(this).val()).split(/\s+/).join('\\b)(?=.*\\b') + ').*$',
          reg = RegExp(val, 'i'),
          text;

      $rows.show().filter(function() {
          text = $(this).text().replace(/\s+/g, ' ');
          return !reg.test(text);
      }).hide();
  });

  var body = document.body,
    dropArea = document.getElementById( 'drop-area' ),
    droppableArr = [], dropAreaTimeout;

  // initialize droppables
  [].slice.call( document.querySelectorAll( '#drop-area .drop-area__item' )).forEach( function( el ) {
    droppableArr.push( new Droppable( el, {
      onDrop : function( instance, draggableEl ) {

        // output the container being dragged on to and the thing being dragged
        console.log(el.id);
        console.log(draggableEl.getAttribute("qid"));

        // set the qid of the droppable to the qid of the dragged question
        $("#" + el.id).attr("qid", draggableEl.getAttribute("qid"));

        // change value of droppable to reflect dragged question
        $("#" + el.id).html(draggableEl.getAttribute("qid") + "<br/>" + draggableEl.getAttribute("content"));

        // change title of droppable to activate tooltip on hover on droppable
        console.log($("#" + el.id).attr("title", draggableEl.getAttribute("content") ));
        console.log(draggableEl);
        //$("#" + el.id).attr("title", draggableEl.getAttribute("title"));

        // output changed droppable
        console.log(el);

        var c = "";
        $('.drop-area__item').each(function(i, obj) {
          c += $(this).attr("qid");
        });
        // update checker div
        $("#checker").html(
          c
        );

        // show checkmark inside the droppabe element
        classie.add( instance.el, 'drop-feedback' );
        clearTimeout( instance.checkmarkTimeout );
        instance.checkmarkTimeout = setTimeout( function() {
          classie.remove( instance.el, 'drop-feedback' );
        }, 800 );
        // ...
      }
    } ) );
  } );

  // initialize draggable(s)
  [].slice.call(document.querySelectorAll( '#grid .grid__item' )).forEach( function( el ) {
    new Draggable( el, droppableArr, {
      draggabilly : { containment: document.body },
      onStart : function() {

        console.log(el.getAttribute("qid"));

        // add class 'drag-active' to body
        classie.add( body, 'drag-active' );
        // clear timeout: dropAreaTimeout (toggle drop area)
        clearTimeout( dropAreaTimeout );
        // show dropArea
        classie.add( dropArea, 'show' );
      },
      onEnd : function( wasDropped ) {
        var afterDropFn = function() {
          // hide dropArea
          classie.remove( dropArea, 'show' );
          // remove class 'drag-active' from body
          classie.remove( body, 'drag-active' );
        };

        if( !wasDropped ) {
          afterDropFn();
        }
        else {
          // after some time hide drop area and remove class 'drag-active' from body
          clearTimeout( dropAreaTimeout );
          dropAreaTimeout = setTimeout( afterDropFn, 400 );
        }
      }
    } );
  } );
})();
