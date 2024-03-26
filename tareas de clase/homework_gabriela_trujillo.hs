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
    doubleEveryOther [x] = [x]
    doubleEveryOther (x:y:xs) | odd (length xs) = x : (y*2) : doubleEveryOther xs
                              | otherwise = x*2 : y : doubleEveryOther xs


    sumDigits :: [Int] -> Int
    sumDigits [] = 0
    sumDigits [x] = x
    sumDigits (x:xs)
        | x < 10 = x + sumDigits xs
        | x > 10 = mod x 10 + div x 10 + sumDigits xs
   

    validate :: Int -> Bool
    validate n |mod  (sumDigits( doubleEveryOther ( toDigits n)))  10 == 0 = True
               |otherwise = False