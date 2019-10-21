double = (*) 2

luhnDouble x | x > 4        = double x - 9
             | otherwise    = double x

luhn x y z v =  (luhnDouble x + y + luhnDouble z + v) `mod` 10 == 0