Router.configure
  layoutTemplate: 'basic_layout'

Router.map ->
  @route 'login',
    path: '/'

  @route 'register'

  @route 'users'

  @route 'user'
