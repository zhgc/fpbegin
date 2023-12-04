zero = \f x -> x

-- one = \f x -> f x

succN = \n f x -> f (n f x)

one = succN zero

two = succN one

three = succN two

eval n f = n f 0

