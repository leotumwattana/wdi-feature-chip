Router.configure
  layoutTemplate: 'basic_layout'

Router.map ->
  @route 'login',
    path: '/'

  @route 'register'

  @route 'users'

  @route 'user'

autoLogin = (pause) ->
  Router.go 'user' if Meteor.userId()

requireLogin = (pause) ->
  Router.go '/' unless Meteor.userId()

Router.onBeforeAction autoLogin,
  only: ['login', 'register']

Router.onBeforeAction requireLogin,
  except: ['login', 'register']
