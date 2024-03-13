module LogTest where

import Log  
import LogMessage 

-----------AUN TENGO DUDADAS DE LOS TEST NO ENTIENDO BIEN ES UNA IDEA-------

runTests :: IO ()
runTests = do
    testParseMessage
    testInsert
    testBuild
    testInOrder
    --testWhatWentWrongg

testParseMessage :: IO ()
testParseMessage = do
    let parsedInfoMessage = parseMessage "I 3 Search loarding processing"
    let expectedInfoMessage = LogMessage Info 3 "Search loarding processing"
    assertEqual "Info message" expectedInfoMessage parsedInfoMessage
    
    let parsedWarningMessage = parseMessage "W 1 long passage and the White Rabbit"
    let expectedWarningMessage = LogMessage Warning 1 "long passage and the White Rabbit"
    assertEqual "Warning message" expectedWarningMessage parsedWarningMessage
    
    let parsedErrorMessage = parseMessage "E 85 5 The next witness was the Duchess's cook"
    let expectedErrorMessage = LogMessage (Error 85) 5 "The next witness was the Duchess's cook"
    assertEqual "Error message" expectedErrorMessage parsedErrorMessage
    
    let unknownMessage = parseMessage "Not a log message"
    let expectedUnknownMessage = Unknown "Not a log message"
    assertEqual "Unknown message" expectedUnknownMessage unknownMessage

testInsert :: IO ()
testInsert = do
    let tree = Node Leaf (LogMessage Info 2 "Test") Leaf
    
    let treeAfterInsertion = insert (LogMessage Info 1 "Test") Leaf
    let expectedTreeAfterInsertion = Node Leaf (LogMessage Info 1 "Test") Leaf
    assertEqual "Insert into empty tree" expectedTreeAfterInsertion treeAfterInsertion
    
    let treeAfterInsertion' = insert (LogMessage Info 1 "Test") tree
    let expectedTreeAfterInsertion' = Node (Node Leaf (LogMessage Info 1 "Test") Leaf) (LogMessage Info 2 "Test") Leaf
    assertEqual "Insert into non-empty tree" expectedTreeAfterInsertion' treeAfterInsertion'

testBuild :: IO ()
testBuild = do
    let messages = [LogMessage Info 1 "Test", LogMessage Info 2 "Test"]
    
    let tree = build messages
    let expectedTree = Node (Node Leaf (LogMessage Info 1 "Test") Leaf) (LogMessage Info 2 "Test") Leaf
    assertEqual "Build tree" expectedTree tree

testInOrder :: IO ()
testInOrder = do
    let tree = Node (Node Leaf (LogMessage Info 1 "Test") Leaf) (LogMessage Info 2 "Test") Leaf
    let expectedMessages = [LogMessage Info 1 "Test", LogMessage Info 2 "Test"]
    
    let orderedMessages = inOrder tree
    assertEqual "In order traversal" expectedMessages orderedMessages

testWhatWentWrongg :: IO ()
testWhatWentWrongg = do
    let messages = [LogMessage (Error 70) 3 "Way too many pickles", LogMessage Info 1 "Test", LogMessage (Error 30) 2 "Not severe"]
    let expectedErrors = ["Way too many pickles"]
    
    let severeErrors = testWhatWentWrongg messages 
    assertEqual "Extract severe errors" expectedErrors severeErrors
