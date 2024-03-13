isDigit :: Char -> Bool
isDigit c = c >= '0' && c <= '9'

isOperand :: Char -> Bool
isOperand c | c == '+' = True
            | c == '*' = True
            | c == '^' = True
            
priority :: Char -> Int  
priority c |c == '+' = 7
           | c == '*' = 6
           | c == '-' = 6
           | c == '^' = 8
 
tupleFromExpression :: String -> [(String, Char)]
tupleFromExpression "" = []
tupleFromExpression xs = (takeWhile isDigit xs, head(dropWhile isDigit xs)) : tupleFromExpression (tail (dropWhile isDigit xs))
-- una función que utilice estas tuplas para evaluar la expresión matemática
