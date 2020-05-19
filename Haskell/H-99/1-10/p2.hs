-- |Problem 2
--  Find the last but one element of a list. 
--  Sample Input:  myButLast [1,2,3,4]
--  Sample Output: 3

-- |My Solution
myButLast :: [a] -> a
myButLast [] = error "Empty list"
myButLast [x] = error "Only one element"
myButLast [x,_] = x
myButLast (x:xs) = myButLast xs