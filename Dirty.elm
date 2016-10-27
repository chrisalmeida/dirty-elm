module Dirty exposing (..)

{-|
@docs getCsrfToken, getApiBaseUrl
-}

import Native.Dirty

{-| Checks for window.csrfToken on program start -}

getCsrfToken : String
getCsrfToken = Native.Dirty.getCsrfToken ""


{-| Checks for window.apiBaseUrl on program start -}

getApiBaseUrl : String
getApiBaseUrl = Native.Dirty.getApiBaseUrl ""