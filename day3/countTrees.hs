import System.IO

main = do
    allLines <- getLines
    let lineLength = length $ head allLines
    let count = countTrees allLines 0 lineLength
    putStr $ show count

countTrees :: [String] -> Int -> Int -> Int
countTrees [] _ _ = 0
countTrees lines index lineLength =
    let treeOrNoTree = countTree $ head lines !! index
    in treeOrNoTree + countTrees (tail lines) ((index + 3) `mod` lineLength) lineLength

countTree :: Char -> Int
countTree '#' = 1
countTree _ = 0

getLines = do
    handle <- openFile "input" ReadMode
    contents <- hGetContents handle
    return $ lines contents