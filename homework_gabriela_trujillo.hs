module CreditCardValidato where

    toDigits :: Int -> [Int]
    toDigits n | n <= 0 = [] 
               |  n < 10 = [n] 
               | otherwise = toDigits (div n 10) ++ [mod n 10]

    toDigitsRev :: Int -> [Int]
    toDigitsRev n | n <= 0 = [] 
                  | n < 10 = [n] 
                  | otherwise = mod n 10 : toDigitsRev (div n 10)

    doubleEveryOther :: [Int] -> [Int]
    doubleEveryOther [] = []
    doubleEveryOther [n] = [n]
    doubleEveryOther (n:y:zs) | odd (length zs) = n : (y*2) : doubleEveryOther zs
                                | otherwise = n*2 : y : doubleEveryOther zs


    sumDigits :: [Int] -> Int
    sumDigits [] = 0
    sumDigits [x] = x
    sumDigits (n:xs)
        | n < 10 = n + sumDigits xs
        | otherwise = sum (toDigits n) + sumDigits xs
   
    validate :: Int -> Bool
    validate n | mod (sumDigits( doubleEveryOther ( toDigits n))) 10 == 0 = True
                | otherwise = False
   
                

