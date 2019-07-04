import Html exposing (..)

-- main

main =
    view "test"


-- model

type alias User =
    { name: String
    , age : Maybe Int
    }

sue : User
sue =
    { name = "sue"
    , age = Nothing
    }

tom : User
tom =
    { name = "Tom", age = Just 24 }


canBuyAlcohol : User -> Bool
canBuyAlcohol user =
    case user.age of
        Nothing ->
            False
    
        Just age ->
            age >= 21


-- view

view model =
    div []
        [ p [][text "hello maybe"]
        ]






