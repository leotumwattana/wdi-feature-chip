slideOpen = (target) ->
  $(target).transit { x: "-35%" }

slideClose = (target) ->
  $(target).transit { x: "0" }

toggle = (target) ->
  if $(target).css('x') == '-35%'
    slideClose(target)
  else
    slideOpen(target)

useChip = (userId, dev) ->
  Meteor.call('use_chip', userId, dev)

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
      toggle(e.currentTarget)
      false

Template.chip.events
  'click .use-button': (e, t) ->
    e.preventDefault()
    userId = $(e.currentTarget).data('user-id')
    dev = $(e.currentTarget).data('dev')
    useChip(userId, dev)
    slideClose(e.currentTarget.parentNode)
    false

Template.chip.helpers
  userId: -> Router.current().params._id
