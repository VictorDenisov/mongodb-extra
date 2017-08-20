{-# language OverloadedStrings #-}
module Database.MongoDB.Extra.Query
( deleteOne
, find
, findOne
, modify
) where

import Control.Monad.Trans (MonadIO)
import Conduit
import Data.Bson (Document)

import qualified Database.MongoDB.Query as M

find :: MonadIO m => M.Collection -> M.Selector -> Source (M.Action m) Document
find collection selector = do
  c <- lift $ M.find (M.select selector collection)
  go c

  where
    go c = do
      mn <- lift $ M.next c
      case mn of
        Just n -> do
          yield n
          go c
        Nothing -> return ()

findOne :: MonadIO m => M.Collection -> M.Selector -> M.Action m (Maybe Document)
findOne collection selector = M.findOne (M.select selector collection)

deleteOne :: MonadIO m => M.Collection -> M.Selector -> M.Action m M.WriteResult
deleteOne collection selector = M.deleteMany collection [(selector, [M.SingleRemove])]

modify :: MonadIO m => M.Collection -> M.Selector -> M.Modifier -> M.Action m M.WriteResult
modify collection selector modifier = M.updateMany collection [(selector, modifier, [M.MultiUpdate])]
