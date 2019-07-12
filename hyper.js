// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

const foregroundColor = '#eff0eb'
const backgroundColor = '#1d262f'
const black = backgroundColor
const slate = '#495f79'
const lightSlate = '#56708f'
const blue = '#7cb5f9'
const green = '#0acd93'
const lightGreen = '#52ffc8'
const gray = '#8ca59d'
const brightBlack = '#8ca59d'

const colors = {
	black: black,
	red: slate,
	green: lightSlate,
	yellow: blue,
	blue: green,
	magenta: lightGreen,
	cyan: gray,
	white: foregroundColor,
	lightBlack: brightBlack,
	lightRed: slate,
	lightGreen: lightSlate,
	lightYellow: blue,
	lightBlue: green,
	lightMagenta: lightGreen,
	lightCyan: gray,
	lightWhite: foregroundColor
}

module.exports = {
  config: {
    // default font size in pixels for all tabs
    fontSize: 16,

    // font family with optional fallbacks
    fontFamily: 'Fira Code',
    // fontFamily: '"Fira Code", Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',

    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    // cursorColor: 'rgba(248,28,229,0.8)',
    cursorColor: '#0acd93',
    

    // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
    cursorShape: '_',

    // set to true for blinking cursor
    cursorBlink: false,

    // color of the text
    foregroundColor: '#b3c4c6',

    // terminal background color
    backgroundColor: '#00222b',

    // border color (window, tabs)
    borderColor: '#325450',

    colors: colors,

    // custom css to embed in the main window
    // css: '',


    // set to `true` (without backticks) if you're using a Linux setup that doesn't show native menus
    // default: `false` on Linux, `true` on Windows (ignored on macOS)
    showHamburgerMenu: '',

    // set to `false` if you want to hide the minimize, maximize and close buttons
    // additionally, set to `'left'` if you want them on the left, like in Ubuntu
    // default: `true` on windows and Linux (ignored on macOS)
    showWindowControls: '',

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: '0 14px',

    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    colors: {
      black: '#4a5f70',
      red: '#dc322f',
      green: '#859901',
      yellow: '#b58901',
      blue: '#268bd2',
      magenta: '#d33682',
      cyan: '#2aa198',
      white: '#eee8d5',
      lightBlack: '#808080',
      lightRed: '#cb4b16',
      lightGreen: '#33ff00',
      lightYellow: '#657b83',
      lightBlue: '#8394b6',
      lightMagenta: '#6c6ec6',
      lightCyan: '#93a1a1',
      lightWhite: '#fdf6e3'
    },

    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    // make sure to use a full path if the binary name doesn't work
    // (e.g `C:\\Windows\\System32\\bash.exe` instead of just `bash.exe`)
    // if you're using powershell, make sure to remove the `--login` below
    shell: '',

    // for setting shell arguments (i.e. for using interactive shellArgs: ['-i'])
    // by default ['--login'] will be used
    shellArgs: ['-i'],

    // for environment variables
    env: {},

    // set to false for no bell
    bell: 'SOUND',

    // if true, selected text will automatically be copied to the clipboard
    copyOnSelect: false,

    // hyperSpotify: {
    //   position: 'bottom', // or 'bottom'
    //   margin: 'default', // or 'double' or custom value
    //   controlsPosition: 'default', // or 'left' or 'right'
    // },
    paneNavigation: {
      debug: false,
      hotkeys: {
        navigation: {
          up: 'ctrl+alt+up',
          down: 'ctrl+alt+down',
          left: 'ctrl+alt+left',
          right: 'ctrl+alt+right'
        },
        jump_prefix: 'ctrl+alt', // completed with 1-9 digits
        permutation_modifier: 'shift', // Added to jump and navigation hotkeys for pane permutation
        maximize: 'meta+enter'
      },
      showIndicators: true, // Show pane number
      indicatorPrefix: 'p', // Will be completed with pane number
      indicatorStyle: { // Added to indicator <div>
        position: 'absolute',
        bottom: '0',
        left: '0',
        fontSize: '12px',
        color: '#7cb5f9'
      },
      focusOnMouseHover: false,
      inactivePaneOpacity: 0.75 // Set to 1 to disable inactive panes dimming
    }
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
    "hyperlinks",
    "hyper-search",
    "hyper-spotify",
    "hyper-pane",
    "hyper-tab-icons-plus",
    "hyperpower"
  ],
  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: [
    "duotone-darksea"
  ],
};
