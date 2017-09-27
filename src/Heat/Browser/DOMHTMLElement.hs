module Heat.Browser.DOMHTMLElement (
  DOMHTMLElement
, setHTML
) where

import Heat.JSVal
import Heat.Browser.DOMElement

foreign import javascript
  safe "$1.innerHTML = $2"
  setHTMLJS :: JSVal -> JSVal -> IO ()

class (DOMElement t) => DOMHTMLElement t

setHTML :: (DOMHTMLElement t) => t -> String -> IO ()
setHTML = liftJS2 setHTMLJS
