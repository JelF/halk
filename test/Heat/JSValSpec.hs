module Heat.JSValSpec (spec, main) where

import Test.Hspec

import Support.JSTest

import Heat.JSVal

main :: IO ()
main = hspec spec

spec :: Spec
spec = describe "fromJSVal / toJSVal" $ do
  it "encodes []" $
    toJSVal ([] :: [Int]) `shouldBeJS` "[]"
  it "encodes Int" $
    toJSVal (1 :: Int) `shouldBeJS` "1"
  it "encodes [String]" $
    toJSVal ["foo", "bar", "baz"] `shouldBeJS` "['foo', 'bar', 'baz']"
  it "decodes []" $
    fromJSVal (evalJS "[]") `shouldBe` (Just [] :: Maybe [Int])
  it "decodes Int" $
    fromJSVal (evalJS "1") `shouldBe` (Just 1 :: Maybe Int)
  it "decodes [String]" $
    fromJSVal (evalJS "['foo', 'bar', 'baz']") `shouldBe` Just ["foo", "bar", "baz"]
  it "fails to decode [String] as String" $
    fromJSVal (evalJS "['foo', 'bar', 'baz']") `shouldBe` (Nothing :: Maybe String)
  it "fails to decode ['foo', 123, 'bar']" $
    fromJSVal (evalJS "['foo', 123, 'bar']") `shouldBe` (Nothing :: Maybe String)
