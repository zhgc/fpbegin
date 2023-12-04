newtype Nat a = Nat ((a -> a)-> a -> a)

succN :: Nat a -> Nat a
succN (Nat n) = Nat (\f x -> f (n f x))

addN (Nat m) (Nat n) = Nat (\f x -> m f (n f x))

mulN (Nat m) (Nat n) = Nat (m . n)

zero :: Nat a
zero = Nat (\f x -> x)

one :: Nat a
one = succN zero

eval :: Num a => Nat a -> a
eval (Nat n) = n (+1) 0