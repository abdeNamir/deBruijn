module Parsing
( isWordNumber
, checkParameter
, checkAlphabet
) where

import Data.Char
import System.Exit
import Text.Read

isWordNumber :: String -> Bool
isWordNumber [] = True
isWordNumber x =
    if isDigit (head x)
        then isWordNumber(tail x)
        else False

checkParameter :: String -> Int
checkParameter "--check" = 1
checkParameter "--unique" = 2
checkParameter "--clean" = 3
checkParameter _ = 0

checkAlphabet :: (Eq a) => [a] -> Bool
checkAlphabet list = case list of
    []      -> True
    (x:xs)  -> if x `elem` xs then False else checkAlphabet xs