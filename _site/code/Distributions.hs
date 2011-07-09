-- doesn't do anything

{-

decide whether a coin is fair given some number of flips from it

flip a coin
  if 1, it's a fair coin p = 0.5
  if 0, it's a biased coin
    generate a float p, probability of heads

generate 10 flips from the coin

a ~ bernoulli(0.5)
p = 0.5 if a
p ~ U[0, 1] otherwise
x_i ~ Bernoulli p

prior should expect P(a = 1) = 0.5, P(a = 0) = 0.5

likelihood 
p(\sum x = k | a = 1) = (0.5^k)(0.5)^{n-k}
p(\sum x = k | a = 0) = \int (p^k)(1-p)^{n-k} p(p) dp = 


P(x_i = 1 | a = 1) = 0.5
P(x_i = 0 | a = 1) = 0.5
P(x_i = 1 | a = 0) = 

-}


data Binomial = Binomial Float Float

beta :: Float -> Float -> Float
beta a b = 1.0

prob :: Binomial -> Float -> Float         
prob (Binomial a b) x = x**a * (1-x)**b/(beta a b)

prior = Binomial 1.5 1.5

likelihood :: Bool -> Float -> Float
likelihood True z = z
likelihood False z = 1-z

infer :: Binomial -> Bool -> Binomial
infer (Binomial a b) True = Binomial (a+1) b
infer (Binomial a b) False = Binomial a (b+1)

generate :: (Int a) => a -> [Bool]
generate k = 

generate' (Int a, Floating z) => a -> z -> StdGen -> [Bool]
generate' 0 _ _ = []
generate' k z gen = 
  let (draw, newgen) = random gen
  in (generate' (k-1) z newgen)