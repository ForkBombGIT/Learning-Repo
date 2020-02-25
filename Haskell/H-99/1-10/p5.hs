-- |Problem 5
--  Reverse a list. 
--  Sample Input:  myReverse "A man, a plan, a canal, panama!"
--  Sample Output: "!amanap ,lanac a ,nalp a ,nam A"

-- |My Solution
myReverse :: [a] -> [a]
myReverse [] = []
myReverse (h:t) = (myReverse t) ++ [h]