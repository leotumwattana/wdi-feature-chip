UI.registerHelper 'chip_image', (chip) -> chip.img

UI.registerHelper 'name', ->
  Meteor.user().profile.name if Meteor.user()

UI.registerHelper 'chip_used', (chip) ->
  "used" if chip.used

