module TorresDeHanoi where

-- Definimos un alias para representar el número de discos
type NumeroDiscos = Int
-- Definimos un alias para representar una vara (torre)
type Vara = String
-- Definimos un alias para representar un movimiento de una vara a otra
type Movimiento = (Vara, Vara)

{-|
    La función 'hanoi' resuelve el problema de las Torres de Hanoi.
    Dado el número de discos 'n' y las tres varas 'origen', 'destino', 'temporal',
    devuelve una lista de movimientos que representan la solución al problema.
-}
hanoi :: NumeroDiscos -> Vara -> Vara -> Vara -> [Movimiento]
hanoi 0 _ _ _ = [] -- Caso base: no hay discos para mover
hanoi n origen destino temporal =
    -- Movemos (n-1) discos de la vara origen a la vara temporal, usando la vara destino como temporal
    hanoi (n - 1) origen temporal destino ++
    -- Movemos el disco restante de la vara origen a la vara destino
    [(origen, destino)] ++
    -- Movemos (n-1) discos de la vara temporal a la vara destino, usando la vara origen como temporal
    hanoi (n - 1) temporal destino origen

{-|
    La función 'imprimirMovimiento' toma un movimiento (desde, hacia) y devuelve una cadena
    que describe el movimiento.
-}
imprimirMovimiento :: Movimiento -> String
imprimirMovimiento (desde, hacia) = "Mover desde " ++ desde ++ " hacia " ++ hacia

{-|
    La función 'imprimirMovimientos' toma una lista de movimientos y devuelve una cadena
    que describe cada movimiento , separados por saltos de línea.
-}
imprimirMovimientos :: [Movimiento] -> String
imprimirMovimientos [] = "" -- Caso base: no hay movimientos para imprimir
imprimirMovimientos (x:xs) = imprimirMovimiento x ++ "\n" ++ imprimirMovimientos xs
