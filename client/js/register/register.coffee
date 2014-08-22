passwordIsValid = (password) ->
  password.length >= 4

passwordIsConfirmed = (password, confirm) ->
  password == confirm

createUser = (email, password) ->
  Accounts.createUser {
    email: email
    password: password
    profile:
      name: email
      chips: [
        {
          used: false
          dev: 'harry'
        },
        {
          used: false
          dev: 'leo'
        }
      ]
  }, (error) ->
    if error
      console.log "Error creating user"
    else
      Router.go 'profile'

Template.register.helpers
  email: -> Session.get 'email'

Template.register.events
  'submit form': (e, t) ->
    e.preventDefault()
    email = t.find('#accounts-email').value
    password = t.find('#accounts-password').value
    confirm = t.find('#accounts-confirm').value

    if passwordIsValid(password) && passwordIsConfirmed(password, confirm)
      createUser(email, password)
    else
      console.log "Password Problem"
    false

  'click .back': (e, t) ->
    e.preventDefault()
    Router.go '/'
    false
