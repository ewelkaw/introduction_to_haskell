halve x  = if length x `mod` 2 == 0
    then (take (length x `div` 2) x, drop (length x `div` 2) x)
    else (x, [])