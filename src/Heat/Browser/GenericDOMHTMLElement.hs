module Heat.Browser.GenericDOMHTMLElement (
  GenericDOMHTMLElement
) where

import Control.Monad (guard)

import Heat.Browser.DOMNode
import Heat.Browser.DOMElement
import Heat.Browser.DOMHTMLElement
import Heat.Browser.Window
import Heat.JSVal

foreign import javascript
  safe "$1 instanceof HTMLElement"
  isDOMElement :: JSVal -> Bool

newtype GenericDOMHTMLElement = GenericDOMHTMLElement JSVal

instance ToJSVal GenericDOMHTMLElement where
  toJSVal (GenericDOMHTMLElement x) = x

instance FromJSVal GenericDOMHTMLElement where
  fromJSVal x = guard (isDOMElement x) >> (Just . GenericDOMHTMLElement) x

instance DOMNode GenericDOMHTMLElement
instance DOMElement GenericDOMHTMLElement
instance DOMHTMLElement GenericDOMHTMLElement
