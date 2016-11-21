elm-json-parser
===============

This is a straightforward JSON parser for Elm 0.18.  It builds a parse tree of the following shape:

```elm
type JValue = 
    JString String
  | JNumber Float
  | JBool Bool
  | JNull
  | JObject (Dict String JValue)
  | JArray (List JValue)
```

which is produced by the __parse__ function:

```elm
parse : String -> Result.Result ParseError JValue
```

This parser provides an alternative strategy to [Json.Decode](http://package.elm-lang.org/packages/elm-lang/core/4.0.5/Json-Decode) for handling possibly awkward JSON input - such as that described in [Decoding Large JSON Objects](https://www.brianthicks.com/post/2016/08/22/decoding-large-json-objects-a-summary/).

(I was a little surprised to see that Json.Decode was implemented primarily in javascript.)
     
Dependencies
------------

*  elm-lang/core 5.0.0
*  Bogdanp/elm-combine 3.1.1

