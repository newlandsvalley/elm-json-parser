module Tests exposing (all)

import Test exposing (..)
import Expect exposing (Expectation)
import Samples exposing (..)
import Json exposing (..)
import Debug exposing (..)


expectParses : String -> Expectation
expectParses s =
    let
        result =
            Json.parse s
    in
        case result of
            Err e ->
                Expect.fail (toString e)

            _ ->
                Expect.pass


basicTests : Test
basicTests =
    describe "Basic tests"
        [ test "true" <|
            \() ->
                expectParses ("true")
        , test "false" <|
            \() ->
                expectParses ("false")
        , test "null" <|
            \() ->
                expectParses ("null")
        , test "true member" <|
            \() ->
                expectParses ("""{ "member": true }""")
        , test "false member" <|
            \() ->
                expectParses ("""{ "member": false }""")
        , test "null member" <|
            \() ->
                expectParses ("""{ "member": null }""")
        , test "members" <|
            \() ->
                expectParses ("""{ "member1": true, "member2": false }""")
        , test "string" <|
            \() ->
                expectParses ("""{ "member": "Fred" }""")
        , test "embedded quote" <|
            \() ->
                let
                    -- as we're using embedded quotes in the pattern string
                    -- and we're taking it literally with """ then we need to
                    -- doubly escape the embedded quotes in the pattern
                    pattern =
                        """{ "member": "Fred  \\"Bloggs\\""  }"""
                in
                    expectParses (pattern)
        , test "array" <|
            \() ->
                expectParses ("""{ "arr": [ 1, 2, 3 ] }""")
        , test "emptyArray" <|
            \() ->
                expectParses ("""{ "arr": [ ] }""")
        ]


wildTests : Test
wildTests =
    describe "From the wild"
        [ test "address book" <|
            \() ->
                expectParses (addressBook)
        , test "twitter" <|
            \() ->
                expectParses (twitter)
        , test "Google maps" <|
            \() ->
                expectParses (googleMaps)
        , test "Elm config" <|
            \() ->
                expectParses (elmConfig)
        , test "Facebook" <|
            \() ->
                expectParses (facebook)
        , test "github" <|
            \() ->
                expectParses (github)
        ]


{-| -}
all : Test
all =
    concat
        [ basicTests
        , wildTests
        ]
