import Browser
import Html exposing (..)
import Html.Atributes exposing (..)
import Html.Events exposing (onInput)

-- Main

main =
    Browser.sandbox { init = init, update = update, view = view}


-- model

type alias Model =
    { name: String
    , password : String
    , passwordAgain : String
    }

init : Model
init =
    Model "" "" ""

-- update

type Msg
    = Name String
    | Password String
    } PasswordAgain String

update : Msg -> Model -> Model
update msg model =
    case msg of
        Name name ->
            { model | name = name }
    
        
