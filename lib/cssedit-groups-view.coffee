{SelectListView,$$} = require 'atom-space-pen-views'

module.exports =

class CsseditGroupsView extends SelectListView

    initialize: (serializeState) ->
        super
        @addClass('overlay from-top task-list')
        return atom.workspaceView.command 'cssedit-groups:toggle', =>
            return @.toggle()


    attach: ->
        editor = atom.workspace.getActivePaneItem()
        if editor
            editorBuffer = editor.buffer
            if editorBuffer
                matcher = /@group.*(?=\*)/g
                groups = []
                if editorBuffer.cachedText and editorBuffer.cachedText.match(matcher)
                    for match in editorBuffer.cachedText.match(matcher)
                        groups.push( match )
                    @setItems(groups)
                else
                    @setItems([ 'No groups found' ])

                atom.workspaceView.append(this)
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
        this.cancel()


    toggle: ->
        if @.hasParent()
            @.cancel()
        else
            @.attach()
