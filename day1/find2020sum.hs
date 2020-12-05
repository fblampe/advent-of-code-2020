import System.IO
import Data.List

multTwoNumbersThatSumTo2020 = do
    allNumbers <- getNumbers
    let summands = [x | x <- allNumbers, 2020 - x `elem` allNumbers]
    putStr $ show $ product summands

multThreeNumbersThatSumTo2020 = do
    allNumbers <- getNumbers
    let sumsAndProducts = nub [(x + y, x * y) | x <- allNumbers, y <- allNumbers, x /= y]

    let tripleProduct = head [x * snd pair | x <- allNumbers, pair <- sumsAndProducts, x + fst pair == 2020]
    putStr $ show tripleProduct

main = multThreeNumbersThatSumTo2020

getNumbers = do
    handle <- openFile "input" ReadMode
    contents <- hGetContents handle
    let allNumbers = map read $ lines contents :: [Int]
    return allNumbers