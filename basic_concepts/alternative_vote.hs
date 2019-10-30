import Data.Char
import Data.List

ballots :: [[String]]
ballots = [["red", "green"],
    ["blue"],
    [],
    ["green", "red", "blue"],
    ["blue", "green", "red"],
    ["green"]]
count_votes :: Eq a => a -> [a] -> Int
count_votes x = length . filter (==x) 

rmdups :: Eq a => [a] -> [a]
rmdups [] = []
rmdups (x:xs) = x : filter (/=x) (rmdups xs) 

result :: Eq b => [b] -> [(Int, b)]
result vs = sortOn fst [(count_votes v vs, v) | v <- rmdups vs]

rmempty :: Eq a => [[a]] -> [[a]]
rmempty = filter (/= [])

elim :: Eq a => a -> [[a]] -> [[a]]
elim x = map (filter (/= x))

rank :: Ord a => [[a]] -> [a]
rank = map snd . result . map head

winner :: Ord a => [[a]] -> a
winner bs = case rank (rmempty bs) of
            [c]     -> c
            (c:cs)  -> winner (elim c bs)
            