module Modernise(modernise) where

import Data.Char ( toUpper )

modernise :: String -> String
modernise = word' |> wordmap |> unwords

(|>) :: (a -> b) -> (b -> c) -> a -> c
(|>) = flip (. )

word' :: String -> [String]
word' []       = []
word' [x]      = [[x]]
word' (' ':xs) = [] : word' xs
word' ('-':xs) = [] : pure '-' : word' xs
word' (x:xs)   = let (y:ys) = word' xs in (x:y):ys
-- 这里有一个警告，这里的问题在于没能否保证let y:ys不是一个[],实际上可以保证，因为这里的xs至少包含一个元素

wordmap :: [String] -> [String]
wordmap = fmap p
    where p []     = []
          p (x:xs) = toUpper x : xs