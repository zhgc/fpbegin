{-

python的模式匹配与haskell的模式匹配不太相同

具体是什么地方不一样呢？

-}


module Case where

{-
result = case x of 
    xx -> yy
    xx -> yy

他是表达式，它具有计算结果。

haskell中的模式匹配，是函数定义时默认支持的。

由于，haskell的类型系统比较严格，而且case of是一个表达式，所以，所有的case必须是同一个类型。
-}

fib :: (Eq t, Num t, Num a) => t -> a
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

{-
fib n = case n of
    0 -> 0
    1 -> 1
    n' -> fib(n' - 1) + fib (n' - 2)
-}


{-

模式匹配到底在匹配什么东西？

首次是字面量。

另一个是构造函数。

-}


{-

data List a = [] | a : (List a)

-}
qsort :: Ord a => [a] -> [a]
qsort []     = []
qsort (x:xs) = qsort left ++ [x] ++ qsort right
    where
        left = filter (<=x) xs
        right = filter (>x) xs

data User = User String String Int deriving(Show)

putUser (User name gender age) = name ++ gender ++ show age


{-
本集视频到此结束

下一集再见

bye
-}