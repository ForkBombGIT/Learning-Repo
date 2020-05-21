-- |Learn You a Haskell
-- Chapter 8: Making Our Own Types and Typeclasses

-- |Algebraic data types intro
-- Example of custom data type definition, the keyword data is used to define it
-- Essentially says that the type Bool can either have the value False or True

data Bool = False | True

-- We can do something similar to represent a shape
-- Essentially says that the type Shape can have the value of Circle which takes three parameters of type
-- Float, or Rectangle which takes four parameters of type Float
-- However, it would cause an error if Shape was printed
-- The custom data type needs to derive the Show typeclass to resolve this error

data Shape = Circle Float Float Float | Rectangle Float Float Float Float deriving (Show)

-- These custom data types can be used in functions
-- surface is a function that takes one parameter of type Shape and returns a Float

surface :: Shape -> Float  
surface (Circle _ _ r) = pi * r ^ 2  
surface (Rectangle x1 y1 x2 y2) = (abs $ x2 - x1) * (abs $ y2 - y1)  

-- Custom data types can be exported
-- By doing Shape(..), all value constructors are exported

module Shapes (
    Shape(..),
    surface
) where

