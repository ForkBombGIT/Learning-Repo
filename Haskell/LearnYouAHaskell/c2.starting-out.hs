-- |Learn You a Haskell
--  Chapter 2: Starting Out

-- |Baby's First Function
square :: Int -> Int
square x = x + x

-- |List Comprehensions
evens :: [Int] -> [Int]
evens xs = [x | x <- xs, mod x 2 == 0 ]

