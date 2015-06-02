{$, $$, SelectListView} = require 'atom-space-pen-views'

describe "CSS Edit Groups", ->
  [selectList, items, list, filterEditorView] = []

  beforeEach ->
    items = [
      ["A", "Alpha"], ["B", "Bravo"], ["C", "Charlie"],
      ["D", "Delta"], ["E", "Echo"], ["F", "Foxtrot"]
    ]

    selectList = new SelectListView
    selectList.setMaxItems(4)
    selectList.getFilterKey = -> 1
    selectList.viewForItem = (item) ->
      $$ -> @li item[1], class: item[0]

    selectList.confirmed = jasmine.createSpy('confirmed hook')
    selectList.cancelled = jasmine.createSpy('cancelled hook')

    selectList.setItems(items)
    {list, filterEditorView} = selectList

  describe "when an array is assigned", ->
    it "populates the list with up to maxItems items, based on the liForElement function", ->
      expect(list.find('li').length).toBe selectList.maxItems
      expect(list.find('li:eq(0)')).toHaveText 'Alpha'
      expect(list.find('li:eq(0)')).toHaveClass 'A'

  describe "viewForItem(item)", ->
    it "allows raw DOM elements to be returned", ->
      selectList.viewForItem = (item) ->
        li = document.createElement('li')
        li.classList.add(item[0])
        li.innerText = item[1]
        li

      selectList.setItems(items)

      expect(list.find('li').length).toBe selectList.maxItems
      expect(list.find('li:eq(0)')).toHaveText 'Alpha'
      expect(list.find('li:eq(0)')).toHaveClass 'A'
      expect(selectList.getSelectedItem()).toBe items[0]

    it "allows raw HTML to be returned", ->
      selectList.viewForItem = (item) ->
        "<li>#{item}</li>"

      selectList.setItems(['Bermuda', 'Bahama'])

      expect(list.find('li:eq(0)')).toHaveText 'Bermuda'
      expect(selectList.getSelectedItem()).toBe 'Bermuda'
