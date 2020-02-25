-- |Problem 6
--  Find out whether a list is a palindrome. A palindrome can be read forward or backward; e.g. (x a m a x). 
--  Sample Input:  isPalindrome [1,2,4,8,16,8,4,2,1]
--  Sample Output: True

-- |My Solution
isPalindrome :: (Eq a) => [a] -> Bool 
isPalindrome [] = True
isPalindrome [_] = True
isPalindrome (h:t) = ((h == last t) && (isPalindrome (dropLast t)))

last' :: [a] -> a
last' [x] = x
last' (h:t) = last' t

dropLast :: [a] -> [a]
dropLast [] = []
dropLast [x,_] = [x]
dropLast (h:t) = h : dropLast t