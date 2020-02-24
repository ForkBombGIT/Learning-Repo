-- |Learn You a Haskell
--  Chapter 4: Syntax in Functions

-- |Pattern Matching
-- The factorial function is a recursive function that asserts the Integral class constraint which takes one variable and returns the factorial of it
-- The function uses pattern matching, which runs are certain part of the function when a condition is matched
factorial :: (Integral a) => a -> a
factorial 0 = 1 -- when x = 0, return 1 - this is the base case
factorial x = x * factorial (x - 1) -- for any other value of x, return a call to factorial with x subtract 1 - this is the recursive step

-- charName takes a character and returns a string holding a name that starts with the passed character
-- This is an example of a pattern matching function with non-exhaustive cases
charName :: Char -> String  
charName 'a' = "Albert"  
charName 'b' = "Broseph"  
charName 'c' = "Cecil" 

-- |Guards, guards!
-- bmiTell takes a RealFloat (float and double, essentially) and returns a string in response to the float
-- This is an example of guards, which are essentially Haskells equivalent to if else statements
bmiTell :: (RealFloat a) => a -> String  
bmiTell bmi  
    | bmi <= 18.5 = "You're underweight, you emo, you!"  
    | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"  
    | otherwise   = "You're a whale, congratulations!"  

-- This version of bmiTell takes input from the user which represents the height and weight of the person
-- It is an example of calculations made in a guard's conditional
bmiTell' :: (RealFloat a) => a -> a -> String  
bmiTell' weight height  
    | weight / height ^ 2 <= 18.5 = "You're underweight, you emo, you!"  
    | weight / height ^ 2 <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | weight / height ^ 2 <= 30.0 = "You're fat! Lose some weight, fatty!"  
    | otherwise                   = "You're a whale, congratulations!"  

-- |Where!?
-- This version of bmiTell is similar to the one above that takes weight and height and uses it to calculate the bmi of the user
-- Although, this one utilizes the keyword where
-- Rather than repeating a calculation multiple times, we can use the keyword where to define a "variable" to hold this calculation result
bmiTell'' :: (RealFloat a) => a -> a -> String  
bmiTell'' weight height  
    | bmi <= skinny = "You're underweight, you emo, you!"  
    | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | bmi <= fat    = "You're fat! Lose some weight, fatty!"  
    | otherwise     = "You're a whale, congratulations!"  
    where bmi = weight / height ^ 2  
          skinny = 18.5
          normal = 25.0
          fat    = 30.0

-- Functions can also be defined with the where keyword
-- bmiCalc takes a height and weight, and returns the bmi
bmiCalc :: (RealFloat a) => a -> a -> a
bmiCalc weight height = bmi weight height
    where bmi weight height = weight / height ^ 2

-- |Let it be
--  The structure of the let keyword is: let <bindings> in <expression>
--  Let is similar to where however the scope of let is much smaller
--  While where can be used throughout an entire function, that isn't always the case with let
cylinder :: (RealFloat a) => a -> a -> a  
cylinder r h = 
    let sideArea = 2 * pi * r * h  
        topArea = pi * r ^2  
    in  sideArea + 2 * topArea  

-- |Case expressions
--  Essentially just pattern matching
--  These two functions are equivalent
head' :: [a] -> a  
head' [] = error "No head for empty lists!"  
head' (x:_) = x  
--  Structured as case <expression> of <pattern> -> result  
head' :: [a] -> a  
head' xs = case xs of [] -> error "No head for empty lists!"  
                        (x:_) -> x  