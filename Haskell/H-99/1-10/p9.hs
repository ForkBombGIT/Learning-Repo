-- |Problem 9
-- Pack consecutive duplicates of list elements into sublists. If a list contains repeated elements they should be placed in separate sublists. 
-- Sample Input:  pack ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e']
-- Sample Output: ["aaaa","b","cc","aa","d","eeee"]

-- |A Solution
pack :: (Eq a) => [a] -> [[a]]
pack [] = []
pack [x] = [[x]]
pack [x,y]
    | (x /= y) = [[x],[y]]
    | otherwise = [[x,y]]
pack (x:(y:xs))
    | (x /= y) = [[x],[y]] ++ pack(xs)
    | otherwise = [[x,y]] ++ pack(xs)
