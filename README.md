# haskell 3 - text processing (variant 4)

the program reads a text from a file, normalizes spaces, and finds
all **unique words of a given length**.

## task
from all sentences in the text, find and output **without repetition**
all words of a specified length.

## how it works
1. reads text from `text.txt`
2. replaces tabs and multiple spaces with a single space
3. extracts words from the text
4. converts words to lowercase
5. filters words by the given length `k`
6. removes duplicates
7. outputs the result

## how to run

```bash
ghc Main.hs
./Main