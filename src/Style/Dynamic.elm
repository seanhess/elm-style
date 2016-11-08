module Style.Dynamic exposing ( InterEvent, Effect, DynamicStyle, dS, dynamicEffect, hover, pressure )


{-| Extension for the Style library to add dynamic effects 

# Dynamics
@docs DynamicStyle, InterEvent, Effect

# Functions
@docs dS, dynamicEffect

# Effects
@docs hover, pressure
-}

import Html exposing (Attribute)
import Html.Attributes exposing (style, attribute)
import String
import List
import Style exposing (..)

{-| Alias for inline dynamic styles

    myDynamicStyle : DynamicStyle
    myDynamicStyle = 
        (offStyle, [onStyle1, onStyle2])
-}
type alias DynamicStyle = (Style, List Style)

{-| JS interactive event
    
    myEvent : InterEvent
    myEvent = "onmouseover"
-}
type alias InterEvent = String

{-| A tuple of event lists to turn the effect on and off
    
    pressure =
        (["onmouseup", "onmouseout"], ["onmousedown"])
-}
type alias Effect = (List InterEvent, List InterEvent)


applyToFirst : (String -> String) -> String -> String
applyToFirst f str = f (String.left 1 str) ++ (String.dropLeft 1 str)

transpose : List (List a) -> List (List a)
transpose ll =
  case ll of
    [] -> []
    ([]::xss) -> transpose xss
    ((x::xs)::xss) ->
      let
        heads = List.filterMap List.head xss
        tails = List.filterMap List.tail xss
      in
        (x::heads)::transpose (xs::tails)

-- Change the CSS notation to JS: "background-color" -> "backgroundColor"
toJs : String -> String
toJs = applyToFirst String.toLower << String.concat << List.map (applyToFirst String.toUpper) << String.split "-"

-- Generate the JS code to set the style
toJsCode : List (String, String) -> String
toJsCode = List.foldl (\(key,value) acc -> acc ++ "this.style." ++ toJs key ++ "= '" ++ value ++ "';") ""

{-| Dynamic State Function. It takes a CSS attribute, a value describing the off-state and a list of values for on-states, one for each effect included
    changingColor : DynamicStyle
    changingColor = dS color (color' red) [(color' blue), (color' black)]
-}
dS : (String -> (String, String)) -> String -> List String -> DynamicStyle
dS cssKey offStateValue onStateValues = (cssKey offStateValue, List.map cssKey onStateValues)

-- Obtain the Events that switch the effects on and off
switchEvents : List Effect -> (List InterEvent, List InterEvent)
switchEvents = List.foldl (\(switchOff,switchOn) (accOff, accOn) -> (accOff ++ switchOff, accOn ++ switchOn)) ([],[])

---- Response to an event in JS
eventReactor : List (String, String) -> InterEvent -> Attribute msg
eventReactor params event = attribute event (toJsCode params)    

{-| Function to generate Dynamic Effects.
    myEffect : List (Attribute msg)
    myEffect = 
    dynamicEffect [hover, pressure]
    [style [fontSize (px 24)]]
    [dS fontColor (color' red) [(color' blue), (color' black)]]

-}
dynamicEffect : List Effect -> List Style -> List DynamicStyle -> List (Attribute msg)
dynamicEffect effects staticParameters dynamicParameters =
    let
        (switchOff, switchOn) = switchEvents effects
        inactiveParameters = List.map (\(a,_) -> a) dynamicParameters 
        startingParameters = staticParameters ++ inactiveParameters 
        activeParameters = transpose (List.map (\(_,a)->a) dynamicParameters)
    in 
        [style startingParameters] ++ List.map2 eventReactor activeParameters switchOn  ++ List.map (eventReactor inactiveParameters) switchOff     

{-| hover
-}
hover : Effect
hover = (["onmouseout"], ["onmouseover"])

{-| presure
-}
pressure : Effect
pressure = (["onmouseup", "onmouseout"], ["onmousedown"])