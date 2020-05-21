-- |Problem 8
-- Eliminate consecutive duplicates of list elements.
-- If a list contains repeated elements they should be replaced with a single copy of the element. The order of the elements should not be changed. 
-- Sample Input:  compress "aaaabccaadeeee"
-- Sample Output: "abcade"

-- |A Solution
compress :: (Eq a) => [a] -> [a]
compress [] = []
compress [x] = [x]
compress [x,y]
    | (x /= y) = [x,y]
    | otherwise = [x]
compress (x:(y:xs))
    | (x /= y) = x : compress (y:xs)
    | otherwise = compress (x:xs)