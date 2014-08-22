Router.configure
  layoutTemplate: 'basic_layout'
  loadingTemplate: 'loading'

Router.map ->
  @route 'login',
    path: '/'

  @route 'register'

  @route 'users',
    waitOn: ->
      Meteor.subscribe 'users'

  @route 'user',
    path: 'user/:_id'
    template: 'user_detail'
    onBeforeAction: ->
      unless this.params._id == Meteor.userId()
        Router.go 'users'
    waitOn: ->
      Meteor.subscribe 'users'

  @route 'profile'

autoLogin = (pause) ->
  Router.go "/user/#{Meteor.userId()}" if Meteor.userId()

requireLogin = (pause) ->
  Router.go '/' unless Meteor.userId()

Router.onBeforeAction autoLogin,
  only: ['login', 'register']

Router.onBeforeAction requireLogin,
  except: ['login', 'register']

Router.onBeforeAction('loading')
