updateUsername = (name) ->
  Meteor.users.update Meteor.userId(), { $set: { 'profile.name': name } }

Template.profile.events
  'click .done-button': (e, t) ->
    e.preventDefault()
    Router.go '/user/' + Meteor.userId()
    false

  'keyup #profile-name': (e, t) ->
    e.preventDefault()
    updateUsername(e.currentTarget.value)
    false

  'click .logout-button': (e, t) ->
    e.preventDefault()
    Meteor.logout()
    false

Template.profile.helpers
  username: ->
    user = Meteor.user()
    user.profile.name if user
