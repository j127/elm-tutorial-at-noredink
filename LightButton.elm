module LightButton exposing (view)

import Html
import Html.App
import Html.Attributes
import Html.Events


colorForBool : Bool -> String
colorForBool bool =
    if bool then
       "red"
   else
       "blue"


view : Int
