module Heat.JSVal (
  JSVal

, module Heat.JSVal.FromJSVal
, module Heat.JSVal.ToJSVal

, module Heat.JSVal.Lift

, castViaJS

, liftJS
, liftJS2
, liftJS3
) where

import GHCJS.Types (JSVal)

import Heat.JSVal.FromJSVal (FromJSVal, fromJSVal)
import Heat.JSVal.ToJSVal (ToJSVal, toJSVal)
import Heat.JSVal.JSArray ()
import Heat.JSVal.JSChar ()
import Heat.JSVal.JSInt ()

import Heat.JSVal.Lift

castViaJS :: (ToJSVal x, FromJSVal y) => x -> Maybe y
castViaJS = fromJSVal . toJSVal
