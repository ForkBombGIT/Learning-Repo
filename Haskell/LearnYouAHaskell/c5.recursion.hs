-- |Learn You a Haskell
--  Chapter 5: Recursion

-- |Maximum awesome
--  An implementation of the max function, used to find the maximum element in a list
--  The Ord class ensures that the input is orderable
maximum' :: (Ord a) => [a] -> a  
maximum' [] = error "maximum of empty list" -- recursively, there will never be no elements, handles invalid user input
maximum' [x] = x  -- if there is only one element, return it
maximum' (x:xs)   
    | x > maxTail = x  -- if the head is greater than the greatest tail, return x
    | otherwise = maxTail  -- otherwise return maxTail
    where maxTail = maximum' xs  -- maxTail is the recursive step, call maximum' with the tail of input

-- |Quick sort
--  A Haskell implementation of the quick sort algorithm
quicksort :: (Ord a) => [a] -> [a]  
quicksort [] = []  
quicksort (x:xs) =   
    let smallerSorted = quicksort [a | a <- xs, a <= x]  
        biggerSorted = quicksort [a | a <- xs, a > x]  
    in  smallerSorted ++ [x] ++ biggerSorted  