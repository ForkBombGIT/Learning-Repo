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

