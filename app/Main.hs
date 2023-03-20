{-
-- EPITECH PROJECT, 2023
-- Wolfram
-- File description:
-- Main.hs file.
-}

module Main where

import System.Environment
import MandatoryArgs
import OptionalArgs
import Rule

main :: IO ()
main = do
    args <- getArgs
    let mandatoryArgs = parseMandatoryArgs args
    let optionalArgs = parseOptionalArgs args initOptionalArgs
    printRule optionalArgs (rule mandatoryArgs)
