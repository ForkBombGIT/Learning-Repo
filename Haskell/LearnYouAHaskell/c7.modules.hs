-- |Learn You a Haskell
-- Chapter 7: Modules

-- A module is a collection of related functions, types, and classes
-- The syntax for importing modules in a Haskell script is import <module name>
-- This import makes all exports in Data.List available to this file, in global scope

import Data.List  

-- To import specific functions, we can do this: import Data.List (nub)
-- To exclude a specific function, we can do this: import Data.List hiding (nub)
-- To avoid function ambiguity, we can do this: import qualified Data.List, which forces use to include Data.List before function calls from this module (ex: Data.List.nub)
-- We can also provide a name for the module like this: import Data.List as L

-- numUniques takes a list and returns the length of the list without duplicates

numUniques :: (Eq a) => [a] -> Int  
numUniques = length . nub  -- nub is a function from Data.List that takes a list and removes duplicates
                           -- the . is used for function composition, in this case it passes the result of nub to length

-- |Some notable modules
-- Data.List provides a variety of functions for manipulating lists
-- Data.Char provides a variety of functions for manipulating characters
-- Data.Map provides functions for manipulating "Association Maps" - lists that store key-value pairs where ordering does not matter
-- Data.Set provides functions for working with sets - similar to lists although duplicates are not allowed


-- |Making our own modules
-- Geometry is a user defined module which defines a variety of utility functions for working with geometric shapes
-- To import this module, we can do: import Geometry

module Geometry  
( sphereVolume  
, sphereArea  
, cubeVolume  
, cubeArea  
, cuboidArea  
, cuboidVolume  
) where  
    
sphereVolume :: Float -> Float  
sphereVolume radius = (4.0 / 3.0) * pi * (radius ^ 3)  
    
sphereArea :: Float -> Float  
sphereArea radius = 4 * pi * (radius ^ 2)  
    
cubeVolume :: Float -> Float  
cubeVolume side = cuboidVolume side side side  
    
cubeArea :: Float -> Float  
cubeArea side = cuboidArea side side side  
    
cuboidVolume :: Float -> Float -> Float -> Float  
cuboidVolume a b c = rectangleArea a b * c  
    
cuboidArea :: Float -> Float -> Float -> Float  
cuboidArea a b c = rectangleArea a b * 2 + rectangleArea a c * 2 + rectangleArea c b * 2  
    
rectangleArea :: Float -> Float -> Float  
rectangleArea a b = a * b  

-- Submodules can be created as well
-- Geometry.Sphere contains functions related to spheres
-- To import our submodule, we can do so by using: import Geometry.Sphere

module Geometry.Sphere  
( volume  
, area  
) where  
  
volume :: Float -> Float  
volume radius = (4.0 / 3.0) * pi * (radius ^ 3)  
  
area :: Float -> Float  
area radius = 4 * pi * (radius ^ 2) 