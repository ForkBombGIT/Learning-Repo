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

