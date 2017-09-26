module Heat.JSVal.JSArray () where

import Control.Monad (forM, guard)
import GHCJS.Types (JSVal)

import Heat.JSVal.FromJSVal
import Heat.JSVal.ToJSVal

foreign import javascript
  unsafe "($1 instanceof Array) || (typeof $1 == 'string')"
  isJSArray :: JSVal -> Bool

foreign import javascript
  unsafe "$1.length"
  getJSArrayLength :: JSVal -> Int

foreign import javascript
  unsafe "$1[$2]"
  getJSArrayElement :: JSVal -> Int -> JSVal

foreign import javascript
  unsafe "[]"
  buildEmptyJSArray :: JSVal

foreign import javascript
  unsafe "$1.isChar ? $1 : [$1]"
  buildSingletonJSArray :: JSVal -> JSVal

foreign import javascript
  unsafe "$2.isChar ? $1 + $2 : Array.prototype.concat($1, $2)"
  concatJsArrays :: JSVal -> JSVal -> JSVal

instance (FromJSVal t) => FromJSVal [t] where
  fromJSVal x = do
    guard $ isJSArray x
    let length = getJSArrayLength x
    forM [0..(length - 1)] $ fromJSVal . getJSArrayElement x

instance (ToJSVal t) => ToJSVal [t] where
  toJSVal = foldl (\acc -> concatJsArrays acc . buildSingletonJSArray . toJSVal) buildEmptyJSArray
