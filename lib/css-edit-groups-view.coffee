{SelectListView,$$} = require 'atom-space-pen-views'

module.exports =

class CsseditGroupsView extends SelectListView

    initialize: (serializeState) ->
        super
        @addClass('overlay from-top task-list')
        atom.commands.add 'atom-workspace', 'cssedit-groups:toggle', => @toggle()

    cancelled: ->
        @hide()

    confirmed: (item) ->
        editor = atom.workspace.getActivePaneItem()
        ebuffer = editor.buffer
        if item != "No Tasks Found"
            itemIndex = ebuffer.cachedText.indexOf( item )
            bufferP = ebuffer.positionForCharacterIndex( itemIndex )
            editor.setCursorBufferPosition( bufferP )
        @cancel()

    toggle: ->
        if @panel?.isVisible()
          @cancel()
        else
          @show()

    show: ->
        editor = atom.workspace.getActiveTextEditor()
        if editor
            editorBuffer = editor.getBuffer()
            @panel ?= atom.workspace.addModalPanel(item: this)
            @panel.show()

            @storeFocusedElement()

            matcher = /@group.*(?=\*)/g
            groups = []
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

    hide: ->
        @panel?.hide()
