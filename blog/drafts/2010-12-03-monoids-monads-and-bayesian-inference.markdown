---
layout: post
title: Monoids, monads, and Bayesian inference
type: blog
---

For a while now, I've been trying to learn a bit about abstract algebra and the functional languages which use algebraic structures as patterns, in the hopes of understanding how this stuff could be useful to machine learning. I don't really yet follow a lot of what goes on with so-called ["algebraic statistics"](http://en.wikipedia.org/wiki/Algebraic_statistics) and ["information geometry"](http://en.wikipedia.org/wiki/Information_geometry), but I haven't yet found what I'm looking for. 

But today I realized that the most basic, high level way that we can cast some machine learning areas into algebraic terms hadn't shown up in my reading, so I've decided to flesh it out here.

I think this is the kind of obvious thing where anyone familiar with the rudiments of both Bayesian stats and the relevant algebra/FP structures would view this as obvious, but it took me a while to realize, so I figured I may as well record it and flesh out the details.

## Towards a belief monoid

A few refresher points :

* From an algebraic perspective, a [monoid](http://en.wikipedia.org/wiki/Monoid#Definition) is like a group without inverses; it's a set combined with an associative binary operation, where the set is closed under the operation, and there's an identity element.
* Analogously, in languages like Haskell and Scala, [monoids]() are foldable structures. The identity element is often a default or empty value, and the binary operation is how pieces are folded into an aggregating value. An example is a the set of lists, which is closed under concatenation (which is associative), with the identity element being the empty list.
* In Bayesian inference, we start out with a prior distribution $p(H)$ which represents beliefs in the absence of any evidence. Given some observed set of data $d_1$ we can form the posterior distribution $p(H\vert d_1) \propto p(H)p(d_1\vert H)$.
* We can use $p(H\vert d_1)$ as a prior when we receive a new dataset $d_2$, to get a new posterior $p(H\vert d_1, d_2) \propto p(H)p(d_1\vert H)p(d_2\vert H)$.
* In general we can chain these together eventually arriving at $p(H\vert d_1 \ldots d_k) \propto p(H) \prod_{i=1}^k p(d_i\vert H)$

Synthesizing the above points, the conclusion is that we can form a monoid from the likelihood components of our eventual posterior distribution. At any point, we can weight this combined likelihood distribution according to a prior, and get a posterior. Unfortunately, we can't easily combine two posteriors informed by different data, because we would be weighting by the prior twice : $p(H \vert d_1)p(H\vert d_2) \propto p(H)p(H)p(H\vert d_1)p(H\vert d_2)$

TODO : Develop this as code

## Conjugate priors

The monoid structure defined above is true of distributions in their abstract sense, but a distribution isn't something we can instantiate. It's not obvious what the data structure is for an arbitrary distribution. So what does this look for some concrete distributions we might actually care about?

Trivially, if our hypothesis space is not only discrete, but has some small cardinality, then we can represent our distributions easily, as lists of probabilities when there's some obvious enumeration of the hypotheses, or as a map when no such obvious ordering exists. Basically, this is a histogram, and as we receive evidence, we just update the weights of the bars (and rescale so they sum to 1).

But frequently, we want our beliefs to have some manageable form, no matter what data we see.

    class Distribution d h where
        probability :: d -> h -> RealFloat
    
    data Binomial = Binomial Float Float

    instance Distribution Binomial where
        prob (Binomial a b) x = x**a * (1 - x)**b

TODO : replace leftarrows with 'drawn from' symbols

For example, perhaps the most basic case looks like this :

$Z \sim \text{Beta}(\alpha, \beta)$  
$X_i \sim \text{Bernoulli}(z)$ with $0 \leq i \leq k$

Here $\alpha$ and $\beta$ are hyperparameters, $z$ is the latent variable we care about, and our observed $k$ datapoints are just binary variables. The cool thing is that 

$$P(Z = z) \propto z^{\alpha} * (1-z)^{\beta}
P(Z = z | X_i = \text{True}) \propto z^{\alpha + 1} * (1 - z)^{\beta}  
P(Z = z | X_i = \text{False}) \propto z^{\alpha} * (1 - z)^{\beta + 1}$$

How can we encapsulate these relationships in code?


Distribution 

## Update operations are monadic


instance Monad Distribution where
    return x =     

class Likelihood f where
    likelihood :: h -> d -> RealFloat

