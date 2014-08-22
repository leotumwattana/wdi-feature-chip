UI.registerHelper 'chip_image', (chip) -> chip.img

UI.registerHelper 'name', (user) ->
  user.profile.name if user

UI.registerHelper 'email', (user) ->
  user.emails[0].address if user

UI.registerHelper 'chip_used', (chip) ->
  "used" if chip.used

