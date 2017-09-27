module Support.JSTest (
  evalJS
, shouldBeJS

, module Heat.JSVal
) where

import Heat.JSVal

foreign import javascript
  safe "eval($1)"
  foreignEval :: JSVal -> JSVal

foreign import javascript
  safe "_.isEqual($1, eval($2)) || console.warn('%s != ', $2, $1) && false"
  foreignShouldBe :: JSVal -> JSVal -> Bool

evalJS :: String -> JSVal
evalJS = foreignEval . toJSVal

shouldBeJS :: JSVal -> String -> Bool
shouldBeJS value = foreignShouldBe value . toJSVal
