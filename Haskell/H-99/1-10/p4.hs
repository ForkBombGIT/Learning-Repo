-- |Problem 4
--  Find the number of elements of a list. 
--  Sample Input:  myLength [123, 456, 789]
--  Sample Output: 3

-- |My Solution
myLength :: [a] -> Int
myLength arr = lengthHelper arr 0

lengthHelper :: [a] -> Int -> Int
lengthHelper [] c = c
lengthHelper (h:t) c = lengthHelper t (c + 1)