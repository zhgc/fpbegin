compose :: (a -> b) -> (b -> c) -> (a -> c)
compose g f x = f (g x)

v1 = filter odd
