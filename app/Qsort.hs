





module Qsort where
import Data.List(partition)
import Control.DeepSeq
import System.Random(randomRIO)

{-
 -结论，越优化越臭，最快的是qs2
 - -}
qs1 [] = []
qs1 (x:xs) = qs1 l ++ [x] ++ qs1 r
  where
    l = filter (<x) xs
    r = filter (>=x) xs

qs2 [] = []
qs2 (x:xs) = qs2 l ++ [x] ++ qs2 r
  where (l,r) = partition (<x) xs

qs3 [] = []
qs3 (x:xs) = qs3 l ++ [x] ++ qs3 r
  where
    (l,r) = part (<x) xs

qs4 [] = []
qs4 (x:xs) = qs4 l ++ [x] ++ qs4 r
  where (l,r) = part2 (<x) xs

part2 _ [] = ([],[])
part2 p (x:xs) = if p x then (x:l,r) else (l,x:r)
  where (l,r) = part2 p xs

qs5 [] = []
qs5 (x:xs) = qs5 l ++ [x] ++ qs5 r
  where (l,r) = part3 (<x) xs
part3 _ [] = ([],[])
part3 p (x:xs)
  |p x = (x:l,r)
  |otherwise = (l,x:r)
  where
    (a,b) = splitAt (length xs `div` 2)  xs
    (la,ra) = part3 p a
    (lb,rb) = part3 p b
    (l,r) = (la ++ lb ,ra ++ rb)

part _ [] = ([],[])
part p (x:xs)
  |p x = (x:l,r)
  |otherwise = (l,x:r)
  where
    (l,r) = part p xs


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
