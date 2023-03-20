{-
-- EPITECH PROJECT, 2023
-- Wolfram
-- File description:
-- Utils.hs file.
-}

module Utils where

import Text.Read (readMaybe)

createEmptyArray :: Int -> [Int]
createEmptyArray arr = replicate arr 0

printArray :: Int -> [Int] -> IO ()
printArray size arr =
    let len = length arr
        start = max 0 ((len - size) `div` 2)
        end = start + min size len
        pad = replicate ((size - (end - start)) `div` 2) ' '
        subarr = map (\value -> if value == 0 then ' ' else '*')
            (take (end - start) (drop start arr))
    in putStrLn (pad ++ subarr ++ pad)

accessArray :: [Int] -> Int -> Int
accessArray [] _ = 0
accessArray (first:_) 0 = first
accessArray (_:rest) index = accessArray rest (index - 1)

editArray :: [Int] -> Int -> Int -> [Int]
editArray [] _ _ = []
editArray (_:rest) 0 value = value:rest
editArray (first:rest) index value = first:editArray rest (index - 1) value

stringToInt :: String -> Int
stringToInt str = case readMaybe str of
    Just nb -> nb
    Nothing -> error "Invalid integer value"

checkNegativeNb :: Int -> Int
checkNegativeNb nb = if nb < 0
    then error "Negative integer are not allowed"
    else nb
