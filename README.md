# elm-style
---
Idiomatic way to describe styles in Elm.

## Quick Start
---
1. Clone the repository
   ```bash
   git clone https://github.com/adam-r-kowalski/elm-style.git
   ```

2. Navigate to the proper directory
   ```bash
   cd elm-style/
   ```

3. Install the npm packages
   ```bash
   npm install
   ```
   
4. Start gulp to get a live reloading dev server. It should open [localhost](http://localhost:3000).
   ```bash
   gulp
   ```
   
Inspired by [React: CSS in JS](https://speakerdeck.com/vjeux/react-css-in-js) by vjeux

Thanks to [Gizra](https://github.com/Gizra/generator-elmlang) for making an awesome elm generator for [Yeoman](http://yeoman.io/).

Make sure to take a look at some alternatives as well before deciding on how best to tackle styles in Elm as this is still a very volatile and quickly changing landscape. One I recommend looking at is [elm-stylesheets](https://github.com/rtfeldman/elm-stylesheets) by the well known [Richard Feldman](https://github.com/rtfeldman).


## Features
---
- Composable Styles
- Type checking
- Automatic vendor prefixing
- Live reloading dev server (html, scss, javascript, and elm code)
- Test across multiple browsers simultaniously thanks to [browsersync.io](http://www.browsersync.io/)


## Overview
---
elm-style aims to an unintrusive way to get type checking in your styles, as well as taking care of type checking for you.  It is specifically designed to be easy to incorporate in an incremental fasion so it should never be a burden to use in your project.  It is also very flexible so that if you decide you need to do something I have not accounted for it is very simple to do so.


## Example
---
### Centering Content
```elm
import Html exposing (..)
import Style exposing (..)

type alias Styles = List ( String, String )

centeredLayout : Styles
centeredLayout =
  [ display flex'
  , justifyContent center
  , alignItems center
  ]

view : Html
view =
  div [ style centeredLayout ] [ text "Hello, world!" ]
```

The code is almost identical to its Css counterpart, but instead of using hyphen-delimited syntax you use the Elm camelCase.  There is one more thing to look out for. As you can see some values in the key value pair end in an ' (ie: flex').  This is done whenever there is both a key and a value that both have the same name. In this case the key will always have the non quoted name.  Therefore flex is a function which sets the flex-grow, flex-shrink, and flex-basis values, while flex' is the value that can be supplied to display function to enable a flex context for all its direct children.


## What Next
---
I recommend that you download the repo and open up the example. It demonstrates how you can organize your styles and then use them inside of your view.  A best practice would be to make a file specifically for styles, and include my library there exposing every member. This way you can use all of these functions without the "Style." prefix.
