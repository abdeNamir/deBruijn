module Main where

import Lib
import Parsing
import Algo
import System.Environment (getArgs)
import System.Exit

main :: IO ()
main = do
    args <- getArgs
    if args == []
        then do
            putStrLn usage
            exitWith (ExitFailure 84)
    else if length args == 3 && isWordNumber(head args) == True && checkAlphabet (head(tail args)) == True && checkParameter (last args) /= 0
        then do
            if checkParameter (last args) == 1
                then checkAction (read (head args)) (args !! 1)
            else if checkParameter (last args) == 2
                then uniqueAction (read (head args)) (args !! 1)
            else if checkParameter (last args) == 3
                then exitWith (ExitFailure 84)
                else print ("pas encore coder cette partie")
    else if length args == 2 && isWordNumber(head args) == True && checkParameter (last args) /= 0
        then do
            if checkParameter (last args) == 1
                then checkAction (read (head args)) ("01")
            else if checkParameter (last args) == 2
                then uniqueAction (read (head args)) ("01")
            else if checkParameter (last args) == 3
                then exitWith (ExitFailure 84)
                else print ("pas encore coder cette partie")
    else if length args == 2 && isWordNumber(head args) == True && checkAlphabet (head(tail args)) == True
        then putStrLn ("genere sequence avec alphabet")
    else if length args == 1 && isWordNumber(head args) == True
        then putStrLn ("genere sequence sans alphabet")
    else do
        putStrLn usage
        exitWith (ExitFailure 84)

usage :: String
usage = "USAGE: ./deBruijn n [a] [--check|--unique|--clean]\n\n\t--check\t\tcheck if a sequence is a de Bruijn sequence\n\t--unique\tcheck if 2 sequences are distinct de Bruijn sequences\n\t--clean\t\tlist cleaning\n\tn\t\torder of the sequence\n\ta\t\talphabet [def: \"01\"]"