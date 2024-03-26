module TicTacToe where

import Data.Array
import Data.Char (digitToInt, isDigit)
import Data.Maybe (isJust)

type Board = Array Int Char

emptyBoard :: Board
emptyBoard = listArray (1, 9) ['1'..'9']

display :: Board -> IO ()
display b = do
  putStrLn "\n\tTic Tac Toe\n"
  putStrLn "\tPlayer 1 (X) - Player 2 (O)\n\n"
  putStrLn $ unlines [
    "     |     |     ",
    "  " ++ show (b ! 1) ++ "  |  " ++ show (b ! 2) ++ "  |  " ++ show (b ! 3),
    "_____|_____|_____",
    "     |     |     ",
    "  " ++ show (b ! 4) ++ "  |  " ++ show (b ! 5) ++ "  |  " ++ show (b ! 6),
    "_____|_____|_____",
    "     |     |     ",
    "  " ++ show (b ! 7) ++ "  |  " ++ show (b ! 8) ++ "  |  " ++ show (b ! 9),
    "     |     |     "]

updateBoard :: Board -> Int -> Char -> Board
updateBoard board pos player = board // [(pos, player)]

isValidMove :: Board -> Int -> Bool
isValidMove board pos = isDigit (board ! pos)

winningCombos :: [[Int]]
winningCombos = [[1,2,3],[4,5,6],[7,8,9],
                 [1,4,7],[2,5,8],[3,6,9],
                 [1,5,9],[3,5,7]]

checkWin :: Board -> Bool
checkWin b = any isWinning winningCombos
  where
    isWinning combo = all (\i -> b ! i == b ! (head combo)) combo

checkDraw :: Board -> Bool
checkDraw = all (\i -> not $ isDigit (i))

playerSymbol :: Int -> Char
playerSymbol p = if p == 1 then 'X' else 'O'

switchPlayer :: Int -> Int
switchPlayer p = if p == 1 then 2 else 1

gameLoop :: Board -> Int -> IO ()
gameLoop board player = do
  display board
  putStrLn $ "Player " ++ show player ++ ", enter a position: "
  pos <- getLine
  let idx = digitToInt (head pos)
  if isValidMove board idx then do
    let newBoard = updateBoard board idx (playerSymbol player)
    if checkWin newBoard then do
      display newBoard
      putStrLn $ "Player " ++ show player ++ " wins!"
    else if checkDraw newBoard then do
      display newBoard
      putStrLn "It's a draw!"
    else
      gameLoop newBoard (switchPlayer player)
  else do
    putStrLn "Invalid move, try again."
    gameLoop board player

main :: IO ()
main = gameLoop emptyBoard 1
 