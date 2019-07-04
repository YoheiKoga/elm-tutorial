import Html exposing (..)


-- main

main =
    view "test"

-- model

type User
    = Regular String Int
    | Visitor String

toName : User -> String
toName user = 
    case user of
        Regular name age ->
            name
        
        Visitor name ->
            name


-- view

view model =
    div []
        [ text (toName (Regular "Yohei" 1234))
        , text (toName (Visitor "Koga"))
        ]
