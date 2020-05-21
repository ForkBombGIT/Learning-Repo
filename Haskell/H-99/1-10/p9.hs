-- |Problem 9
-- Pack consecutive duplicates of list elements into sublists. If a list contains repeated elements they should be placed in separate sublists. 
-- Sample Input:  pack ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e']
-- Sample Output: ["aaaa","b","cc","aa","d","eeee"]

-- |A Solution
pack :: (Eq a) => [a] -> [[a]]
pack arr = pack' [head arr] arr

pack' :: (Eq a) => [a] -> [a] -> [[a]]
pack' arr [] = arr : []
pack' arr [x] 
    | elem x arr = (x : arr) : []
    | otherwise = [arr,[x]] 
pack' arr (x:xs) 
    | elem x arr = pack' (x : arr) xs
    | otherwise = arr : pack' [x] xs
    