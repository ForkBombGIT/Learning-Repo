-- |Problem 1
--  Find the last element of a list. 
--  Sample Input:  myLast [1,2,3,4]
--  Sample Output: 4

-- |A Solution
myLast :: [a] -> a
myLast [] = error "Empty list"
myLast [x] = x
myLast (x:xs) = myLast xs