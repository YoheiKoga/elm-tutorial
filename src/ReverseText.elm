import Browser
import Html exposing (Html, Attribute, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

-- MAIN

main =
    Browser.sandbox { init = init, update = update, view = view }


-- Model

type alias Model =
    { content : String 
    }

init : Model
init =
    { content = "" }


-- UPDATE

type Msg
    = Change String

update : Msg -> Model -> Model
update msg model =
    case msg of
        Change newContent ->
            { model | content = newContent }

-- VIEW

view : Model -> Html Msg
view model =
    div []
        [ input [ placeholder "Text to reverse", value model.content, onInput Change ][]
        , div myStyle [ text (String.reverse model.content)]
        , div myStyle [ text (String.repeat 3 model.content)]
        , div myStyle [ text (String.replace " " "-" model.content) ]
        , div myStyle [ text (String.append "ABC" model.content)]
        ]

myStyle =
    [ style "width" "100%"
    , style "height" "40px"
    , style "padding" "10px 0"
    , style "font-size" "2em"
    , style "text-align" "center"
    ]