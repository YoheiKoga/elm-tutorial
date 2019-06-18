-- reference and customize not int but float
-- https://qiita.com/Yametaro/items/7988b7dd2728cc2b9456

module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { userInputNumber : Maybe Float
    }


init : Model
init =
    { userInputNumber = Just 0
    }



-- UPDATE


type Msg
    = UserInput String


update : Msg -> Model -> Model
update msg model =
    case msg of
        UserInput inputString ->
            { model | userInputNumber = String.toFloat inputString }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ input [ onInput UserInput ] []
        , p [] [ text (maybeIntToString model.userInputNumber) ]
        ]



-- FUNCTIONS


maybeIntToString : Maybe Float -> String
maybeIntToString maybeInt =
    case maybeInt of
        Just float ->
            String.fromFloat float

        Nothing ->
            "数値以外はやめましょう"
