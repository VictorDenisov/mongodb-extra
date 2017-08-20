module Main
where

import qualified Data.Conduit.List as CL
import qualified Database.MongoDB.Query as Q
import qualified Database.MongoDB.Connection as C

import qualified Database.MongoDB.Extra.Query as EQ

import Conduit (($$), ($$+), ($$++), ($$+-))

let runDB h db = Q.access h Q.slaveOk db

main :: IO ()
main = do
  h <- C.connect (C.host "localhost")
  (c, x) <- Q.access h Q.slaveOk "test" $ (EQ.find "books" []) $$+ CL.take 1
  putStrLn $ show x
  y <- Q.access h Q.slaveOk "test" $ (c $$+- CL.take 1)
  putStrLn $ show y
