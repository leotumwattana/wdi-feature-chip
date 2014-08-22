slideOpen = (target) ->
  $(target).transit { x: "-35%" }

slideClose = (target) ->
  $(target).transit { x: "0" }

Template.chip.rendered = ->
  $('.chip').swipe
    swipeLeft: (e) ->
      e.preventDefault()
      slideOpen(e.currentTarget)
      false
    swipeRight: (e) ->
      e.preventDefault()
      slideClose(e.currentTarget)
      false
    tap: (e) ->
      e.preventDefault()
      slideClose(e.currentTarget)
      false

