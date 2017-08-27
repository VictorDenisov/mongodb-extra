{-# language OverloadedStrings #-}

module Database.MongoDB.Extra.Commands
( eq
, gt
, gte
, in_
, lt
, lte
) where

import Data.Bson ((=:), Document)

import Data.Text (Text)


eq :: Text -> String -> Document
key `eq` value = [ key =: [ "$eq" =: value ] ]

gt :: Text -> String -> Document
key `gt` value = [ key =: [ "$gt" =: value ] ]

gte :: Text -> String -> Document
key `gte` value = [ key =: [ "$gte" =: value ] ]

in_ :: Text -> String -> Document
key `in_` value = [ key =: [ "$in" =: value ] ]

lt :: Text -> String -> Document
key `lt` value = [ key =: [ "$lt" =: value ] ]

lte :: Text -> String -> Document
key `lte` value = [ key =: [ "$lte" =: value ] ]
