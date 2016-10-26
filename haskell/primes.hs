import Data.List
import System.Environment

-- Infinite list of all primes
primes :: [Int]
primes = sieve [2..]
    where sieve (p:ns) = p : sieve (filter ((> 0) . flip mod p) ns)

-- Outputs the n first primes
main :: IO ()
main = do (nArg:_) <- fmap (++ ["1000"]) getArgs
          let n = read nArg
          putStrLn $ intercalate " " $ map show $ take n primes

