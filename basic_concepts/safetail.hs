-- Prepare safetail function, which works same way as regular tail, but in case of empty list returns safely empty list.

-- safetail x | length x > 0  = tail x
--            | otherwise     = []

safetail [] = []
safetail x = tail x