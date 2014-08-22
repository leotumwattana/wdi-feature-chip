slideOpen = (target) ->
  $(target).transit { x: "-35%" }

slideClose = (target) ->
  $(target).transit { x: "0" }

Template.user_detail.rendered = ->
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

Template.user_detail.events
  'click .back-button': (e, t) ->
    e.preventDefault()
    Router.go 'users'
    false

Template.user_detail.helpers
  user: -> Meteor.user()

UI.registerHelper 'name', ->
  Meteor.user().profile.name if Meteor.user()
