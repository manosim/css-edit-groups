# CSS Edit Groups - Atom Package [![Build Status](https://travis-ci.org/ekonstantinidis/css-edit-groups.svg?branch=master)](https://travis-ci.org/ekonstantinidis/css-edit-groups)

An Atom editor package to jump to CSS `@group` markers like CSSEdit.

Whenever you are inside a CSS file that contains CSS Edit's group information (like `/* @group Headings */` ) press `cmd-L` and you will be presented with a navigation list to jump around within the CSS file.

![A screenshot of your package](https://f.cloud.github.com/assets/69169/2290250/c35d867a-a017-11e3-86be-cd7c5bf3ff9b.gif)

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


## Override Keybindings

Open your keymap from `Atom -> Open your keymap`.
The example below resets Atom's default keybinding for `cmd-L` and sets `css-edit-groups` to `shift-cmd-L`.

    'atom-text-editor':
      'cmd-L': 'editor:select-line'
      'shift-cmd-L': 'css-edit-groups:toggle'


## Credits

- David Rapson: [cssedit-groups](https://github.com/davidrapson/cssedit-groups)
- Kotrotsos: [sublime-cssedit-groups](https://github.com/Kotrotsos/sublime-cssedit-groups)
