-- |Problem 3
--  Find the last but one element of a list. 
--  Sample Input:  elementAt [1,2,3,4] 2
--  Sample Output: 2

-- |My Solution
elementAt :: [a] -> Int -> a
elementAt arr n = elementAtHelper arr n 1

elementAtHelper :: [a] -> Int -> Int -> a
elementAtHelper [] n c 
    | (n >= c) || (n == 0) = error "Index out of bounds"
elementAtHelper (h:t) n c
    | (n == c) = h
    | otherwise = elementAtHelper t n (c + 1)