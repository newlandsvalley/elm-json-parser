module Samples exposing (addressBook, twitter, googleMaps, facebook, elmConfig)

{-|

@docs addressBook, twitter, googleMaps, facebook, elmConfig

-}

{-|-}
addressBook : String
addressBook = """{
  "address book": {
     "name": "John Smith",
     "address": {
        "street": "10 Market Street",
        "city": "San Francisco",
        "zip": 94111
        },
     "phone numbers": [
        "408 338-4238",
        "408 111-6892"
        ]        
  }
}"""

twitter : String
twitter = """{
      "text": "RT @PostGradProblem: In preparation for the NFL lockout, I will be spending twice as much time analyzing my fantasy baseball team during ...", 
      "truncated": true, 
      "in_reply_to_user_id": null, 
      "in_reply_to_status_id": null, 
      "favorited": false, 
      "source": "<a href=\\"http://twitter.com/\\" rel=\\"nofollow\\">Twitter for iPhone</a>", 
      "in_reply_to_screen_name": null, 
      "in_reply_to_status_id_str": null, 
      "id_str": "54691802283900928", 
      "entities": {
            "user_mentions": [
                  {
                        "indices": [
                              3, 
                              19
                        ], 
                        "screen_name": "PostGradProblem", 
                        "id_str": "271572434", 
                        "name": "PostGradProblems", 
                        "id": 271572434
                  }
            ], 
            "urls": [ ], 
            "hashtags": [ ]
      }, 
      "contributors": null, 
      "retweeted": false, 
      "in_reply_to_user_id_str": null, 
      "place": null, 
      "retweet_count": 4, 
      "created_at": "Sun Apr 03 23:48:36 +0000 2011", 
      "retweeted_status": {
            "text": "In preparation for the NFL lockout, I will be spending twice as much time analyzing my fantasy baseball team during company time. #PGP", 
            "truncated": false, 
            "in_reply_to_user_id": null, 
            "in_reply_to_status_id": null, 
            "favorited": false, 
            "source": "<a href=\\"http://www.hootsuite.com\\" rel=\\"nofollow\\">HootSuite</a>", 
            "in_reply_to_screen_name": null, 
            "in_reply_to_status_id_str": null, 
            "id_str": "54640519019642881", 
            "entities": {
                  "user_mentions": [ ], 
                  "urls": [ ], 
                  "hashtags": [
                        {
                              "text": "PGP", 
                              "indices": [
                                    130, 
                                    134
                              ]
                        }
                  ]
            }, 
            "contributors": null, 
            "retweeted": false, 
            "in_reply_to_user_id_str": null, 
            "place": null, 
            "retweet_count": 4, 
            "created_at": "Sun Apr 03 20:24:49 +0000 2011", 
            "user": {
                  "notifications": null, 
                  "profile_use_background_image": true, 
                  "statuses_count": 31, 
                  "profile_background_color": "C0DEED", 
                  "followers_count": 3066, 
                  "profile_image_url": "http://a2.twimg.com/profile_images/1285770264/PGP_normal.jpg", 
                  "listed_count": 6, 
                  "profile_background_image_url": "http://a3.twimg.com/a/1301071706/images/themes/theme1/bg.png", 
                  "description": "", 
                  "screen_name": "PostGradProblem", 
                  "default_profile": true, 
                  "verified": false, 
                  "time_zone": null, 
                  "profile_text_color": "333333", 
                  "is_translator": false, 
                  "profile_sidebar_fill_color": "DDEEF6", 
                  "location": "", 
                  "id_str": "271572434", 
                  "default_profile_image": false, 
                  "profile_background_tile": false, 
                  "lang": "en", 
                  "friends_count": 21, 
                  "protected": false, 
                  "favourites_count": 0, 
                  "created_at": "Thu Mar 24 19:45:44 +0000 2011", 
                  "profile_link_color": "0084B4", 
                  "name": "PostGradProblems", 
                  "show_all_inline_media": false, 
                  "follow_request_sent": null, 
                  "geo_enabled": false, 
                  "profile_sidebar_border_color": "C0DEED", 
                  "url": null, 
                  "id": 271572434, 
                  "contributors_enabled": false, 
                  "following": null, 
                  "utc_offset": null
            }, 
            "id": 54640519019642880, 
            "coordinates": null, 
            "geo": null
      }, 
      "user": {
            "notifications": null, 
            "profile_use_background_image": true, 
            "statuses_count": 351, 
            "profile_background_color": "C0DEED", 
            "followers_count": 48, 
            "profile_image_url": "http://a1.twimg.com/profile_images/455128973/gCsVUnofNqqyd6tdOGevROvko1_500_normal.jpg", 
            "listed_count": 0, 
            "profile_background_image_url": "http://a3.twimg.com/a/1300479984/images/themes/theme1/bg.png", 
            "description": "watcha doin in my waters?", 
            "screen_name": "OldGREG85", 
            "default_profile": true, 
            "verified": false, 
            "time_zone": "Hawaii", 
            "profile_text_color": "333333", 
            "is_translator": false, 
            "profile_sidebar_fill_color": "DDEEF6", 
            "location": "Texas", 
            "id_str": "80177619", 
            "default_profile_image": false, 
            "profile_background_tile": false, 
            "lang": "en", 
            "friends_count": 81, 
            "protected": false, 
            "favourites_count": 0, 
            "created_at": "Tue Oct 06 01:13:17 +0000 2009", 
            "profile_link_color": "0084B4", 
            "name": "GG", 
            "show_all_inline_media": false, 
            "follow_request_sent": null, 
            "geo_enabled": false, 
            "profile_sidebar_border_color": "C0DEED", 
            "url": null, 
            "id": 80177619, 
            "contributors_enabled": false, 
            "following": null, 
            "utc_offset": -36000
      }, 
      "id": 54691802283900930, 
      "coordinates": null, 
      "geo": null
}"""


{-|-}
googleMaps: String
googleMaps = """[{"id":48,"title":"Helgelandskysten","longitude":"12.63376","latitude":"66.02219"},{"id":46,"title":"Tysfjord","longitude":"16.50279","latitude":"68.03515"},{"id":44,"title":"Sledehunds-ekspedisjon","longitude":"7.53744","latitude":"60.08929"},{"id":43,"title":"Amundsens sydpolferd","longitude":"11.38411","latitude":"62.57481"},{"id":39,"title":"Vikingtokt","longitude":"6.96781","latitude":"60.96335"},{"id":6,"title":"Tungtvann- sabotasjen","longitude":"8.49139","latitude":"59.87111"}]"""

facebook : String
facebook = """{
   "data": [
      {
         "id": "X999_Y999",
         "from": {
            "name": "Tom Brady", "id": "X12"
         },
         "message": "Looking forward to 2010!",
         "actions": [
            {
               "name": "Comment",
               "link": "http://www.facebook.com/X999/posts/Y999"
            },
            {
               "name": "Like",
               "link": "http://www.facebook.com/X999/posts/Y999"
            }
         ],
         "type": "status",
         "created_time": "2010-08-02T21:27:44+0000",
         "updated_time": "2010-08-02T21:27:44+0000"
      },
      {
         "id": "X998_Y998",
         "from": {
            "name": "Peyton Manning", "id": "X18"
         },
         "message": "Where's my contract?",
         "actions": [
            {
               "name": "Comment",
               "link": "http://www.facebook.com/X998/posts/Y998"
            },
            {
               "name": "Like",
               "link": "http://www.facebook.com/X998/posts/Y998"
            }
         ],
         "type": "status",
         "created_time": "2010-08-02T21:27:44+0000",
         "updated_time": "2010-08-02T21:27:44+0000"
      }
   ]
}"""

{-|-}
elmConfig : String
elmConfig = """{
    "version": "1.0.0",
    "summary": "Play ABC directly in the browser",
    "repository": "https://github.com/newlandsvalley/elm-abc-player.git",
    "license": "BSD3",
    "source-directories": [
        "src",
        "src/abc-parser",
        "src/examples",
        "src/examples/editor",
        "src/examples/editor-controller",
        "src/examples/simpleplayer",
        "src/examples/tutorial"
    ],
    "exposed-modules": [
        "SoundFont"
    ],
    "native-modules": true,
    "dependencies": {
        "elm-lang/core": "4.0.0 <= v < 5.0.0",
        "Bogdanp/elm-combine": "2.2.1 <= v < 3.0.0",
        "imeckler/ratio": "2.0.1 <= v < 3.0.0",
        "elm-community/maybe-extra": "1.0.0 <= v < 2.0.0",
        "elm-community/elm-list-extra": "1.0.0 <= v < 2.0.0",
        "elm-lang/html": "1.0.0 <= v < 2.0.0",
        "evancz/elm-http": "3.0.1 <= v < 4.0.0",
        "elm-community/elm-test": "1.1.0 <= v < 2.0.0"
    }, 
    "elm-version": "0.17.0 <= v < 0.18.0"
}"""

