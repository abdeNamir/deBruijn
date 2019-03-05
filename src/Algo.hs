module Algo
( checkAction
, uniqueAction
, cleanAction
) where

import Control.Monad (replicateM)
import Data.List

isSequence :: Int -> String -> String -> Bool
isSequence x y seq =
    if checkLength x y seq == True && checkDebruijn x y seq == True
        then True
        else False

checkLength :: Int -> String -> String -> Bool
checkLength x y seq =
    if length seq == (length y)^x && checkSameAlpha y seq == True
        then True
        else False

checkSameAlpha :: String -> String -> Bool
checkSameAlpha [] seq = True
checkSameAlpha y seq =
    if head y `elem` seq && checkSameAlpha (tail y) seq == True
        then True
        else False

checkDebruijn :: Int -> String -> String -> Bool
checkDebruijn x y seq = do
    let newseq = replicateM x y
    let listdummy = (seq ++ (take (x-1) seq))
    if infixFunction newseq listdummy == True
        then True
        else False

infixFunction :: [String] -> String -> Bool
infixFunction [] _ = True
infixFunction newseq listdummy =
    if isInfixOf (head newseq) listdummy && infixFunction (tail newseq) listdummy
        then True
        else False

loopThatList :: Int -> String -> String
loopThatList 1 listbig = listbig
loopThatList x seq = do
    let listbig = seq ++ [head seq]
    loopThatList (x-1) (tail seq)

checkAction :: Int -> String -> IO ()
checkAction x y = do
    seq <- getLine
    if isSequence x y seq == True
        then putStrLn ("OK")
        else putStrLn ("KO")

uniqueAction :: Int-> String -> IO ()
uniqueAction x y = do
    seq1 <- getLine
    seq2 <- getLine
    if isUnis x y seq1 seq2 == True
        then putStrLn ("OK")
        else putStrLn ("KO")

isUnis :: Int -> String -> String -> String -> Bool
isUnis x y seq1 seq2 =
    if isSequence x y seq1 == False then False
    else if isSequence x y seq2 == False then False
    else if seq1 == seq2 then False
    else if rotateCheck (length seq1) seq1 seq2 == False then False
    else True

rotate :: Int -> [a] -> [a]
rotate _ [] = []
rotate x xs = zipWith const (drop x (cycle xs)) xs

rotateCheck :: Int -> String -> String -> Bool
rotateCheck 0 _ _ = True
rotateCheck x seq1 seq2 =
    if seq1 == seq2 then False
    else rotateCheck (x-1) (zipWith const (drop 1 (cycle seq1)) seq1) seq2

cleanAction :: Int -> String -> String
cleanAction x y =
    if x == 3
        then "OK"
        else "KO"