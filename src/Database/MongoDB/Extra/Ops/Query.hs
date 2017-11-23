{-# language OverloadedStrings #-}

module Database.MongoDB.Extra.Ops.Query
( eq
, gt
, gte
, in_
, lt
, lte
, ne
, nin
) where

import Data.Bson ((=:), Document, Val, Label)

eq :: Val v => Label -> v -> Document
key `eq` value = [ key =: [ "$eq" =: value ] ]

gt :: Val v => Label -> v -> Document
key `gt` value = [ key =: [ "$gt" =: value ] ]

gte :: Val v => Label -> v -> Document
key `gte` value = [ key =: [ "$gte" =: value ] ]

in_ :: Val v => Label -> v -> Document
key `in_` value = [ key =: [ "$in" =: value ] ]

lt :: Val v => Label -> v -> Document
key `lt` value = [ key =: [ "$lt" =: value ] ]

lte :: Val v => Label -> v -> Document
key `lte` value = [ key =: [ "$lte" =: value ] ]

ne :: Val v => Label -> v -> Document
key `ne` value = [ key =: [ "$ne" =: value ] ]

nin :: Val v => Label -> [v] -> Document
key `nin` values = [ key =: [ "$nin" =: values ] ]
