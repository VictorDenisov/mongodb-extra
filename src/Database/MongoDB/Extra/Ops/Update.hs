{-# language OverloadedStrings #-}

module Database.MongoDB.Extra.Ops.Update
( currentDateDate
, currentDateTimestamp
, inc
, min
, max
, mul
, rename
) where

import Prelude hiding (min, max)
import Data.Bson ((=:), Document, Val, Label, Value(String))

currentDateDate :: Label -> Document
currentDateDate label = [ "$currentDate" =: [ label =: [ "$type" =: (String "date") ] ] ]

currentDateTimestamp :: Label -> Document
currentDateTimestamp label = [ "$currentDate" =: [ label =: [ "$type" =: (String "timestamp") ] ] ]

inc :: Val v => Label -> v -> Document
key `inc` value = [ "$inc" =: [ key =: value ]]

min :: Val v => Label -> v -> Document
key `min` value = [ "$min" =: [ key =: value ]]

max :: Val v => Label -> v -> Document
key `max` value = [ "$max" =: [ key =: value ]]

mul :: Val v => Label -> v -> Document
key `mul` value = [ "$mul" =: [ key =: value ]]

rename :: Label -> Label -> Document
key `rename` value = [ "$rename" =: [ key =: value ]]

