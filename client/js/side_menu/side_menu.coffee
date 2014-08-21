Template.side_menu.events
  'click #logout-button': (e, t) ->
    e.preventDefault()
    Meteor.logout()
    false

  'click #profile-button': (e, t) ->
    e.preventDefault()
    Router.go 'profile'
    false
