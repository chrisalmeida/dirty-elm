module Main exposing (..)
import Dirty exposing (getCsrfToken, getApiBaseUrl)

import Html.App as App
import Html exposing (text, div, button, Html)
import Html.Events exposing (onClick)

main : Program Never
main =
    App.beginnerProgram
        { model = model
        , view = view
        , update = update
        }

type Msg = 
  Cool

type alias Model = 
  { csrfToken : String, apiBaseUrl: String }

update : Msg -> Model -> Model
update msg model= 
    case msg of
      _ ->
        { model | csrfToken = getCsrfToken  , apiBaseUrl = getApiBaseUrl }


view : Model -> Html.Html Msg
view model = 
    div [] [ text (toString model)
        , button [onClick Cool] [text "click me"] 
        ]

model : Model
model = 
  { csrfToken = "", apiBaseUrl = "" }