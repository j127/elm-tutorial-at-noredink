module LightButton exposing (view)

import Html
import Html.Attributes
import Html.Events


colorForBool : Bool -> String
colorForBool bool =
    if bool then
       "red"
   else
       "blue"


view : Int -> Bool -> Html.Html Int
view index isOn =
    Html.div
        [ Html.Attributes.style
            [ ( "background-color", colorForBool isOn )
            , ( "width", "150px" )
            , ( "height", "150px")
            ]
        , Html.Events.onClick index
        ]
        []
