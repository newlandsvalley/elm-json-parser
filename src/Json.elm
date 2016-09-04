module Json exposing (ParseError, parse)

{-|

-- types
@docs ParseError

@docs parse
-}

import Combine exposing (..)
import Combine.Char exposing (..)
import Combine.Infix exposing (..)
import Combine.Num exposing (..)
import String exposing (fromList)
import Dict exposing (Dict, fromList)
import JsonData exposing (..)
--import Debug exposing (..)

{- grammar

    value      ::= obj | arr | stringLiteral | floatingPointNumber | "null" | "true" | "false"
    obj        ::= "{" [members] "}"
    arr        ::= "[" [values] "]"
    members    ::= member {"," member }
    member     ::= stringLiteral ":" value
    values     ::= value {"," value }

-}


{-| a parse error with context -} 
type alias ParseError =
  {  msgs : List String
  ,  input : String
  ,  position : Int
  }

{- a transient member of a JSON object -}
type alias Member =
  (String, JValue)

quotedString : Parser String
quotedString =
  string "\"" *> regex "(\\\\\"|[^\"\n])*" <* string "\"" 
    <?> "quoted string"

jstring : Parser JValue
jstring = 
   JString <$> quotedString
        <?> "jstring"

jnumber : Parser JValue
jnumber = 
    JNumber <$> 
      ( choice
          [ float
          , integer
          ]
      )
        <?> "jnumber"

integer : Parser Float
integer =
  Basics.toFloat <$> int

jbool : Parser JValue
jbool = 
   choice
     [ jtrue
     , jfalse
     ]
      <?> "jbool"

jtrue : Parser JValue
jtrue = JBool True <$ string "true"

jfalse : Parser JValue
jfalse = JBool False <$ string "false"

jnull : Parser JValue
jnull = JNull <$ string "null"

jobj : Parser JValue
jobj =
   rec <| \() -> 
      (JObject << Dict.fromList) <$> (braces jmembers)
         <?> "jobj"

jarr : Parser JValue
jarr =
   rec <| \() -> 
     JArray <$> (brackets jvaluesOrEmpty)
       <?> "jarr"

jmembers : Parser (List Member)
jmembers = 
  rec <| \() -> 
    sepBy1 (char ','<* whiteSpace) (whiteSpace *> jmember)
      <?> "jmembers"

jmember : Parser Member
jmember = 
  rec <| \() -> 
    (,) <$> quotedString <*> ((char ':') *> (whiteSpace *> jvalue))
      <?> "jmember"

jvaluesOrEmpty : Parser (List JValue)
jvaluesOrEmpty =
  rec <| \() -> 
    jvalues `or` empty

empty : Parser (List JValue)
empty =
  [] <$ whiteSpace

jvalues : Parser (List JValue)
jvalues = 
  rec <| \() -> 
    sepBy1 (char ',' <* whiteSpace) (whiteSpace *> jvalue)
      <?> "jvalues"

jvalue : Parser JValue
jvalue =
  let 
    value =
      rec <| \() -> 
        choice
          [ jobj
          , jarr
          , jstring
          , jnumber
          , jnull
          , jbool
          ]
  in    
    -- log "jvalue" <$>
      (value <* whiteSpace
        <?> "jvalue")


-- low level parsers
-- possible whitespace
whiteSpace : Parser String
whiteSpace = regex "[ \t\r\n]*"

{- just for debugging
restOfInput : Parser (List Char)
restOfInput = many anyChar
-}


{-| entry point - Parse some JSON -}
parse : String -> Result.Result ParseError JValue
parse s =
  case Combine.parse jvalue s of
    (Ok n, _) ->
      Ok n

    (Err msgs, ctx) ->
      Err { msgs = msgs, input = ctx.input, position = ctx.position }

