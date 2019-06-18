-- referenced by https://qiita.com/Yametaro/items/eb6fd45fe6324906a71a

import Browser
import Html exposing (Html, Attribute, div, ul, li, input, text, button)
-- import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

-- main

main =
    Browser.sandbox { init = init, update = update, view = view}

-- model

type alias Model =
    { wai : Character
    , enemy : Character
    }

type alias Character =
    { name : String
    , hp : Int
    , mp : Int
    , offensivePoint : Int
    , magicAttackPoint : Int
    }


init : Model
init = 
    { wai =
        { name = "yohei"
        , hp = 1000
        , mp = 100
        , offensivePoint = 20
        , magicAttackPoint = 30
        }
    , enemy =
        { name = "koga"
        , hp = 2000
        , mp = 900
        , offensivePoint = 100
        , magicAttackPoint = 90
        }
    }


-- update

type Msg = WaiAttack | EnemyAttack | MagicWaiAttack | MagicEnemyAttack

update : Msg -> Model -> Model
update msg model =
    case msg of
        WaiAttack ->
            let 
                attackedEnemy =
                    attack model.enemy model.wai.offensivePoint
            in
            { model | enemy = attackedEnemy }

        MagicWaiAttack ->
            let 
                attackedEnemy =
                    attack model.enemy model.wai.magicAttackPoint
            in
            { model | enemy = attackedEnemy }

        EnemyAttack ->
            let
                attackedWai =
                    attack model.wai model.enemy.offensivePoint
            in
            { model | wai = attackedWai }

        MagicEnemyAttack ->
            let
                attackedWai =
                    attack model.wai model.enemy.magicAttackPoint
            in
            { model | wai = attackedWai }

view : Model -> Html Msg
view model =
    ul []
        [ li []
            [ div [] [ text model.wai.name ]
            , div [] [ text ("HP: " ++ String.fromInt model.wai.hp)]
            , div [] [ text ("MP: " ++ String.fromInt model.wai.mp)]
            , div [] [ text ("AttackPower: " ++ String.fromInt model.wai.offensivePoint)]
            , div [] [ text ("MagicPower: " ++ String.fromInt model.wai.magicAttackPoint)]
            , button [ onClick WaiAttack] [ text "Attack"]
            , button [ onClick MagicWaiAttack] [ text "Magic Attack"]
            ]
        , li []
            [ div [] [ text model.enemy.name ]
            , div [] [ text ("HP: " ++ String.fromInt model.enemy.hp)]
            , div [] [ text ("MP: " ++ String.fromInt model.enemy.mp)]
            , div [] [ text ("AttackPower: " ++ String.fromInt model.enemy.offensivePoint)]
            , div [] [ text ("MagicPower: " ++ String.fromInt model.enemy.magicAttackPoint)]
            , button [ onClick EnemyAttack] [ text "Attack"]
            , button [ onClick MagicEnemyAttack] [ text "Magic Attack"]
            ]
        ]


-- function

attack : Character -> Int -> Character
attack character damage =
    let
        newHp =
            if character.hp > damage then
                character.hp - damage
            else
                0 
    in
        { character | hp = newHp }

