module Main exposing (..)

import Html
import Html.App
import Html.Events
import LightButton


type alias Model =
    { isOn : List Bool
    , numberOfMoves : Int
    }


initialModel : Model
initialModel =
    { isOn = [ False, False, False ]
    , numberOfMoves = 0
    }


type Msg
    = Toggle Int
    | Reset


toggleButton : Int -> List Bool -> List Bool
toggleButton indexToToggle list =
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
                | isOn =
                    toggleButton
                    indexToToggle
                    model.isOn
                , numberOfMoves =
                    model.numberOfMoves + 1
            }

        Reset ->
            initialModel


view : Model -> Html.Html Msg
view model =
    Html.div []
        [ Html.App.map Toggle
            (Html.div [] (List.indexedMap LightButton.view model.isOn))
            , Html.button
                [ Html.Events.onClick Reset ]
                [ Html.text "Reset" ]
            , Html.hr [] []
            , Html.text (toString model)
        ]

main : Program Never
main =
        Html.App.beginnerProgram
        { model = initialModel
        , update = update
        , view = view
        }
