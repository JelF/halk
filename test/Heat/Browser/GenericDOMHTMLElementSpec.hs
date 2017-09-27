module Heat.Browser.GenericDOMHTMLElementSpec (spec, main) where

import Test.Hspec

import Heat.Browser

main :: IO ()
main = hspec spec

spec :: Spec
spec = describe "querySelector" $
  it "finds matching nodes" $ do
    setHTML (body document) $
      "<div class='foo'></div><div class='foo'></div><div class='bar'></div>"

    results <- querySelector document ".foo" :: IO [GenericDOMHTMLElement]
    length results `shouldBe` 2
