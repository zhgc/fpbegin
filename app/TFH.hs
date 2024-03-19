module TFH where
import Data.Foldable1 (Foldable1)

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

getJavascript :: String -> String
getJavascript [] = []
getJavascript str
    | h str p = p
    | otherwise = []
    where
        p = "javascript"
        h [] [] = True
        h [] _  = False
        h _  [] = True
        h (x:xs) (y:ys)
            | x == y    = h xs ys
            | otherwise = h xs p



data R  = I Int| E | R R deriving(Show)

instance Enum R where
    succ :: R -> R
    succ E  = R E
    succ ra = R ra

    pred :: R -> R
    pred (R x) = x
    pred x     = x

    toEnum :: Int -> R
    toEnum 0 = E
    toEnum n = R $ toEnum (n-1)

    fromEnum :: R -> Int
    fromEnum E     = 0
    fromEnum (I _) = 0
    fromEnum (R x) = 1+fromEnum x

foldR :: (Eq t, Num t) => (a -> a) -> a -> t -> a
foldR f r 0 = r
foldR f r n = f $ foldR f r (n-1)

getP :: String -> String -> String
getP _      [] = []
getP []      _ = []
getP (s:str) p
    | h (s:str) p str = p
    | otherwise       = []
    where h _ [] _          = True
          h [] _ _          = False
          h (x:xs) (y:ys) back
            | x == y    = h xs ys back
            | otherwise = h back p (tail back)
{-

跑通了是跑通了，不过性能非常差，如果性能比普通的匹配更差，那叫什么kmp呢？

-}

kmp :: String -> String -> Maybe Int
kmp str pattern = flip (-) (length pattern) <$> kmp' str pattern dpp
    where
        kmp' :: String -> String -> [(Int,Int,String)] -> Maybe Int
        -- kmp' xs ys ps
        kmp' _ [] _ = Just 1
        kmp' [] _ _ = Nothing
        kmp' (x:xs) (y:ys) ps
            | x == y    = (+1) <$> kmp' xs ys (comp x ps)
            | otherwise = (+1) <$> kmp' xs (drop (next ps) pattern) dpp
        dpp = dp pattern

next :: [(Int,Int,String)] -> Int
next [] = 0
next ((n,z,y):ps) = n

comp :: Char -> [(Int,Int,String)] -> [(Int,Int,String)]
comp x ps = filter (\(n,z,ys) -> n /= 0 || z /= 0 || ys /= []) $ comp' x ps

comp' :: Char -> [(Int,Int,String)] -> [(Int,Int,String)]
comp' _ []           = []
comp' x ((n,z,[]):yss) = (n,z,[]):comp' x yss
comp' x ((n,z,y:ys):yss)
    | z /= 0    = (n,z-1,y:ys):comp' x yss
    | x == y    = (n+1,z,ys):comp' x yss
    | otherwise = (0,z,[]):comp' x yss

dp :: String -> [(Int,Int,String)]
dp str =tail $ dp' str 0 0
    where dp' [x] n z = [(n,z,[x])]
          dp' xs n z  = (n,z,xs) : dp' (init xs) n (z+1)



theKmp :: String -> String -> Maybe Int
theKmp str pattern = flip (-) (length pattern) <$> kmp' str pattern 1
    where
        kmp' _ [] _ = Just 1
        kmp' [] _ _ = Nothing
        kmp' (x:xs) (y:ys) n
            | x == y                = (+1) <$> kmp' xs ys (n+1)
            | lenp == length (y:ys) = (+1) <$> kmp' xs pattern 1
            | otherwise             = kmp' (x:xs) (drop (nexts!!n) pattern) (if nexts!!n == 0 then 1 else nexts!!n)
        nexts = lenp:0:getNext 1 0
        lenp = length pattern
        getNext i j
            | i == head nexts = []
            | j == 0 || pattern!!i == pattern!!j = j+1:getNext (i+1) (j+1)
            | otherwise = getNext i (nexts!!j)

-- nexts = 0:0:getNext 1 0 5
-- getNext i j len |len == i = []| j == 0 || "ababa"!!i == "ababa"!!j = j+1:getNext (i+1) (j+1) len | otherwise = getNext i (nexts!!j) len