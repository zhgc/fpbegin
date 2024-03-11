module Generator where

data Gen a 
    = Gen (a,Gen a)
    | None

class Generator g where
    this :: g a -> a
    next :: g a -> g a

instance Show a => Show (Gen a) where
    show :: Gen a -> String
    show None = "None"
    show (Gen (x,g')) = "Gen(" ++ show x ++ "," ++ show g' ++ ")"

instance Generator Gen  where
    this :: Gen a -> a
    this None         = error "<- 没了 ->"
    this (Gen (x,_))  = x

    next :: Gen a -> Gen a
    next None         = error "<- 绝嗣了 ->"
    next (Gen (_,g')) = g'

instance Functor Gen where
    fmap :: (a -> b) -> Gen a -> Gen b
    fmap _ None = None
    fmap f (Gen(a,g')) = Gen(f a,fmap f g')

instance Semigroup (Gen a) where
    (<>) :: Gen a -> Gen a -> Gen a
    None <> g        = g
    (Gen(x,g')) <> g = Gen (x,g' <> g)

instance Enum a => Enum (Gen a) where
    succ :: Gen a -> Gen a
    succ None = None
    succ g    = succ <$> g

    pred :: Gen a -> Gen a
    pred None = None
    pred g    = pred <$> g

    toEnum :: Int -> Gen a
    toEnum n = Gen(toEnum n,None)

    fromEnum ::     Gen a -> Int
    fromEnum None        = 0
    fromEnum (Gen(x,g')) =fromEnum x + fromEnum g'


generator :: (a -> a) -> a -> Gen a
generator f x = Gen (x,generator f (f x))

{-
试试看用生成器求斐波那契数列

fib = generator (\(a,b) -> (b,a+b)) (0,1)
fib |> genGoto 10 |> this |> fst
-}

genToList :: Gen a -> [] a
genToList None         = []
genToList (Gen (x,g')) = x:genToList g'

listToGen :: [] a -> Gen a
listToGen []     = None
listToGen (x:xs) = Gen (x,listToGen xs)

genUntil :: (t -> t) -> t -> (t -> Bool) -> Gen t
genUntil f x con
    | con x     = None
    | otherwise = Gen (x,genUntil f (f x) con)

genAToB :: (Enum a,Eq a) => a -> a -> Gen a
genAToB a b 
    | a == b    = Gen(a,None)
    | otherwise = Gen(a,genAToB (succ a) b)

genGoto :: Int -> Gen a -> Gen a
genGoto _ None        = None
genGoto n g@(Gen(_,g')) 
    | n == 0    = None
    | n == 1    = g
    | otherwise = genGoto (n-1) g'

showThisGen :: Show a => Gen a -> String
showThisGen None          = "None"
showThisGen (Gen(x,None)) = "Gen(" ++ show x ++ ",None)"
showThisGen (Gen(x,_))    = "Gen(" ++ show x ++ ",...)"