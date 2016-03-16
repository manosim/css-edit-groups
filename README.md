# CSS Edit Groups - Atom Package [![Build Status](https://travis-ci.org/ekonstantinidis/css-edit-groups.svg?branch=master)](https://travis-ci.org/ekonstantinidis/css-edit-groups)

An Atom editor package to jump to CSS, LESS and SASS `@group` markers like CSSEdit.

Whenever you are inside a CSS, LESS or SASS file that contains CSS Edit's group information (like `/* @group Headings */` ) press `cmd-L` and you will be presented with a navigation list to jump around within the CSS file.

## Example CSS/LESS/SASS

    /* @group Colors */

        // Theme Colors
        @ThemeBlue: #0a65a3;

        // Colors
        @White: #FFF;

    /* @end Colors */

    /* @group Navbar */

        .navbar {
            background-color: @ThemeBlue;
            color: @White;
        }

    /* @end Navbar */


## Snippet Included

It's really simple to create a group. All you have to do is type `group` and press `tab`. Then the snippet will automatically get created and all you have to do is type the name of the group. It is automatically typed in the start and the end of the group.


    /* @group MyCustomGroup */

    /* @end MyCustomGroup */


## Default Keybindings

  By default the keybinding for this package is `cmd-L`.

  **Note**: This will override the atom's default `Select Line` keybinding. If you do use this keybinding then read the next section on how to put it back and set a custom one for css-edit-groups.

## Override Keybindings

Open your keymap from `Atom -> Open your keymap`.
The example below resets Atom's default keybinding for `cmd-L` and sets `css-edit-groups` to `shift-cmd-L`.

    'atom-text-editor':
      'cmd-l': 'editor:select-line'
      'shift-cmd-l': 'css-edit-groups:toggle'


## Credits

- David Rapson: [cssedit-groups](https://github.com/davidrapson/cssedit-groups)
- Kotrotsos: [sublime-cssedit-groups](https://github.com/Kotrotsos/sublime-cssedit-groups)
