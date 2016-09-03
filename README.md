elm-abc-parser
==============

This is a straightforward JSON parser.  It builds a parse tree of the following shape:

```elm
type JValue = 
    JString String
  | JNumber Float
  | JBool Bool
  | JNull
  | JObject (Dict String JValue)
  | JArray (List JValue)

```


(I was a little surprised to see that Json.Decode was implemented primarily in javascript.)
     
Dependencies
------------

*  elm-lang/core 4.0.0
*  Bogdanp/elm-combine 2.2.1

