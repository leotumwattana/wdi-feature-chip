Router.configure
  layoutTemplate: 'basic_layout'

Router.map ->
  @route 'login',
    path: '/'

  @route 'register'

  @route 'users'

  @route 'user',
    path: 'user/:_id'
    template: 'user_detail'

  @route 'profile'

autoLogin = (pause) ->
  Router.go "/user/#{Meteor.userId()}" if Meteor.userId()

requireLogin = (pause) ->
  Router.go '/' unless Meteor.userId()

Router.onBeforeAction autoLogin,
  only: ['login', 'register']

Router.onBeforeAction requireLogin,
  except: ['login', 'register']
