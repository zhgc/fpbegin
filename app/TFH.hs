module TFH where

until' :: (a -> Bool) -> (a -> a) -> a -> a
until' p f x
    | p x       = x 
    | otherwise = until' p f (f x)
{-
毅种循环：
我认为可以看作

until' condition action init 

condition :: (a -> b) 条件
action :: (a -> a) 行为
init :: a 循环变量初值。

将一个循环变量每一轮都由一个函数处理之后，去比较结果是否符合结束条件,如果满足，就结束。

不，实际上是先去和条件对比，再交给action处理
-}



truncate' :: (RealFrac a,Integral b) => a -> b
truncate' a
    | a > 0     = floor a
    | otherwise = ceiling a
{-
趋近于零的函数

它获得一个实数的分数，返回它趋向于零的整数。

但是在它的底层实现中，它或许不是这样实现的。

因为它可以调用指令直接将值的小数部分截断。

不过没关系，我猜floor和ceiling也具有这样的底层优化，所以这样大概不会有什么太大的性能损耗。吧。

转念一想：有没有可能floor和ceiling就是用truncate定义的呢？似乎也可以？
-}



leq :: (Num a,Ord a) => Integer -> a -> Bool
m `leq` x = fromInteger m <= x
{-
leq 
-}