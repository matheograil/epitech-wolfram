{-
-- EPITECH PROJECT, 2023
-- Wolfram
-- File description:
-- Rule.hs file.
-}

module Rule where

import OptionalArgs
import Utils
import Rule30
import Rule90
import Rule110

computeRuleCellDispatcher :: Int -> [Int] -> [Int] -> [Char] -> [Int]
computeRuleCellDispatcher index lArray hArray rule = case rule of
    "30" -> computeRule30Cell index lArray hArray
    "90" -> computeRule90Cell index lArray hArray
    "110" -> computeRule110Cell index lArray hArray
    _ -> error "Invalid rule argument (30, 90 or 110)"

computeRuleLine :: Int -> [Int] -> [Int] -> [Char] -> [Int]
computeRuleLine loops lArray hArray rule = if loops == 0
    then lArray
    else computeRuleLine (loops - 1) (computeRuleCellDispatcher loops lArray
        hArray rule) hArray rule

printRuleLines :: Int -> Int -> Int -> [Int] -> [Int] -> [Char] -> IO ()
printRuleLines _ _ 0 _ _ _ = return ()
printRuleLines rWindow window loops lArray hArray rule =
    printArray rWindow hArray
    >> printRuleLines rWindow window (loops - 1) hArray (computeRuleLine window
    lArray hArray rule) rule

printRule :: OptionalArgsStruct -> [Char] -> IO ()
printRule optionalArgs rule =
    let hArray = editArray (createEmptyArray (linesNb optionalArgs * 2))
            (((linesNb optionalArgs) * 2) `div` 2) 1
        lArray = createEmptyArray ((linesNb optionalArgs) * 2)
    in printRuleLines (window optionalArgs) ((linesNb optionalArgs) * 2)
        (linesNb optionalArgs) lArray hArray rule
