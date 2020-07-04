-- |Problem 11
-- Modified run-length encoding.
-- Modify the result of problem 10 in such a way that if an element has no duplicates it is simply copied into the result list. 
-- Only elements with duplicates are transferred as (N E) lists. 
-- Sample Input:  encodeModified "aaaabccaadeeee"
-- Sample Output: [Multiple 4 'a',Single 'b',Multiple 2 'c',Multiple 2 'a',Single 'd',Multiple 4 'e']

data Length = Multiple Int Char | Single Char 
    deriving ( Show )

encodeModified :: [Char] -> [Length]
encodeModified arr = encodeModified' (pack arr)

encodeModified' :: [[Char]]  -> [Length]
encodeModified' [] = []
encodeModified' (x:xs) 
    | (amount > 1) = Multiple amount (head x) : encodeModified' xs
    | otherwise = Single (head x) : encodeModified' xs
    where 
        amount = count x
                
count :: [Char]-> Int
count [] = 0
count (x:xs) = 1 + count xs

pack :: [Char]-> [[Char]]
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