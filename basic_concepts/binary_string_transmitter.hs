import Data.Char

type Bit = Int

-- version1
bit2int :: [Bit] -> Int
bit2int bits = sum [w * b | (w,b) <- zip weights bits] 
                where weights = iterate (*2) 1

-- version2
-- bit2int :: [Bit] -> Int
-- bit2int = foldr (\x y -> x + (2 * y) ) 0

int2bit :: Int -> [Bit]
int2bit 0 = []
int2bit n = n `mod` 2 : int2bit (n `div` 2)