{-

-}

f :: Num a => a -> a
f(x) = x+1 

main :: IO ()
main = do {putStrLn("hello haskell")}

add :: Num a => a -> a -> a
add a b = a + b