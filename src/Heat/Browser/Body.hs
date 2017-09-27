module Heat.Browser.Body (
  Body
) where

import Control.Monad (guard)

import Heat.Browser.DOMNode
import Heat.Browser.DOMElement
import Heat.Browser.DOMHTMLElement
import Heat.JSVal

foreign import javascript
  safe "$1.constructor === HTMLBodyElement"
  isBody :: JSVal -> Bool

newtype Body = Body JSVal

instance ToJSVal Body where
  toJSVal (Body x) = x

instance FromJSVal Body where
  fromJSVal x = guard (isBody x) >> (Just . Body) x

instance DOMNode Body
instance DOMElement Body
instance DOMHTMLElement Body
