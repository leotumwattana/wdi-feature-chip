SlidePercentage = '80%'

slideOpen = ->
  $('#users-view').transit { x: '80%' }

slideClose = ->
  $('#users-view').transit { x: '0' }

toggleSlide = ->
  if $('#users-view').css('x') == SlidePercentage
    slideClose()
  else
    slideOpen()

Template.users.helpers
  users: ->
    Meteor.users.find {}, { sort: { 'profile.name': 1 } }

Template.users.events
  'click .settings-button': (e, t) ->
    e.preventDefault()
    toggleSlide()
    false

  'click .user': (e, t) ->
    e.preventDefault()
    userId = $(e.currentTarget).data('user-id')
    console.log userId
    Router.go '/user/' + userId
    false