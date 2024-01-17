{-# OPTIONS_GHC -Wno-incomplete-uni-patterns #-}
{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant lambda" #-}
{-# HLINT ignore "Use const" #-}
module UTLC where

-- data UTLC = Int Int| UTLC(UTLC -> UTLC)

newtype UTLC = UTLC(UTLC -> UTLC)

-- type UTL = UTL -> UTL

type Nat = (UTLC -> UTLC) -> UTLC -> UTLC

true :: UTLC -> UTLC -> UTLC
true = \x y -> x

false :: UTLC -> UTLC -> UTLC
false = \x y -> y

zero :: Nat
zero = \f x -> x

one :: Nat
one = \f x -> f x

succ' :: Nat -> Nat
succ' = \n f x ->f (n f x)

-- pred' :: Nat -> Nat
pred' :: (((t1 -> t2) -> (t2 -> t3) -> t3)  -> (p1 -> p2) -> (p3 -> p3) -> t4) -> t1 -> p2 -> t4
pred' = \n f x -> n (\g h -> h (g f)) (\u -> x) (\u->u)

-- isZero :: Nat -> UTLC
-- isZero  = \n -> n (\x -> false) true 

-- eval :: Nat -> Int
-- eval n | 




-- -- w函数
-- w :: (UTLC -> UTLC) -> UTLC
-- w x = x (UTLC x)

-- -- Y组合子
-- -- y :: (UTLC -> UTLC) -> UTLC
-- -- y :: f -> a -> b
-- y :: (UTLC -> UTLC) -> UTLC
-- y f = w (\(UTLC x) -> f (w x))

-- twice :: UTLC -> UTLC
-- twice (UTLC f) =UTLC (\x ->  f (f x))

-- tt :: UTLC
-- tt = y twice
