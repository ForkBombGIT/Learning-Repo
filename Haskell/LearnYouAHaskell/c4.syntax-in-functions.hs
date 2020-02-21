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