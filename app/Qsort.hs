





-- module Qsort where
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

testList :: Int -> (Int,Int) -> IO [Int]
testList count range = sequence [randomRIO range|_ <- [1..count]]

{-
一个可能的测试步骤
ghci> l <- testList 1000 (1,1000)
ghci> :set +s
ghci> qs1 l
ghci> qs2 l

另一个
ghci> l3 <- testList 100000 (1,1000)
(0.17 secs, 62,462,792 bytes)
ghci> deepseq (qs1 l3) ()
()
(2.16 secs, 483,069,120 bytes)
ghci> deepseq (qs2 l3) ()
()
(1.39 secs, 935,895,240 bytes)
-}