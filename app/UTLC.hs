{-# OPTIONS_GHC -Wno-incomplete-uni-patterns #-}
{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
module UTLC where

data UTLC = Int Int| UTLC(UTLC -> UTLC)

-- w函数
w :: (UTLC -> UTLC) -> UTLC
w x = x (UTLC x)

-- Y组合子
-- y :: (UTLC -> UTLC) -> UTLC
-- y :: f -> a -> b
y :: (UTLC -> UTLC) -> UTLC
y f = w (\(UTLC x) -> f (w x))

twice :: UTLC -> UTLC
twice (UTLC f) =UTLC (\x ->  f (f x))

tt :: UTLC
tt = y twice

-- fib' :: (Int -> Int) -> UTLC -> Int
-- fib' :: (UTLC -> UTLC) -> UTLC -> UTLC
-- fib' g (Int n) = if n > 1 then g (Int $ n-1) + g (Int $ n-2) else Int n
-- tt = y twice
-- fib :: UTLC
-- fib = y fib'
-- true函数
-- true :: UTLC -> UTLC -> UTLC
-- true = \x _ -> x 

-- false :: UTLC -> UTLC -> UTLC
-- false = \_ y -> y

-- zero :: (UTLC -> UTLC) -> UTLC -> UTLC
-- zero = \s z -> z

-- one :: (UTLC -> UTLC) -> UTLC -> UTLC
-- one = \s z -> s z

-- succ :: ((UTLC -> UTLC) -> UTLC -> UTLC) -> (UTLC -> UTLC) -> UTLC -> UTLC
-- succ = \n f x -> f (n f x)

-- pred :: (((UTLC -> UTLC) -> (UTLC -> UTLC) -> UTLC)  -> (UTLC -> UTLC) -> (UTLC -> UTLC) -> UTLC) -> UTLC -> UTLC -> UTLC
-- pred = \n f x -> n (\g h -> h (g f))
                --    (\u -> x)
                --    (\u -> u)

-- mul :: (UTLC -> UTLC) -> (UTLC -> UTLC) -> UTLC -> UTLC
-- mul  = \m n f -> m (n f)

-- isZero :: ((UTLC -> UTLC -> UTLC -> UTLC) -> (UTLC -> UTLC -> UTLC) -> UTLC) -> UTLC
-- isZero = \n -> n (\x -> false) true

-- fact' :: ((UTLC -> UTLC -> UTLC) -> UTLC -> UTLC) -> UTLC -> UTLC
-- fact' = \g -> \n -> (isZero n) one (mul n (g (UTLC.pred n)))

-- fact = y fact'

-- fib' = \g -> \n -> if 