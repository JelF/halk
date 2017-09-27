module Heat.Browser.Document (
  Document
, body
) where

import Control.Monad (guard)
import Data.Maybe (fromJust)

import Heat.Browser.Body
import Heat.Browser.DOMNode
import Heat.JSVal

foreign import javascript
  unsafe "$1.constructor === HTMLDocument"
  isDocument :: JSVal -> Bool

foreign import javascript
  unsafe "$1.body"
  bodyJS :: JSVal -> JSVal

newtype Document = Document JSVal

instance ToJSVal Document where
  toJSVal (Document x) = x

instance FromJSVal Document where
  fromJSVal x = guard (isDocument x) >> (Just . Document) x

instance DOMNode Document

body :: Document -> Body
body = fromJust . fromJSVal . bodyJS . toJSVal
