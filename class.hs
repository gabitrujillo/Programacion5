inserAt :: [a] -> Int -> a -> [a]
inserAt [] _ a = [a]
inserAt xs 0 a = a : xs
inserAt (x:xs) n a 
    | n < 0 || n > length xs = error "index out of range"
    | otherwise = x : inserAt xs (n-1) a 
