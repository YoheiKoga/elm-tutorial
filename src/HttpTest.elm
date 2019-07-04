import Browser
import Html exposing (Html, text, pre)
import Http

-- main

main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


-- model

type Model
    = Failure
    | Loading
    | Success String


init : () -> (Model, Cmd Msg)
init _ =
    ( Loading
    , Http.get
        { url = "https://yoheikoga.github.io/websitetest/sss/"
        , expect = Http.expectString GotText
        }
    )


-- update

type Msg
    = GotText (Result Http.Error String)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        GotText result ->
            case result of
                Ok fullText ->
                    (Success fullText, Cmd.none)
                
                Err _ ->
                    (Failure, Cmd.none)


-- subscriptions

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


-- view

view : Model -> Html Msg
view model =
    case model of
        Failure ->
            text "I was unable to load your book."
        
        Loading ->
            text "Loading..."
        
        Success fullText ->
            pre [][ text fullText ]






