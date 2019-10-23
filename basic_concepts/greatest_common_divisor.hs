-- factors n = [x | x <- [1..n], n `mod` x == 0]
-- count x xs = length [x' | x' <- xs, x == x'] 
-- same n = [x | x <- n, count x n == 2]

-- qsort []     = []
-- qsort (x:xs) = qsort smaller ++ [x] ++ qsort larger
--                where
--                 smaller = [a | a <- xs, a <= x]
--                 larger = [b | b <- xs, b > x]

-- maximal xs = head (reverse (qsort xs)) 

-- euclid n m  | n > 0 && m > 0 && n == m   = n
--             | n <= 0 || m <= 0           = 0
--             | n > 0 && m > 0             = maximal (same (factors n ++ factors m))
           

euclid n m  | n == m    = n
            | n > m     = euclid (n-m) m
            | otherwise = euclid n (m-n)