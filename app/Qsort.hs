





module Qsort where
import Data.List(partition)
import Control.DeepSeq
import System.Random(randomRIO)

qs1 [] = []
qs1 (x:xs) = qs1 l ++ [x] ++ qs1 r
  where
    l = filter (<x) xs
    r = filter (>=x) xs

qs2 [] = []
qs2 (x:xs) = qs2 l ++ [x] ++ qs2 r
  where (l,r) = partition (<x) xs

testList :: IO [Int]
testList = sequence [randomRIO (1,1000)|_ <- [1..1000]]
