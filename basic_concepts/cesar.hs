-- Prepare implementation of cesar cipher for upper and lower case.

import Data.Char 

let2int c = ord c - ord 'a'

int2let n = chr (ord 'a' + n)

let2int_upper c = ord c - ord 'A'

int2let_upper n = chr (ord 'A' + n)

shift n c   | isLower c = int2let ( (let2int c + n) `mod` 26 ) 
            | isUpper c = int2let_upper ( (let2int_upper c + n) `mod` 26 )
            | otherwise = c

encode n xs = [shift n x | x <- xs]

-- encode 2 "Haskell is Fun"