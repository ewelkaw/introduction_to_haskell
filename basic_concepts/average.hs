-- Prepare function which calculate average value from list of integers

average ns = sum ns `div` length ns

-- ghci average.hs
-- average [1,2,3,4,5]
-- average [2,2,2,4,4,4]