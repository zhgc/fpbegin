
zero = \f x -> x


succN = \n f x -> f (n f x)
-- n :自然数，需要后继
-- f :对一个自然数后继
-- n f x:计算一个自然数

-- one = \f x -> f x

predN = \n f x -> n (\g h-> h (g f)) (const x) (id)


one = succN zero


two = succN one


three = succN two