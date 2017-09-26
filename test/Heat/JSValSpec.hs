module Heat.JSValSpec (spec, main) where

import Test.Hspec

import Heat.JSVal

foreign import javascript
  safe "$1 === eval($2) || console.warn('%s != ', $2, $1) && false"
  foreignShouldBe :: JSVal -> JSVal -> Bool

shouldBeJS :: JSVal -> String -> Bool
shouldBeJS value = foreignShouldBe value . toJSVal

main :: IO ()
main = hspec spec

spec :: Spec
spec = describe "fromJSVal / toJSVal" $ do
  it "encodes [String]" $ do
    toJSVal ["foo", "bar", "baz"] `shouldBeJS` "['foo', 'bar', 'baz']"
