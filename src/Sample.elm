import Browser
import Html exposing (Html, div, text)

main =
    Browser.sandbox { init = init, update = update, view = view }


-- model

type alias User =
    { name : String 
    , bio : String
    }

init : User
init =
    { name = "yoheikoga"
    , bio = "fukuoka"
    }


-- update

type Msg = Myname

update : Msg -> User -> User
update msg model =
    case msg of
        Myname ->
            {name="hey", bio="yo"}
    

-- view

view : User -> Html Msg
view model =
    div []
        [ div [] [ text model.name ]
        , div [] [ text model.bio]
        ]