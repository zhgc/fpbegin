module Main where

import Prelude

import Effect (Effect)
import Effect.Console (log)

main :: Effect Unit
main = do
  log "hello zhzh"

-- getJavascript str
--   | h str p   = p
--   | otherwise = []
--   where 
--     p = "javascript"
--     h _ [] = true
--     h [] _ = false
--     h (x:xs) (y:ys) 
--       | x == y    = h xs ys 
--       | otherwise = h xs p

-- fibs = 0:1:zipWith (+) fibs (tail fibs)

-- data List a = Empty | ConsList a (List a) 

-- class ToStringable where
--   toString :: forall a.a -> String

-- -- instance ToStringable String where

-- instance Show a => ToStringable (List a) wherev
--   toString :: List a -> String
--   toString Empty           = ""
--   toString (ConsList x xs) = show x <> toString xs


