-- referenced [- Beginning Elm](https://elmprogramming.com/building-a-simple-page-in-elm.html)

module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

view model =
    div [ class "jumbotron" ]
        [ h1 [] [ text "Welcome to the new World!"]
        , strong [] [ text "HELLO" ]
        , text ") is a little page for me"
        ]

main =
    view "best dumm simple"