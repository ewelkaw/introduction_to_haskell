-- Define a recursive function `sumdown :: Int -> Int` that returns the sum of the non-negative integers from a given value down to zero. For example, `sumdown 3` should return the result `3+2+1+0=6`

sumdown n   | n >= 0 = n + sumdown (n-1)
            | otherwise = 0