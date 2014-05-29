CsseditGroupsView = require './cssedit-groups-view'

module.exports =
  csseditGroupsView: null

  activate: (state) ->
    @csseditGroupsView = new CsseditGroupsView()
