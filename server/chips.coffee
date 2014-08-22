Meteor.methods
  use_chip: (userId, dev) ->
    Meteor.users.update({ _id: userId, 'profile.chips.dev': dev }, { $set: { 'profile.chips.$.used': true }})