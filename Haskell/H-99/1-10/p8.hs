-- |Problem 8
--  Eliminate consecutive duplicates of list elements.
--  If a list contains repeated elements they should be replaced with a single copy of the element. The order of the elements should not be changed. 
--  Sample Input:  compress "aaaabccaadeeee"
--  Sample Output: "abcade"

-- |My Solution
compress :: [a] -> [a]
compress [] = []