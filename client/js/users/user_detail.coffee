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
  user: ->
    Meteor.users.findOne(Router.current().params._id)
  chips: ->
    user = Meteor.users.findOne(Router.current().params._id)
    user.profile.chips if user
