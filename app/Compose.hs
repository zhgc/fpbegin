module Compose where

{- haskell中的函数组合 
两个参数，都是函数
返回的也是函数
-}

compose :: (b -> c) -> (a -> b) -> (a -> c)
compose f g x = f (g x)

{- 函数应用
($) :: (a -> b) -> a -> b
-}

app :: (a -> b) -> a -> b
app f x = f x