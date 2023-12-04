newtype Nat a = Nat ((a->a)->a->a)

zero :: Nat a
zero = Nat (\f x -> x)

succN :: Nat a -> Nat a
succN (Nat n) = Nat (\f x -> f (n f x))

-- addN

-- mulN

one :: Nat a
one = succN zero

two :: Nat a
two = succN one

four = succN $ succN two

eval :: Num a => Nat a -> (a -> a) -> a -> a
eval (Nat n) f x = n f x

