-- |Learn You a Haskell
-- Chapter 6: Higher Order Functions

-- |Curried Functions
-- Every function in Haskell officially only takes one parameter
-- Essentially each function returns a function

multThree :: (Num a) => a -> a -> a -> a  
multThree x y z = x * y * z  

-- All three of these are equivalent: multThree 3 2 1 and (multThree 3) 2 1 and ((multThree 3) 2) 1
-- With this, we can make partially applied functions
-- For example we could do something like this:
-- let multTwoWithNine = multThree 9
-- multTwoWithNine 2 3
-- 54

-- |Some higher-orderism is in order
-- Functions can take functions as parameters and also return functions
-- applyTwice takes a function that takes a type variable and returns a type variable, a type variable, and returns a type variable

applyTwice :: (a -> a) -> a -> a  
applyTwice f x = f (f x)  

-- Example call: applyTwice (+3) 10  
-- 16  

-- |Maps and filters
-- The map takes a function and a list and applies that function to every element in the list, producing a new list.

map :: (a -> b) -> [a] -> [b]  
map _ [] = []  
map f (x:xs) = f x : Prelude.map f xs  

-- filter is a function that takes a predicate (a predicate is a function that tells whether something is true or not, so in our case, a function that returns a boolean value) and 
-- a list and then returns the list of elements that satisfy the predicate.

filter :: (a -> Bool) -> [a] -> [a]  
filter _ [] = []  
filter p (x:xs)   
    | p x       = x : Prelude.filter p xs  
    | otherwise = Prelude.filter p xs  

-- quicksort is an implementation of the quicksort algorithm, however this one uses the filter function

quicksort :: (Ord a) => [a] -> [a]    
quicksort [] = []    
quicksort (x:xs) =     
    let smallerSorted = quicksort (Prelude.filter (<=x) xs) -- filter out all elements less than x and pass it to quicksort  
        biggerSorted = quicksort (Prelude.filter (>x) xs)   -- filter out all elements greater than x and pass it to quicksort
    in  smallerSorted ++ [x] ++ biggerSorted        -- add the result of the smaller sort to the left of x, and the result of the larger sort to the right of x

-- |Lambdas
-- Anonymous, typically single use functions
-- Written as: \<parameters> -> <body>

-- addPairs makes use of the lambda function to take an array of pairs and sum the x and y values of each pair

addPairs :: (Num x) => [(x,x)] -> [x]
addPairs arr = Prelude.map (\(x,y) -> x + y) arr

-- |Only folds and horses
-- Folds are used to reduce an array to a single function
-- Direction of fold can also be specified: left to right, or right to left
-- sum' returns the sum of an array, however this implementation uses lambdas and foldl (fold from left)
-- the lambda function could just be replaced with (+) for the same behavior'

sum' :: (Num a) => [a] -> a  
sum' xs = foldl (\acc x -> acc + x) 0 xs  

-- foldl1 and foldr1 also exist, which start at the first element
-- these functions do not work with empty lists, because they assume that they are provided with a list with length >= 1
-- Using scanl and scanr, which provide the same behavior as fold, we can see the change of values in the form of an array

-- |Function application with $
-- ($) :: (a -> b) -> a -> b  
-- f $ x = f x  
-- Function application with $ is right-associative 

-- |Function composition
-- Function composition can be preformed using the . function
-- negateArray will take an array and make all values negative

negateArray :: (Num a) => [a] -> [a]
negateArray arr = Prelude.map (negate . abs) arr -- the result of abs will be passed into negate using function composition
