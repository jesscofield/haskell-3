module Main where

import Data.Char (toLower, isAlphaNum)
import qualified Data.Set as Set
import Data.List (sort)

type Symbol = Char
type WordT  = String
type TextT  = String

normalizeSpaces :: String -> String
normalizeSpaces = go False
  where
    go :: Bool -> String -> String
    go _ [] = []
    go prevSpace (c:cs)
      | c == '\t' = go prevSpace (' ':cs)
      | c == ' ' =
          if prevSpace
            then go True cs
            else ' ' : go True cs
      | otherwise = c : go False cs

isWordChar :: Symbol -> Bool
isWordChar c =
  isAlphaNum c || c == '\'' || c == '’'

extractWords :: TextT -> [WordT]
extractWords text =
  let cleaned = map (\c -> if isWordChar c then toLower c else ' ') text
  in words cleaned

uniqueWordsOfLength :: Int -> TextT -> [WordT]
uniqueWordsOfLength k text =
  let ws = extractWords text
      wsK = filter (\w -> length w == k) ws
    in sort (Set.toList (Set.fromList wsK))

main :: IO ()
main = do
  putStrLn "Enter word length k:"
  input <- getLine
  let k = read input :: Int

  text <- readFile "text.txt"
  let textNorm = normalizeSpaces text

  let result = uniqueWordsOfLength k textNorm

  putStrLn ("\n--- unique words of length " ++ show k ++ " ---")
  mapM_ putStrLn result