(function() {
  $('.grid__item').each(function(i, obj) {
    $(this).tooltip({
      track: true
    });
  });

  $('.drop-area__item').each(function(i, obj) {
    $(this).tooltip({
      track: true
    });
    $(this).html(" ⋆ ");
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
