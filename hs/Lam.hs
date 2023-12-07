-- data Lambda = Lambda(Lambda -> Lambda)
newtype Recu a = Recu (Recu a -> a)

w_c :: (Recu a -> a) -> a
w_c = \h ->  h (Recu h)

y_c :: (a -> a) -> a
y_c = \f -> w_c (\(Recu x) -> f(w_c x))


-- w = \x -> x x

-- y = \f -> (\x -> f (x x)) (\x -> f (x x))

-- y = \f -> (\x -> x x) (\x -> f (x x))