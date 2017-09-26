module Heat.JSVal (
  JSVal

, module Heat.JSVal.FromJSVal
, module Heat.JSVal.ToJSVal
) where

import GHCJS.Types (JSVal)

import Heat.JSVal.FromJSVal (FromJSVal, fromJSVal)
import Heat.JSVal.ToJSVal (ToJSVal, toJSVal)
import Heat.JSVal.JSArray ()
import Heat.JSVal.JSChar ()
