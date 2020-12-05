import System.IO

main = do
    allNumbers <- getNumbers
    let summands = [x | x <- allNumbers, 2020 - x `elem` allNumbers]
    putStr $ show $ product summands

getNumbers = do
    handle <- openFile "input" ReadMode
    contents <- hGetContents handle
    let allNumbers = map read $ lines contents :: [Int]
    return allNumbers