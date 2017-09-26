module Heat.JSVal.JSChar () where

import GHCJS.Types (JSVal)
import Data.JSString (JSString, pack, unpack)

import Heat.JSVal.FromJSVal
import Heat.JSVal.ToJSVal

foreign import javascript
  unsafe "((typeof $1 == 'string') || $1 instanceof String) && ($1.length == 1)"
  isJSChar :: JSVal -> Bool

foreign import javascript
  unsafe "$r = $1"
  jsValToJSString :: JSVal -> JSString

foreign import javascript
  unsafe "$r = new String($1); $r.isChar = true"
  jsStringToJSVal :: JSString -> JSVal

instance FromJSVal Char where
  fromJSVal x = if isJSChar x then (Just . head . unpack . jsValToJSString) x else Nothing

instance ToJSVal Char where
  toJSVal = jsStringToJSVal . pack . return
