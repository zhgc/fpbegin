module Test where

import System.Random(randomRIO)
import qualified Control.DeepSeq as D

deepseq = D.deepseq

testList :: Int -> (Int,Int) -> IO [Int]
testList count range = sequence [randomRIO range | _ <- [1..count]]

