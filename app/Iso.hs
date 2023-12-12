module Iso where

-- b = Cons(b -> a)
newtype Iso a = Iso (Iso a -> a)
-- a = Cons(a -> a)
-- newtype Ir a = Ir (Ir a -> Ir a)

-- ww :: (Ir -> Ir) -> Ir
-- ww = \x -> x (Ir x)

-- w :: (Iso a -> a) -> a
w :: (Iso a -> a) -> a
w = \x -> x (Iso x)

twice :: (t -> t) -> t -> t
twice = \f -> \x -> f (f x)

-- w = \x -> x x
-- Y = \f -> (\x -> f (x x)) (\x -> f (x x))
-- Y = \f -> (\x -> x x) (\x -> f (x x))
-- Y = \f -> w (\x -> f (x x))
-- Y = \f -> w (f.w)

-- yy :: (Ir -> Ir) -> Ir
-- yy = \f -> ww (\(Ir x) -> f (ww x))

y = \f -> w (\(Iso x) -> f (w x))

fib' = \g -> \n -> if n < 2 then n else g (n-1) + g (n-2)

fib = y fib'

-- fib2 = yy fib'