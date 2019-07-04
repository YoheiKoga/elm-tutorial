-- referenced https://qiita.com/pxfnc/items/d2ea1ac004aebe1e222f

module Main exposing (main)

import Browser
import Html exposing (Html, div, h1, text, pre)
import Html.Attributes exposing (style)
import Array exposing (Array)
import List.Extra
import Maybe.Extra
import Random exposing (Generator)
import Random.Extra
import Random.List

main =
    Browser.element { init = init, update = update, view = view, subscriptions = subscriptions }

-- model

type alias Model =
    Maybe BingoCard


type Cell 
    = Free
    | Cell Int

type Row = 
    Row (Array Cell)

type BingoCard = 
    BingoCard (Array Row)



init : () -> (Model, Cmd Msg)
init _ =
    ( Nothing
    , Random.generate GenerateBingo genBingoCard
    )


-- update

type Msg =
    GenerateBingo BingoCard

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        GenerateBingo card ->
            ( Just card, Cmd.none )

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


-- view

view : Model -> Html Msg
view model =
    let
        formattedBingoCard : String
        formattedBingoCard =
            model
                |> Maybe.map showBingoCard
                |> Maybe.withDefault "creating..."
    in
    div []
        [ h1 [][ text "Elm Bingo" ]
        , pre [ style "font-family" "Courier" ][ text formattedBingoCard ]
        ]

bingo : BingoCard
bingo =
    BingoCard <|
        Array.fromList
            [ Row <| Array.fromList [ Cell 1, Cell 16, Cell 31, Cell 46, Cell 61 ]
            , Row <| Array.fromList [ Cell 2, Cell 17, Cell 32, Cell 47, Cell 62 ]
            , Row <| Array.fromList [ Cell 3, Cell 18, Free, Cell 48, Cell 63 ]
            , Row <| Array.fromList [ Cell 4, Cell 19, Cell 34, Cell 49, Cell 64 ]
            , Row <| Array.fromList [ Cell 5, Cell 20, Cell 35, Cell 50, Cell 65 ]
            ]


showBingoCard : BingoCard -> String
showBingoCard (BingoCard rows) =
    let
        -- cell to string
        showCell : Cell -> String
        showCell cell =
            case cell of
                Free ->
                    ""
                
                Cell n ->
                    String.fromInt n
        -- fill by space
        right : String -> String
        right str =
            String.right 2 ("  " ++ str)
        

        -- circle by space
        surroundWithSpace : String -> String
        surroundWithSpace str =
            " " ++ str ++ " "
        

        -- change row to String List
        rowToStrList : Row -> List String
        rowToStrList (Row cells) =
            cells
                |> Array.toList
                |> List.map showCell

        -- commonarity
        formatRow : List String -> String
        formatRow list =
            list
                |> List.map (right >> surroundWithSpace)
                |> String.join "|"
        
        -- define header
        header : List String
        header =
            [ "B", "I", "N", "G", "O"]
    
    in
    rows
        |> Array.toList
        |> List.map rowToStrList
        |> (::) header
        |> List.map formatRow
        |> String.join "\n"
    

genBingoCard : Generator BingoCard
genBingoCard =
    let
        genColumn : Int -> Int -> Generator (List Cell)
        genColumn min_ max_ =
            List.range min_ max_
                |> List.map Cell
                |> Random.List.shuffle
                |> Random.map (List.take 5)
        
        mapToBingoCard : List (List Cell) -> BingoCard
        mapToBingoCard =
            List.map (Array.fromList >> Row) >> Array.fromList >> BingoCard
    
    in
    Random.Extra.sequence
        [ genColumn 1 15
        , genColumn 16 30
        , genColumn 31 45 |> Random.map (List.Extra.setAt 2 Free)
        , genColumn 46 60
        , genColumn 61 75
        ]
        |> Random.map List.Extra.transpose
        |> Random.map mapToBingoCard




