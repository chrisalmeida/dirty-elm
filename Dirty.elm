module Dirty exposing (..)

{-|
@docs getCsrfToken, getApiBaseUrl
-}

import Native.Dirty

{-| if available returns window.csrfToken on program start -}

getCsrfToken : String
getCsrfToken = Native.Dirty.getCsrfToken ""


{-| if available returns window.apiBaseUrl on program start -}

getApiBaseUrl : String
getApiBaseUrl = Native.Dirty.getApiBaseUrl ""
