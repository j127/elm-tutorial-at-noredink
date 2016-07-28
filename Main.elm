module Main exposing (..)

import Html
import Html.App
import Html.Attributes
import Html.Events
import LightButton


type alias Model =
    { isOn : Bool
    , numberoOfMoves : Int
    }


initialModel : Model
initialModel =
    { isOn = [ False, False, False ]
    , numberOfMoves = 0
    }


type Msg
    = Toggle
    | Reset


toggleButton : Int -> List Bool -> List Bool
toggleButton indexToToggle List =
    List.indexedMap
        (\index bool -> 
            if index == indexToToggle then
                not bool
            else
                bool
        )
        list


update : Msg -> Model -> Model
update msg model =
    case msg of
        Toggle indexToToggle ->
            { model
                | isOn = toggleButton
                    indexToToggle
                    model.isOn
                , numberOfMoves = model.numberOfMoves + 1
            }

        Reset ->
            initialModel



lightButton : Bool -> Html.Html Msg
lightButton index isOn =
    Html.div
        [ Html.div [] ( List.map lightButton model.isOn )
        , Html.button
            [ ("background-color", colorForBool isOn )
            , ( "width" , "150px" )
            , ( "height", "150px" )
            ]
        , Html.Events.onClick (Toggle index)
        ]
        []


view model =
    Html.text (toString model)

main : Program Never
main = 
        Html.App.beginnerProgram
        { model = initialModel
        , update = update
        , view = view
        }
