-- |Learn You a Haskell
--  Chapter 6: Higher Order Functions

-- |Curried Functions
--  Every function in Haskell officially only takes one parameter
--  Essentially each function returns a function

multThree :: (Num a) => a -> a -> a -> a  
multThree x y z = x * y * z  

-- All three of these are equivalent: multThree 3 2 1 and (multThree 3) 2 1 and ((multThree 3) 2) 1
-- With this, we can make partially applied functions
-- For example we could do something like this:
-- let multTwoWithNine = multThree 9
-- multTwoWithNine 2 3
-- 54

-- |Some higher-orderism is in order
--  Functions can take functions as parameters and also return functions
-- applyTwice takes a function that takes a type variable and returns a type variable, a type variable, and returns a type variable

applyTwice :: (a -> a) -> a -> a  
applyTwice f x = f (f x)  

-- Example call: applyTwice (+3) 10  
-- 16  

-- |Maps and filters
--  The map takes a function and a list and applies that function to every element in the list, producing a new list.

map :: (a -> b) -> [a] -> [b]  
map _ [] = []  
map f (x:xs) = f x : map f xs  

-- filter is a function that takes a predicate (a predicate is a function that tells whether something is true or not, so in our case, a function that returns a boolean value) and 
-- a list and then returns the list of elements that satisfy the predicate.

filter :: (a -> Bool) -> [a] -> [a]  
filter _ [] = []  
filter p (x:xs)   
    | p x       = x : filter p xs  
    | otherwise = filter p xs  

-- quicksort is an implementation of the quicksort algorithm, however this one uses the filter function

quicksort :: (Ord a) => [a] -> [a]    
quicksort [] = []    
quicksort (x:xs) =     
    let smallerSorted = quicksort (filter (<=x) xs) -- filter out all elements less than x and pass it to quicksort  
        biggerSorted = quicksort (filter (>x) xs)   -- filter out all elements greater than x and pass it to quicksort
    in  smallerSorted ++ [x] ++ biggerSorted        -- add the result of the smaller sort to the left of x, and the result of the larger sort to the right of x

-- |Lambdas
--  Anonymous, typically single use functions
--  Written as: \<parameters> -> <body>