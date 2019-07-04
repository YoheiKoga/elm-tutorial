import Html exposing (div, text, p)

-- main

main =
    view "test"



-- model

type alias User =
    { name : String
    , bio : String
    }

myName : User
myName = 
    { name = "yoheikoga"
    , bio = "fukuoka"
    }

hasDecentBio : User -> Bool
hasDecentBio user =
    String.length user.bio > 80

-- view

view model =
    div []
        [ p [][text "hello"]
        , p [][text myName.name]
        , p [][text myName.bio]
        , p [][text (User "Tom" "Friendly").name]
        , p [][text (User "Tom" "Friendly").bio]
        ]


