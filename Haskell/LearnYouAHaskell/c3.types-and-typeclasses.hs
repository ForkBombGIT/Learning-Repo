-- |Learn You a Haskell
--  Chapter 3: Types and Typeclasses

-- |Believe the Type
-- factorialInt takes one integer and returns one integer holding the factorial of the passed in value
factorialInt :: Int -> Int
factorialInt x = product [1..x]

-- factorialInteger takes one integer and returns one integer holding the factorial of the passed in value
-- This function is used to show there are two integer type in haskell
-- Int is bounded, while Integer is not
factorialInteger :: Integer -> Integer
factorialInteger x = product [1..x]

-- circumferenceFloat takes one float, r, and returns one float holding the circumference of r
-- The type Float is a real floating point with single precision
circumferenceFloat :: Float -> Float  
circumferenceFloat r = 2 * pi * r  

-- circumferenceDouble takes one float, r, and returns one float holding the circumference of r
-- The type Float is a real floating point with double precision
circumferenceDouble :: Double -> Double  
circumferenceDouble r = 2 * pi * r  

-- Haskell also supports Bool and Char

-- |Type variables
-- The takeHead function takes a type variable (similar to a generic) array, and returns the first element of the array
takeHead :: [a] -> a
takeHead (h:t) = h

-- |Typeclasses
-- findValue is a recursive function that asserts the class constraint of Eq and takes a type variable and a type variable array
-- which returns true if the variable is found within the array
-- A class constraint is used to ensure that the type variables passed in are members of the class constraint applied, in this case the Eq class.
-- The Eq typeclass provides an interface for testing for equality. 
-- Any type where it makes sense to test for equality between two values of that type should be a member of the Eq class. 
-- All standard Haskell types except for IO (the type for dealing with input and output) and functions are a part of the Eq typeclass.
findValue :: (Eq a) => a -> [a] -> Bool
findValue _ [] = False
findValue x [h] = x == h
findValue x (h:t) 
    | (x == h) = True
    | otherwise = findValue x t

-- addVals adds two Num class values and returns the result
-- Num is a numeric typeclass. Its members have the property of being able to act like numbers. Let's examine the type of a number.
addVals :: (Num a) => a -> a -> a
addVals x y = x + y

-- Some other typeclasses include: Ord (for ordering), Show (can be presented as a string), Enum (subquentially ordered values), Bounded (upper and lower bounded)