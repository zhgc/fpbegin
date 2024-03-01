module Sudo where

type Row a = [a]
type Matrix a = [Row a]

type Digit = Char
type Grid = Matrix Digit

digits :: [Char]
digits = ['1' .. '9']

blank :: Digit -> Bool
blank = (== '0')

solve :: Grid -> [Grid]
solve = filter valid . completations

completations :: Grid -> [Grid]
completations = expand . choices

expand :: Matrix [Digit] -> [Grid]
expand = undefined

choices :: Grid -> Matrix [Digit]
choices = map (map cho)

cho :: Digit -> [Char]
cho d
    | blank d   = digits
    | otherwise = [d] 

valid = undefined
