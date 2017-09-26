module Heat.JSVal.ToJSVal (
  ToJSVal
, toJSVal
) where

import GHCJS.Types (JSVal)

class ToJSVal t where
  toJSVal :: t -> JSVal
