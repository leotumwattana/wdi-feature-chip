Template.users.events
  'click .settings-button': (e, t) ->
    e.preventDefault()
    Router.go '/'
    false

  'click .user': (e, t) ->
    e.preventDefault()
    Router.go '/user'
    false