Template.login.events
  'submit form': (e, t) ->
    e.preventDefault()
    Router.go 'users'
    false
  'click .register': (e, t) ->
    e.preventDefault()
    Router.go 'register'
    false