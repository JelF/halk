module Heat.Browser.DOMNode (
  DOMNode
) where

import Heat.JSVal

class (ToJSVal t, FromJSVal t) => DOMNode t
