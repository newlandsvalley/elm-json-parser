module JsonData exposing (JValue(..))

{-|

-- types
@docs JValue


-}

import Dict exposing (Dict)

{-| JSON Value -}
type JValue = 
    JString String
  | JNumber Float
  | JBool Bool
  | JNull
  | JObject (Dict String JValue)
  | JArray (List JValue)




