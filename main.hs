import SplitTill (splitTill)
import Test (test, _error)

main :: IO()
main = do
  let as = "abcde"
  test as 'a' (0, 4) $ splitTill as 'a'
  test as 'b' (1, 4) $ splitTill as 'b'
  test as 'c' (2, 4) $ splitTill as 'c'
  test as 'd' (3, 4) $ splitTill as 'd'
  test as 'e' (4, 4) $ splitTill as 'e'
  let a = (splitTill as 'f')
  case a of
    Nothing -> putStr ""
    Just (_, _) -> _error as ' ' (0, 0) a
