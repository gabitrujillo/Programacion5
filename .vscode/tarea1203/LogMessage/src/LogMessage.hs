module LogMessage where

import Log    

-- Exercise 1
parseMessage :: String -> LogMessage
parseMessage str = parseMessage' $ words str
  where
    parseMessage' :: [String] -> LogMessage
    parseMessage' ("I":timestamp:msg) = LogMessage Info (read timestamp) (unwords msg)
    parseMessage' ("W":timestamp:msg) = LogMessage Warning (read timestamp) (unwords msg)
    parseMessage' ("E":severity:timestamp:msg) = LogMessage (Error (read severity)) (read timestamp) (unwords msg)
    parseMessage' _ = Unknown str
    
parse :: String -> [LogMessage]
parse = map parseMessage . lines

-- Exercise 2
insert :: LogMessage -> MessageTree -> MessageTree
insert (Unknown _ ) tree = tree 
insert logMesg Leaf = Node Leaf logMesg Leaf

insert logMesg (Node left lgMsg right)
    | getTime logMesg <= getTime lgMsg = Node (insert logMesg left) lgMsg right
    | otherwise = Node left logMesg (insert logMesg right)

getTime :: LogMessage -> TimeStamp
getTime (LogMessage _ time _ ) = time
getTime (Unknown _ ) = 0


-- Exercise 3
build :: [LogMessage] -> MessageTree
build = foldr insert Leaf

-- Exercise 4
inOrder :: MessageTree -> [LogMessage]
inOrder Leaf = []
inOrder (Node left logMesg right) = inOrder left ++ [logMesg] ++ inOrder right


-- Exercise 5
whatWentWrong :: [LogMessage] -> [String]
whatWentWrong = map extractMessage . inOrder . build . filter isRelevantError . filter isSevereError
    where 
        isRelevantError (LogMessage (Error severity) _ _) = severity >= 50
        isRelevantError _ = False
        isSevereError (LogMessage (Error severity) _ _) = severity >= 50
        isSevereError _ = False
        extractMessage (LogMessage _ _ msg) = msg
        extractMessage _ = ""