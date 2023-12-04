module Curry where

{- 如何在haskell中演示柯里化？ -}

-- add a b  = a + b

-- add :: Num a => (a,a) -> a
-- add (a,b) = a + b

-- add = \a -> \b -> a + b

add = \a b -> a + b