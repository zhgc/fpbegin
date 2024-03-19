module Nat where

-- swap :: (a,b) -> (b,a)
-- swap :: (a,a) -> (a,a)

-- swap (a,b) = (b,a)

swap :: Either (a,b) (b,a) -> Either (a,b) (b,a)
swap (Left (a,b)) = Right (b,a)
swap (Right (b,a)) = Left (a,b)



twice :: (t -> t) -> t -> t 
twice f x = f $ f x

-- twice (swap::(a,a)->(a,a))

f a = [a]

{-
[] [[]] [[[]]] [[[[]]]]
需要将他们定义为同一类型

怎么可能？

完全可以。实际上有一个现成的递归类型
-}

-- list = [1,2,3,4,5]
-- list = (((([]))))

data Nat = Zero | Succ Nat deriving(Show,Eq,Ord)

fold f x 0 = x
fold f x n = f $ fold f x (n-1)

{-
类型即命题，程序即证明

swap :: Either (a,b) (b,a) -> Either (a,b) (b,a)

twice :: (t -> t) -> t -> t
twice f x =

VCR 到此结束

byebye

记得一键三联

点赞评论转发收藏。

-}