{WorkspaceView} = require 'atom'
CsseditGroups = require '../lib/cssedit-groups'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "CsseditGroups", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('cssedit-groups')

  describe "when the cssedit-groups:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.cssedit-groups')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'cssedit-groups:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.cssedit-groups')).toExist()
        atom.workspaceView.trigger 'cssedit-groups:toggle'
        expect(atom.workspaceView.find('.cssedit-groups')).not.toExist()
