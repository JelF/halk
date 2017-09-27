module Heat.JSVal.JSInt () where

import Control.Monad (guard)
import Data.JSString (JSString, pack, unpack)
import GHCJS.Types (JSVal)

import Heat.JSVal.FromJSVal
import Heat.JSVal.ToJSVal

foreign import javascript
  unsafe "(typeof $1 == 'number') && ($1 < $2) && (Math.ceil($1) === $1)"
  isInt :: JSVal -> Int -> Bool

foreign import javascript
  unsafe "$r = $1;"
  jsValToInt :: JSVal -> Int

foreign import javascript
  unsafe "$r = $1;"
  intToJSVal :: Int -> JSVal

instance FromJSVal Int where
  fromJSVal x = guard (isInt x maxBound) >> (Just . jsValToInt) x

instance ToJSVal Int where
  toJSVal = intToJSVal
