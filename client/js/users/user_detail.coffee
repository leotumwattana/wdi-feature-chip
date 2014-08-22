Template.user_detail.events
  'click .back-button': (e, t) ->
    e.preventDefault()
    Router.go 'users'
    false

  'click .user-button': (e, t) ->
    e.preventDefault()
    Router.go 'profile'
    false

Template.user_detail.helpers
  user: -> Meteor.user()
  chips: -> Meteor.user().profile.chips if Meteor.user()
