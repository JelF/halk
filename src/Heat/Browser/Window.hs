module Heat.Browser.Window (
  document
, sleep
) where

import Data.Maybe (fromJust)

import Heat.Browser.Document
import Heat.JSVal

foreign import javascript
  unsafe "window.document"
  documentJS :: JSVal

foreign import javascript
  interruptible "window.setTimeout($c, $1);"
  sleep :: Int -> IO ()

document :: Document
document = fromJust $ fromJSVal $ documentJS
