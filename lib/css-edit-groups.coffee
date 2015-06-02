CsseditGroupsView = require './css-edit-groups-view'

module.exports =
  csseditGroupsView: null

  activate: (state) ->
    @csseditGroupsView = new CsseditGroupsView()
