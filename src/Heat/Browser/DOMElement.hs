module Heat.Browser.DOMElement (
  DOMElement
, querySelector
) where

import Data.Maybe (fromJust)

import Heat.Browser.DOMNode
import Heat.JSVal

class (DOMNode t) => DOMElement t where

foreign import javascript
  unsafe "Array.prototype.slice.call($1.querySelectorAll($2))"
  querySelectorJS :: JSVal -> JSVal -> IO JSVal

querySelector :: (DOMNode t, DOMElement nodes) => t -> String -> IO [nodes]
querySelector element selector = do
  let elementJS = toJSVal element
  let selectorJS = toJSVal selector
  queryResultJS <- querySelectorJS elementJS selectorJS
  (return . fromJust . fromJSVal) queryResultJS
