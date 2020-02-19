-- |Learn You a Haskell
--  Chapter 2: Starting Out

-- |Baby's First Function
-- The square function takes one integer, multiplys it by itself, 
-- then returns one integer
square :: Int -> Int
square x = x * x

-- The greaterThan function takes two integers, x and y, and returns a true boolean if x is greater
-- than y
greaterThan :: Int -> Int -> Bool
greaterThan x y = x > y

-- |List Comprehensions
-- The even function takes one array of integers, passes it to a list comprehension
-- which returns one array of integers that equal zero when passed to the mod function
even :: [Int] -> [Int]
even xs = [x | x <- xs, mod x 2 == 0 ]

onlyLowercase :: [Char] -> [Char]
onlyLowercase xs = [x | x <- xs, elem x ['a'..'z']]