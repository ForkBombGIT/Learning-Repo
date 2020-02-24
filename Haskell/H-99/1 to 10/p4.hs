-- |Problem 4
--  Find the number of elements of a list.  
--  Sample Input:  myLength [123, 456, 789]
--  Sample Output: 3

-- |My Solution
myLength :: [a] -> Int
myLength arr = myLengthHelper arr 0

myLengthHelper :: [a] -> Int -> Int
myLengthHelper [] c = c
myLengthHelper (h:t) c = myLengthHelper t (c + 1)