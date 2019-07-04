import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

main =
    Browser.sandbox { init = init, update = update, view = view }

-- model

type alias Model = String

init : Model
init = 
    "z"


-- update

type Msg = Increment | Delete

update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model ++ "a"
        
        Delete ->
            init


-- view

view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Delete ][ text "turn to init" ]
        , div[] [ text  model ]
        , button [ onClick Increment ][ text "+ a" ]
        ]



