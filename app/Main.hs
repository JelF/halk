module Main where

import Control.Monad (forM_)
import Data.Maybe (fromJust)

import Heat.JSVal

foreign import javascript
  unsafe "['1', '2', '3']"
  datum :: JSVal

main :: IO ()
main = do
  putStrLn "Hello, world!"
  putStrLn "This is halk app example"
  putStrLn "Halk is a simple calculator, which is used to contest heat framework basics"
  forM_ (fromJust $ fromJSVal datum :: [String]) putStrLn
