{-
-- EPITECH PROJECT, 2023
-- Wolfram
-- File description:
-- Rule90.hs file.
-}

module Rule90 where

import Utils

computeRule90Cell :: Int -> [Int] -> [Int] -> [Int]
computeRule90Cell index lArray hArray =
    let left = accessArray hArray (index - 1)
        center = accessArray hArray index
        right = accessArray hArray (index + 1)
        res 0 0 1 = editArray lArray index 1
        res 0 1 1 = editArray lArray index 1
        res 1 0 0 = editArray lArray index 1
        res 1 1 0 = editArray lArray index 1
        res _ _ _ = editArray lArray index 0
    in res left center right
