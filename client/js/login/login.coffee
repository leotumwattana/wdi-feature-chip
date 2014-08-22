loginUser = (email, password) ->
  Meteor.loginWithPassword email, password, (error) ->
    if error
      console.log "Error logging in"
    else
      console.log "Logged in as:"
      console.log Meteor.user()

Template.login.events
  'submit form': (e, t) ->
    e.preventDefault()
    email = t.find('#accounts-email').value
    password = t.find('#accounts-password').value
    loginUser(email, password)
    false

  'click .register': (e, t) ->
    e.preventDefault()
    Session.set 'email', t.find('#accounts-email').value
    Router.go 'register'
    false

Template.login.helpers
  email: -> Session.get 'email'
