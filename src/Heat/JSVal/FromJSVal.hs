module Heat.JSVal.FromJSVal (
  FromJSVal
, fromJSVal
) where

import GHCJS.Types (JSVal)

class FromJSVal t where
  fromJSVal :: JSVal -> Maybe t
