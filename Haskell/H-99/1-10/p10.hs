-- |Problem 10
-- Run-length encoding of a list. Use the result of problem P09 to implement the so-called run-length encoding data compression method. 
-- Consecutive duplicates of elements are encoded as lists (N E) where N is the number of duplicates of the element E
-- Sample Input:  encode "aaaabccaadeeee"
-- Sample Output: [(4,'a'),(1,'b'),(2,'c'),(2,'a'),(1,'d'),(4,'e')]

encode :: [Char] -> [(Int,a)]
encode arr = encode' (pack arr)

encode' :: [[Char]] -> [(Int,a)]
encode' [] = []
encode' (x:xs) = (count x, head x) : encode' xs

count :: [Char] -> Int
count [] = 0
count (x:xs) = 1 + count xs

pack :: [Char] -> [[Char]]
pack arr = pack' [head arr] (drop 1 arr)

pack' :: [Char] -> [Char] -> [[Char]]
pack' arr [] = arr : []
pack' [] [x] = [[x]]
pack' arr [x] 
    | elem x arr = (x : arr) : []
    | otherwise = [arr,[x]] 
pack' arr (x:xs) 
    | elem x arr = pack' (x : arr) xs
    | otherwise = arr : pack' [x] xs