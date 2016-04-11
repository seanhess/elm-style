-- Taken from https://github.com/adam-r-kowalski/elm-style
-- which hasn't been submitted as an elm package


module Style (..) where

-- NATIVE IMPORTS

import Color exposing (Color, toRgb)
import String


-- THIRD PARTY IMPORTS

import Vendor


type alias Style =
  ( String, String )



-- COMMON VALUES


absolute : String
absolute =
  "absolute"


relative : String
relative =
  "relative"


static : String
static =
  "static"


auto : String
auto =
  "auto"


inline : String
inline =
  "inline"


block : String
block =
  "block"


inlineBlock : String
inlineBlock =
  "inline-block"


flex' : String
flex' =
  "flex"


inlineFlex : String
inlineFlex =
  "inline-flex"


listItem : String
listItem =
  "list-item"


runIn : String
runIn =
  "run-in"


table : String
table =
  "table"


inlineTable : String
inlineTable =
  "inline-table"


tableCaption : String
tableCaption =
  "table-caption"


tableColumnGroup : String
tableColumnGroup =
  "table-column-group"


tableHeaderGroup : String
tableHeaderGroup =
  "table-header-group"


tableFooterGroup : String
tableFooterGroup =
  "table-footer-group"


tableRowGroup : String
tableRowGroup =
  "table-row-group"


tableCell : String
tableCell =
  "table-cell"


tableColumn : String
tableColumn =
  "table-column"


tableRow : String
tableRow =
  "table-row"


stretch : String
stretch =
  "stretch"


baseline : String
baseline =
  "baseline"


center : String
center =
  "center"


flexStart : String
flexStart =
  "flex-start"


flexEnd : String
flexEnd =
  "flex-end"


spaceBetween : String
spaceBetween =
  "space-between"


spaceAround : String
spaceAround =
  "space-around"


column : String
column =
  "column"


columnReverse : String
columnReverse =
  "column-reverse"


row : String
row =
  "row"


rowReverse : String
rowReverse =
  "row-reverse"


wrap : String
wrap =
  "wrap"


nowrap : String
nowrap =
  "nowrap"


wrapReverse : String
wrapReverse =
  "wrap-reverse"


none : String
none =
  "none"


left' : String
left' =
  "left"


right' : String
right' =
  "right"


both : String
both =
  "both"


normal : String
normal =
  "normal"


italic : String
italic =
  "italic"


obique : String
obique =
  "oblique"


smallCaps : String
smallCaps =
  "small-caps"


em : number -> String
em e =
  (toString e) ++ "em"


px : number -> String
px p =
  (toString p) ++ "px"


pc : number -> String
pc p =
  (toString p) ++ "%"


deg : number -> String
deg d =
  (toString d) ++ "deg"


rad : number -> String
rad r =
  (toString r) ++ "rad"


dimensions : (number -> String) -> List number -> String
dimensions f xs =
  case xs of
    [] ->
      ""

    t :: [] ->
      (f t) ++ " " ++ (f t) ++ " " ++ (f t) ++ " " ++ (f t)

    t :: r :: [] ->
      (f t) ++ " " ++ (f r) ++ " " ++ (f t) ++ " " ++ (f r)

    t :: r :: b :: [] ->
      (f t) ++ " " ++ (f r) ++ " " ++ (f b) ++ " 0"

    t :: r :: b :: l :: [] ->
      (f t) ++ " " ++ (f r) ++ " " ++ (f b) ++ " " ++ (f l)

    t :: r :: b :: l :: _ ->
      (f t) ++ " " ++ (f r) ++ " " ++ (f b) ++ " " ++ (f l)


color' : Color -> String
color' c =
  let
    { red, green, blue, alpha } =
      toRgb c

    r =
      toString red

    g =
      toString green

    b =
      toString blue

    a =
      toString alpha
  in
    "rgba( "
      ++ r
      ++ ", "
      ++ g
      ++ ", "
      ++ b
      ++ ", "
      ++ a
      ++ " )"


repeat : String
repeat =
  "repeat"


repeatX : String
repeatX =
  "repeat-x"


repeatY : String
repeatY =
  "repeat-y"


noRepeat : String
noRepeat =
  "no-repeat"


scroll : String
scroll =
  "scroll"


visible : String
visible =
  "visible"


fixed : String
fixed =
  "fixed"


local : String
local =
  "local"


hidden : String
hidden =
  "hidden"


dotted : String
dotted =
  "dotted"


dashed : String
dashed =
  "dashed"


solid : String
solid =
  "solid"


double : String
double =
  "double"


groove : String
groove =
  "groove"


ridge : String
ridge =
  "ridge"


inset : String
inset =
  "inset"


outset : String
outset =
  "outset"


alias : String
alias =
  "alias"


allScroll : String
allScroll =
  "all-scroll"


cell : String
cell =
  "cell"


contextMenu : String
contextMenu =
  "context-menu"


colResize : String
colResize =
  "col-resize"


copy : String
copy =
  "copy"


crosshair : String
crosshair =
  "crosshair"


default : String
default =
  "default"


eResize : String
eResize =
  "e-resize"


ewResize : String
ewResize =
  "ew-resize"


grab : String
grab =
  "grab"


grabbing : String
grabbing =
  "grabbing"


help : String
help =
  "help"


move : String
move =
  "move"


nResize : String
nResize =
  "n-resize"


neResize : String
neResize =
  "ne-resize"


neswResize : String
neswResize =
  "nesw-resize"


nsResize : String
nsResize =
  "ns-resize"


nwResize : String
nwResize =
  "nw-resize"


nwseResize : String
nwseResize =
  "nwse-resize"


noDrop : String
noDrop =
  "no-drop"


notAllowed : String
notAllowed =
  "not-allowed"


pointer : String
pointer =
  "pointer"


progress : String
progress =
  "progress"


rowResize : String
rowResize =
  "rowResize"


sResize : String
sResize =
  "s-resize"


seResize : String
seResize =
  "se-resize"


swResize : String
swResize =
  "sw-resize"


text : String
text =
  "text"


url : String -> String
url path =
  "url( " ++ path ++ " )"


verticalText : String
verticalText =
  "vertical-text"


wResize : String
wResize =
  "wResize"


wait : String
wait =
  "wait"


zoomIn : String
zoomIn =
  "zoom-in"


zoomOut : String
zoomOut =
  "zoom-out"


linearGradient : number -> List Color -> String
linearGradient radians colors =
  let
    colorString =
      String.join "," (List.map color' colors)

    radString =
      (rad radians) ++ ", "
  in
    "linear-gradient( " ++ radString ++ colorString ++ " )"


radialGradient : List Color -> String
radialGradient colors =
  let
    colorString =
      String.join "," (List.map color' colors)
  in
    "radial-gradient( " ++ colorString ++ " )"


inside : String
inside =
  "inside"


outside : String
outside =
  "outside"


disc : String
disc =
  "disc"


armenian : String
armenian =
  "armenian"


circle : String
circle =
  "circle"


cjkIdeographic : String
cjkIdeographic =
  "cjk-ideographic"


decimal : String
decimal =
  "decimal"


decimalLeadingZero : String
decimalLeadingZero =
  "decimal-leading-zero"


georgian : String
georgian =
  "georgian"


hebrew : String
hebrew =
  "hebrew"


hiragana : String
hiragana =
  "hiragana"


hiraganaIroha : String
hiraganaIroha =
  "hiragana-iroha"


katakana : String
katakana =
  "katakana"


katakanaIroha : String
katakanaIroha =
  "katakana-iroha"


lowerAlpha : String
lowerAlpha =
  "lower-alpha"


lowerGreek : String
lowerGreek =
  "lower-greek"


lowerLatin : String
lowerLatin =
  "lower-latin"


lowerRoman : String
lowerRoman =
  "lower-roman"


square : String
square =
  "square"


upperAlpha : String
upperAlpha =
  "upper-alpha"


upperLatin : String
upperLatin =
  "upper-latin"


upperRoman : String
upperRoman =
  "upper-roman"


ltr : String
ltr =
  "ltr"


rtl : String
rtl =
  "rtl"


justify : String
justify =
  "justify"


underline : String
underline =
  "underline"


overline : String
overline =
  "overline"


lineThrough : String
lineThrough =
  "line-through"


embed : String
embed =
  "embed"


bidiOverride : String
bidiOverride =
  "bidi-override"


pre : String
pre =
  "pre"


preLine : String
preLine =
  "pre-line"


preWrap : String
preWrap =
  "pre-wrap"



-- PREFIX


type alias PrefixSet =
  { ms : String
  , moz : String
  , o : String
  , webkit : String
  , default : String
  }


prefixSet : String -> PrefixSet
prefixSet default =
  { ms = default
  , moz = default
  , o = default
  , webkit = default
  , default = default
  }


prefixName : PrefixSet -> String -> Style
prefixName prefix value =
  case Vendor.prefix of
    Vendor.MS ->
      ( prefix.ms, value )

    Vendor.Moz ->
      ( prefix.moz, value )

    Vendor.O ->
      ( prefix.o, value )

    Vendor.Webkit ->
      ( prefix.webkit, value )

    _ ->
      ( prefix.default, value )


prefixValue : PrefixSet -> String
prefixValue prefix =
  case Vendor.prefix of
    Vendor.MS ->
      prefix.ms

    Vendor.Moz ->
      prefix.moz

    Vendor.O ->
      prefix.o

    Vendor.Webkit ->
      prefix.webkit

    _ ->
      prefix.default



-- BACKGROUND


background : String -> Style
background b =
  let
    needsPrefix =
      String.startsWith "linear-gradient" b
        || String.startsWith "radial-gradient" b

    value =
      prefixSet b

    value' =
      if needsPrefix then
        { value
          | ms = "-ms-" ++ b
          , webkit = "-webkit-" ++ b
          , moz = "-moz-" ++ b
          , o = "-o-" ++ b
        }
      else
        value
  in
    ( "background", prefixValue value' )


backgroundColor : String -> Style
backgroundColor b =
  ( "background-color", b )


backgroundImage : String -> Style
backgroundImage b =
  ( "background-image", b )


backgroundPosition : String -> Style
backgroundPosition b =
  ( "background-position", b )


backgroundSize : String -> Style
backgroundSize b =
  ( "background-size", b )


backgroundRepeat : String -> Style
backgroundRepeat b =
  ( "background-repeat", b )


backgroundAttachment : String -> Style
backgroundAttachment b =
  ( "background-attachment", b )



-- BORDER


border : String -> Style
border b =
  ( "border", b )


borderColor : String -> Style
borderColor b =
  ( "border-color", b )


borderBottomColor : String -> Style
borderBottomColor b =
  ( "border-bottom-color", b )


borderLeftColor : String -> Style
borderLeftColor b =
  ( "border-left-color", b )


borderRightColor : String -> Style
borderRightColor b =
  ( "border-right-color", b )


borderTopColor : String -> Style
borderTopColor b =
  ( "border-top-color", b )


borderStyle : String -> Style
borderStyle b =
  ( "border-style", b )


borderBottomStyle : String -> Style
borderBottomStyle b =
  ( "border-bottom-style", b )


borderLeftStyle : String -> Style
borderLeftStyle b =
  ( "border-left-style", b )


borderRightStyle : String -> Style
borderRightStyle b =
  ( "border-right-style", b )


borderTopStyle : String -> Style
borderTopStyle b =
  ( "border-top-style", b )


borderWidth : String -> Style
borderWidth b =
  ( "border-width", b )


borderBottomWidth : String -> Style
borderBottomWidth b =
  ( "border-bottom-width", b )


borderLeftWidth : String -> Style
borderLeftWidth b =
  ( "border-left-width", b )


borderRightWidth : String -> Style
borderRightWidth b =
  ( "border-right-width", b )


borderTopWidth : String -> Style
borderTopWidth b =
  ( "border-top-width", b )


borderRadius : String -> Style
borderRadius b =
  ( "border-radius", b )


borderBottomRadius : String -> Style
borderBottomRadius b =
  ( "border-bottom-radius", b )


borderLeftRadius : String -> Style
borderLeftRadius b =
  ( "border-left-radius", b )


borderRightRadius : String -> Style
borderRightRadius b =
  ( "border-right-radius", b )


borderTopRadius : String -> Style
borderTopRadius b =
  ( "border-top-radius", b )



-- CURSOR


cursor : String -> Style
cursor c =
  let
    value =
      prefixSet c

    value' =
      if c == "grab" then
        { value | webkit = "-webkit-grab" }
      else if c == "zoom-in" then
        { value | webkit = "-webkit-zoom-in" }
      else if c == "zoom-out" then
        { value | webkit = "-webkit-zoom-out" }
      else
        value
  in
    ( "cursor", prefixValue value' )



-- DIMENSIONS


height : String -> Style
height h =
  ( "height", h )


width : String -> Style
width w =
  ( "width", w )


maxHeight : String -> Style
maxHeight m =
  ( "max-height", m )


maxWidth : String -> Style
maxWidth m =
  ( "max-width", m )


minHeight : String -> Style
minHeight m =
  ( "min-height", m )


minWidth : String -> Style
minWidth m =
  ( "min-width", m )



-- DISPLAY


display : String -> Style
display d =
  let
    value =
      prefixSet d

    value' =
      if d == "flex" then
        { value
          | webkit = "-webkit-flex"
          , ms = "-ms-flexbox"
        }
      else if d == "inline-flex" then
        { value
          | webkit = "-webkit-inline-flex"
          , ms = "-ms-inline-flexbox"
        }
      else
        value
  in
    ( "display", prefixValue value' )



-- FLEX


flexDirection : String -> Style
flexDirection f =
  let
    name =
      prefixSet "flex-direction"
  in
    prefixName
      { name
        | ms = "-ms-flex-direction"
        , webkit = "-webkit-flex-direction"
      }
      f


flexWrap : String -> Style
flexWrap f =
  let
    name =
      prefixSet "flex-wrap"
  in
    prefixName
      { name
        | ms = "-ms-flex-wrap"
        , webkit = "-webkit-flex-wrap"
      }
      f


flexFlow : String -> Style



-- double check


flexFlow f =
  ( "flex-flow", f )


justifyContent : String -> Style
justifyContent j =
  let
    name =
      prefixSet "justify-content"

    value =
      prefixSet j

    value' =
      if j == "flex-start" then
        { value | ms = "start" }
      else if j == "flex-end" then
        { value | ms = "end" }
      else if j == "space-between" then
        { value | ms = "justify" }
      else if j == "space-around" then
        { value | ms = "distribute" }
      else
        value
  in
    prefixName
      { name
        | ms = "-ms-flex-pack"
        , webkit = "-webkit-justify-content"
      }
      <| prefixValue value'


alignItems : String -> Style
alignItems a =
  let
    name =
      prefixSet "align-items"

    value =
      prefixSet a

    value' =
      if a == "flex-start" then
        { value | ms = "start" }
      else if a == "flex-end" then
        { value | ms = "end" }
      else
        value
  in
    prefixName
      { name
        | ms = "-ms-flex-align"
        , webkit = "-webkit-align-items"
      }
      <| prefixValue value'


alignContent : String -> Style
alignContent a =
  let
    name =
      prefixSet "align-content"

    value =
      prefixSet a

    value' =
      if a == "flex-start" then
        { value | ms = "start" }
      else if a == "flex-end" then
        { value | ms = "end" }
      else if a == "space-between" then
        { value | ms = "justify" }
      else if a == "space-around" then
        { value | ms = "distribute" }
      else
        value
  in
    prefixName
      { name
        | ms = "-ms-flex-line-pack"
        , webkit = "-webkit-flex-start"
      }
      <| prefixValue value'


order : String -> Style
order o =
  let
    name =
      prefixSet "order"
  in
    prefixName
      { name
        | ms = "-ms-flex-order"
        , webkit = "-webkit-order"
      }
      o


flexGrow : String -> Style
flexGrow f =
  let
    name =
      prefixSet "flex-grow"
  in
    prefixName
      { name
        | ms = "-ms-flex-positive"
        , webkit = "-webkit-flex-grow"
      }
      f


flexShrink : String -> Style
flexShrink f =
  let
    name =
      prefixSet "flex-shrink"
  in
    prefixName
      { name
        | ms = "-ms-flex-negative"
        , webkit = "-webkit-flex-shrink"
      }
      f


flexBasis : String -> Style
flexBasis f =
  let
    name =
      prefixSet "flex-basis"
  in
    prefixName
      { name
        | ms = "-ms-flex-preferred-size"
        , webkit = "-webkit-flex-basis"
      }
      f


alignSelf : String -> Style
alignSelf a =
  let
    name =
      prefixSet "align-self"

    value =
      prefixSet a

    value' =
      if a == "flex-start" then
        { value | ms = "start" }
      else if a == "flex-end" then
        { value | ms = "end" }
      else
        value
  in
    prefixName
      { name
        | ms = "-ms-flex-item-align"
        , webkit = "-webkit-align-self"
      }
      <| prefixValue value'


flex : String -> Style
flex f =
  let
    name =
      prefixSet "flex"
  in
    prefixName
      { name
        | ms = "-ms-flex"
        , webkit = "-webkit-flex"
      }
      f



-- FLOAT


clear : String -> Style
clear c =
  ( "clear", c )


float : String -> Style
float f =
  ( "float", f )



-- FONT


fontFamily : String -> Style
fontFamily f =
  ( "font-family", f )


fontSize : String -> Style
fontSize f =
  ( "font-size", f )


fontStyle : String -> Style
fontStyle f =
  ( "font-style", f )


fontVariant : String -> Style
fontVariant f =
  ( "font-variant", f )


fontWeight : String -> Style
fontWeight f =
  ( "font-weight", f )



-- LIST STYLE


listStyleImage : String -> Style
listStyleImage l =
  ( "list-style-image", l )


listStylePosition : String -> Style
listStylePosition l =
  ( "list-style-position", l )


listStyleType : String -> Style
listStyleType l =
  ( "list-style-type", l )



-- MARGIN


margin : String -> Style
margin m =
  ( "margin", m )


marginBottom : String -> Style
marginBottom m =
  ( "margin-bottom", m )


marginLeft : String -> Style
marginLeft m =
  ( "margin-left", m )


marginRight : String -> Style
marginRight m =
  ( "margin-right", m )


marginTop : String -> Style
marginTop m =
  ( "margin-top", m )



-- OUTLINE


outline : String -> Style
outline o =
  ( "outline", o )


outlineColor : String -> Style
outlineColor o =
  ( "outline-color", o )


outlineStyle : String -> Style
outlineStyle o =
  ( "outline-style", o )


outlineWidth : String -> Style
outlineWidth o =
  ( "outline-width", o )



-- PADDING


padding : String -> Style
padding p =
  ( "padding", p )


paddingBottom : String -> Style
paddingBottom p =
  ( "padding-bottom", p )


paddingLeft : String -> Style
paddingLeft p =
  ( "padding-left", p )


paddingRight : String -> Style
paddingRight p =
  ( "padding-right", p )


paddingTop : String -> Style
paddingTop p =
  ( "padding-top", p )



-- POSITION


clip : String -> Style
clip c =
  ( "clip", c )


bottom : String -> Style
bottom b =
  ( "bottom", b )


left : String -> Style
left l =
  ( "left", l )


overflow : String -> Style
overflow o =
  ( "overflow", o )


position : String -> Style
position p =
  ( "position", p )


right : String -> Style
right r =
  ( "right", r )


top : String -> Style
top t =
  ( "top", t )


zIndex : String -> Style
zIndex z =
  ( "z-index", z )



-- SHADOW


boxShadow : String -> Style
boxShadow b =
  ( "box-shadow", b )


textShadow : String -> Style
textShadow t =
  ( "text-shadow", t )



-- TEXT


color : String -> Style
color c =
  ( "color", c )


direction : String -> Style
direction d =
  ( "direction", d )


letterSpacing : String -> Style
letterSpacing l =
  ( "letter-spacing", l )


lineHeight : String -> Style
lineHeight l =
  ( "line-height", l )


textAlign : String -> Style
textAlign t =
  ( "text-align", t )


textDecoration : String -> Style
textDecoration t =
  ( "text-decoration", t )


textIndent : String -> Style
textIndent t =
  ( "text-indent", t )


unicodeBidi : String -> Style
unicodeBidi u =
  ( "unicode-bidi", u )


whiteSpace : String -> Style
whiteSpace w =
  ( "white-space", w )


wordSpacing : String -> Style
wordSpacing w =
  ( "word-spacing", w )



-- TRANSFORM


transform : String -> Style
transform t =
  let
    name =
      prefixSet "transform"
  in
    prefixName
      { name
        | ms = "-ms-transform"
        , webkit = "-webkit-transform"
      }
      t


translate : String -> Style
translate t =
  ( "translate", t )


translate3d : String -> Style
translate3d t =
  ( "translate3d", t )


perspective : String -> Style
perspective p =
  ( "perspective", p )


rotate : String -> Style
rotate r =
  ( "rotate", r )


rotate3d : String -> Style
rotate3d r =
  ( "rotate3d", r )


scale : String -> Style
scale s =
  ( "scale", s )


scale3d : String -> Style
scale3d s =
  ( "scale3d", s )


skew : String -> Style
skew s =
  ( "skew", s )


matrix : String -> Style
matrix m =
  ( "matrix", m )
