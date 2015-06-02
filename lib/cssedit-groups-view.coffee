{SelectListView,$$} = require 'atom-space-pen-views'

module.exports =

class CsseditGroupsView extends SelectListView

    initialize: (serializeState) ->
        super
        @addClass('overlay from-top task-list')
        atom.commands.add 'atom-workspace', 'cssedit-groups:toggle', => @.toggle()


    hide: ->
        @panel?.hide()


    # You need to implement the `cancelled` method and hide.
    cancelled: ->
        @hide()


    confirmed: ({name, jQuery}) ->
        @cancel()
        # do something with the result


    show: ->
        editor = atom.workspace.getActiveTextEditor()
        if editor
            editorBuffer = editor.buffer
            # Now you will add your select list as a modal panel to the workspace
            @panel ?= atom.workspace.addModalPanel(item: this)
            @panel.show()

            @storeFocusedElement()

            matcher = /@group.*(?=\*)/g
            groups = [] # TODO: build items
            if editorBuffer.cachedText and editorBuffer.cachedText.match(matcher)
                for match in editorBuffer.cachedText.match(matcher)
                    groups.push( match )
                @setItems(groups)
            else
                @setItems([ 'No groups found' ])

            @focusFilterEditor()


    viewForItem: (item) ->
        $$ ->
            @li =>
                @div class: 'group-item', item


    confirmed: (item) ->
        editor = atom.workspace.getActivePaneItem()
        ebuffer = editor.buffer
        if item != "No Tasks Found"
            itemIndex = ebuffer.cachedText.indexOf( item )
            bufferP = ebuffer.positionForCharacterIndex( itemIndex )
            editor.setCursorBufferPosition( bufferP )
        @cancel()


    toggle: ->
      # Toggling now checks panel visibility,
      # and hides / shows rather than attaching to / detaching from the DOM.
      if @panel?.isVisible()
        @cancel()
      else
        @show()
