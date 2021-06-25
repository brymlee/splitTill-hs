module SplitTill where

splitTill :: String -> Char -> Maybe (Int, Int)
splitTill _s c = splitTillr s l c $ Just (i, i)
  where 
    l = length s
    i = (+) (-1) l
    s = reverse _s 

splitTillr :: String -> Int -> Char -> (Maybe (Int, Int)) -> Maybe (Int, Int)
splitTillr [] _ _ _ = Nothing
splitTillr [x] l c (Just (a, b)) = result
  where
    aValid = a >= 0 && a < l
    bValid = b >= 0 && b < l
    xIsC = x == c
    f = \ (i, j, k) -> 
      case i of 
        True -> 
          case j of 
            True -> 
              case k of
                True -> True
                False -> False
            False -> False
        False -> False
    is = f (aValid, bValid, xIsC)
    result = 
      case is of 
        True -> Just (a, b)
        False -> splitTillr [] l c Nothing
splitTillr (x:xs) l c (Just (a, b)) = result 
  where
    is = x == c
    _a = (+) (-1) a
    result = 
      case is of
        True -> splitTillr [x] l c $ Just (a, b) 
        False -> splitTillr xs l c $ Just (_a, b)
