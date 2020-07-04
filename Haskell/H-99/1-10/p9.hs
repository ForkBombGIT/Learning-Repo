-- |Problem 9
-- Pack consecutive duplicates of list elements into sublists. If a list contains repeated elements they should be placed in separate sublists. 
-- Sample Input:  pack ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e']
-- Sample Output: ["aaaa","b","cc","aa","d","eeee"]

-- |A Solution
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
