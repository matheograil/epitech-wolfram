{-
-- EPITECH PROJECT, 2023
-- Wolfram
-- File description:
-- OptionalArgs.hs file.
-}

module OptionalArgs where

import Utils

data OptionalArgsStruct = OptionalArgsStruct {
    start :: Int,
    linesNb :: Int,
    window :: Int,
    move :: Int
}

initOptionalArgs :: OptionalArgsStruct
initOptionalArgs = OptionalArgsStruct {
    start = 0,
    linesNb = -1,
    window = 80,
    move = 0
}

parseOptionalArgs :: [String] -> OptionalArgsStruct -> OptionalArgsStruct
parseOptionalArgs args currentOptionalArgs = OptionalArgsStruct {
    start = checkNegativeNb(getOptionalArgValue "--start" args
        (start currentOptionalArgs)),
    linesNb = checkNegativeNb(getOptionalArgValue "--lines" args
        (linesNb currentOptionalArgs)),
    window = checkNegativeNb(getOptionalArgValue "--window" args
        (window currentOptionalArgs)),
    move = getOptionalArgValue "--move" args (move currentOptionalArgs)
}

getOptionalArgValue :: String -> [String] -> Int -> Int
getOptionalArgValue argName args currentArgValue =
    case dropWhile (/= argName) args of
        (_:argValue:_) -> stringToInt argValue
        _ -> currentArgValue
