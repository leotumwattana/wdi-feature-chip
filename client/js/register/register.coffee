Template.register.events
  'click .login': (e, t) ->
    e.preventDefault()
    Router.go '/'
    false