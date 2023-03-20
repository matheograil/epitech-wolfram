{-
-- EPITECH PROJECT, 2023
-- Wolfram
-- File description:
-- MandatoryArgs.hs file.
-}

module MandatoryArgs where

data MandatoryArgsStruct = MandatoryArgsStruct {
    rule :: String
}

parseMandatoryArgs :: [String] -> MandatoryArgsStruct
parseMandatoryArgs args = MandatoryArgsStruct {
    rule = getMandatoryArgValue "--rule" args
}

getMandatoryArgValue :: String -> [String] -> String
getMandatoryArgValue argName args = case dropWhile (/= argName) args of
    (_:argValue:_) -> argValue
    _ -> error ("Missing argument: " ++ argName)
