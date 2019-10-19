qsort []     = []
qsort (x:xs) = qsort smaller ++ [x] ++ qsort larger
               where
                smaller = [a | a <- xs, a <= x]
                larger = [b | b <- xs, b > x]

-- cd introduction_to_haskell/basic_concepts
-- ghci
-- :l qsort.hs