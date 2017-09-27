module Heat.JSVal.Lift (
  liftJS
, liftJS2
, liftJS3
) where

import GHCJS.Types (JSVal)

import Heat.JSVal.ToJSVal

liftJS :: (ToJSVal x) => (JSVal -> t) -> x -> t
liftJS f = f . toJSVal

liftJS2 :: (ToJSVal x, ToJSVal y) => (JSVal -> JSVal -> t) -> x -> y -> t
liftJS2 f x y = f (toJSVal x) (toJSVal y)

liftJS3 :: (ToJSVal x, ToJSVal y, ToJSVal z) =>
           (JSVal -> JSVal -> JSVal -> t) -> x -> y -> z-> t
liftJS3 f x y z = f (toJSVal x) (toJSVal y) (toJSVal z)
