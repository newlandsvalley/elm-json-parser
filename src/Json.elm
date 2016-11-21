module Json exposing (ParseError, parse)

{-|

-- types
@docs ParseError

@docs parse
-}

import Combine exposing (..)
import Combine.Char exposing (..)
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


{-| a parse error with context
-}
type alias ParseError =
    { msgs : List String
    , input : String
    , position : Int
    }



{- a transient member of a JSON object -}


type alias Member =
    ( String, JValue )


quotedString : Parser s String
quotedString =
    string "\""
        *> regex "(\\\\\"|[^\"\n])*"
        <* string "\""
        <?> "quoted string"


jstring : Parser s JValue
jstring =
    JString
        <$> quotedString
        <?> "jstring"


jnumber : Parser s JValue
jnumber =
    JNumber
        <$> (choice
                [ float
                , integer
                ]
            )
        <?> "jnumber"


integer : Parser s Float
integer =
    Basics.toFloat <$> int


jbool : Parser s JValue
jbool =
    choice
        [ jtrue
        , jfalse
        ]
        <?> "jbool"


jtrue : Parser s JValue
jtrue =
    JBool True <$ string "true"


jfalse : Parser s JValue
jfalse =
    JBool False <$ string "false"


jnull : Parser s JValue
jnull =
    JNull <$ string "null"


jobj : Parser s JValue
jobj =
    lazy <|
        \() ->
            (JObject << Dict.fromList)
                <$> (braces jmembers)
                <?> "jobj"


jarr : Parser s JValue
jarr =
    lazy <|
        \() ->
            JArray
                <$> (brackets jvaluesOrEmpty)
                <?> "jarr"


jmembers : Parser s (List Member)
jmembers =
    lazy <|
        \() ->
            sepBy1 (char ',' <* whiteSpace) (whiteSpace *> jmember)
                <?> "jmembers"


jmember : Parser s Member
jmember =
    lazy <|
        \() ->
            (,)
                <$> quotedString
                <*> ((char ':') *> (whiteSpace *> jvalue))
                <?> "jmember"


jvaluesOrEmpty : Parser s (List JValue)
jvaluesOrEmpty =
    lazy <|
        \() ->
            jvalues <|> empty


empty : Parser s (List JValue)
empty =
    [] <$ whiteSpace


jvalues : Parser s (List JValue)
jvalues =
    lazy <|
        \() ->
            sepBy1 (char ',' <* whiteSpace) (whiteSpace *> jvalue)
                <?> "jvalues"


jvalue : Parser s JValue
jvalue =
    let
        value =
            lazy <|
                \() ->
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
        (value
            <* whiteSpace
            <?> "jvalue"
        )



-- low level parsers
-- possible whitespace


whiteSpace : Parser s String
whiteSpace =
    regex "[ \t\x0D\n]*"



{- just for debugging
   restOfInput : Parser (List Char)
   restOfInput = many anyChar
-}


{-| entry point - Parse some JSON
-}
parse : String -> Result.Result ParseError JValue
parse s =
    case Combine.parse jvalue s of
        Ok ( _, _, n ) ->
            Ok n

        Err ( _, ctx, msgs ) ->
            Err { msgs = msgs, input = ctx.input, position = ctx.position }
