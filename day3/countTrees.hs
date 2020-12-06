import System.IO

main = do
    allLines <- getLines
    let lineLength = length $ head allLines
    let counts = map (uncurry $ countTrees allLines 0 lineLength) [(1, 1), (3,1), (5, 1), (7, 1), (1, 2)]
    putStr $ "Number of trees encountered per slope: " ++ show counts
    putStr $ "Multiplying all of those gives: " ++ show (product counts)

countTrees :: [String] -> Int -> Int -> Int -> Int -> Int
countTrees [] _ _ _ _ = 0
countTrees lines index lineLength deltaX deltaY =
    let treeOrNoTree = countTree $ head lines !! index
    in treeOrNoTree + countTrees (drop deltaY lines) ((index + deltaX) `mod` lineLength) lineLength deltaX deltaY

countTree :: Char -> Int
countTree '#' = 1
countTree _ = 0

getLines = do
    handle <- openFile "input" ReadMode
    contents <- hGetContents handle
    return $ lines contents