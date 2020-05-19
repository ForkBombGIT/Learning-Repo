-- |Learn You a Haskell
--  Chapter 2: Starting Out

-- |Baby's First Function
-- The square function takes one integer, multiplies it by itself, 
-- then returns one integer

square :: Int -> Int
square x = x * x

-- The greaterThan function takes two integers, x and y, and returns a true boolean if x is greater
-- than y

greaterThan :: Int -> Int -> Bool
greaterThan x y = x > y

-- |An intro to lists
-- Lists are homogeneous - must be of the same type
-- To combine two lists, use the ++ operator
-- To add an element to a list, use the : operator
-- To get an element from a list by it's index, use the !! operator (indexing starts at 0)
-- Some list functions: head - returns the head of a list
--                      tail - returns the tail of a list
--                      last - returns the last element of a list
--                      init - returns everything but the last element of a list
--                      length - returns the size of a list
--                      null - checks if a list is empty
--                      reverse - reverse a list
--                      take - extracts x amount of elements from the beginning of a list
--                      drop - same as take, excepts removes elements from list
--                      maximum - gets greatest element from list
--                      minimum - gets smallest element from list
--                      sum - gets the sum of a list
--                      product - gets the product of a list
--                      elem - checks if an element exists in a list

-- |Texas ranges
-- To make a list containing all the natural numbers from 1 to 20, you just write [1..20]. That is the equivalent of writing [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
-- Haskell is lazy, so it only evaluates when it absolutely needs to
-- take 2 [1..] will only generate numbers up to the second position in the list, because that's all that is asked 

-- |List Comprehensions
-- The even function takes one array of integers, passes it to a list comprehension
-- which returns one array of integers that equal zero when passed to the mod function

even :: [Int] -> [Int]
even xs = [x | x <- xs, mod x 2 == 0 ]

-- The onlyLowercase function takes one array of characters, passes it to a list comprehension
-- which returns one array of characters that are elements of the array of all lowercase letters

onlyLowercase :: [Char] -> [Char]
onlyLowercase xs = [x | x <- xs, elem x ['a'..'z']]

-- |Tuples
-- Tuples are not homogeneous, and have a set size 
-- Represented as (x1,..,xn)