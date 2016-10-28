module Main exposing (..)

import Dirty exposing (getCsrfToken, getApiBaseUrl, setItemLS, getItemLS, removeItemLS)
import Html.App as App
import Html exposing (text, div, button, Html, br, p)
import Html.Events exposing (onClick)
import Task


main : Program Never
main =
    App.programWithFlags
        { init = init
        , view = view
        , update = update
        , subscriptions = (\_ -> Sub.none)
        }


init flags =
    ( model, Cmd.none )


type Msg
    = SetLSItem
    | CsrfSuccess String
    | ApiUrlSuccess String
    | SetItemSuccess String
    | GetItemSuccess String
    | RemoveItemSuccess String
    | GetItemFromLS
    | ConfigOnly
    | RemoveItemFromLs
    | Fail String


type alias Model =
    { apiBaseUrl : String
    , csrfToken : String
    , localStorageItem : String
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        CsrfSuccess res ->
            let
                newModel =
                    { model | csrfToken = res }
            in
                ( newModel, Cmd.none )

        ApiUrlSuccess res ->
            let
                newModel =
                    { model | apiBaseUrl = res }
            in
                ( newModel, Cmd.none )

        SetItemSuccess res ->
            let
                log =
                    Debug.log "New LS item set" res
            in
                ( model, Cmd.none )

        GetItemSuccess res ->
            ( { model | localStorageItem = res }, Cmd.none )

        RemoveItemSuccess res ->
            ( { model | localStorageItem = res }, Cmd.none )

        Fail res ->
            let
                log =
                    Debug.log "Fail" res
            in
                ( model, Cmd.none )

        GetItemFromLS ->
            let
                getItemFromLs =
                    Dirty.getItemLS "testKey" |> Task.perform Fail GetItemSuccess
            in
                ( model, getItemFromLs )

        RemoveItemFromLs ->
            let
                removeItemFromLs =
                    Dirty.removeItemLS "testKey" |> Task.perform Fail RemoveItemSuccess
            in
                ( model, removeItemFromLs )

        SetLSItem ->
            let
                setLS =
                    Dirty.setItemLS "testKey" "value set in elm" |> Task.perform Fail SetItemSuccess
            in
                ( model, setLS )

        ConfigOnly ->
            let
                csrf =
                    getCsrfToken |> Task.perform Fail CsrfSuccess

                getBaseUrl =
                    getApiBaseUrl |> Task.perform Fail ApiUrlSuccess
            in
                ( model, Cmd.batch [ csrf, getBaseUrl ] )


view : Model -> Html.Html Msg
view model =
    div []
        [ text (toString model)
        , br [] []
        , button [ onClick ConfigOnly ] [ text "Get config" ]
        , p [] [ text "Local Storage default key: testKey" ]
        , button [ onClick SetLSItem ] [ text "Set LS item" ]
        , br [] []
        , button [ onClick GetItemFromLS ] [ text "Get LS item" ]
        , br [] []
        , button [ onClick RemoveItemFromLs ] [ text "Remove LS item" ]
        ]


model : Model
model =
    { apiBaseUrl = ""
    , csrfToken = ""
    , localStorageItem = ""
    }
