{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE PolyKinds #-}
module Vec where

data Vec (n :: k) a = Vec [a]
  deriving Show

v3i :: Vec 3 Int
v3i = Vec [1,2,3]

v2s :: Vec 2 String
v2s = Vec ["hello","world"]

{-
实际上吧我暂时只能认为，

DataKinds是一种将值提升为类型，或者将种提升为值的手段。

上面的Vec 3 Int实际上对数组并没有约束力，无法让她只能长度为三。

它仅仅是给了数组一个分类而已。
-}