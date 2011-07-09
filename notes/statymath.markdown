---
layout: default
title: scribbles on math and statistics
type: notes
---

Table of Contents:

* This will become a table of contents (this text will be scraped).
{:toc}

# Information geometry
  
The basic idea is:  
  
*	Fisher information is a Riemannian metric; it's a real distance, unlike KL divergence  
*	Using this fact, we can use tools from differential geometry on families of probability distributions  
*	One consequence of this is that we can reach conclusions which are invariant under coordinate transforms; we get 'coordinate free statistics'  

Definitions : 

Given a random variable $$X$$ which carries information about an unknown parameter $$\theta$$, 

*	let $$f(X;\theta)$$ be the *likelihood*; that is, the probability of $$X$$ conditional on $$\theta$$  
*	then the *score* $$V$$ is the partial derivative of the log likelihood with respect to $$\theta$$  
$$
V = \frac{\partial}{\partial \theta} \ln f(X;\theta) = \frac{1}{f(X; \theta)} \frac{\partial f(X; \theta)}{\partial \theta}
$$  
*	*Fisher Information* is the second moment of the score
$$
I(\theta) = E\left[\left(\frac{\partial}{\partial\theta} \ln f(X;\theta)\right)^2 \bigg\vert \; \theta \right]
$$
This is also the variance of the score, since the expectation of the score is zero. If regularity conditions are met, then it may also be written as the second derivative of the score
$$
I(\theta) = -E\left[\frac{\partial^2}{\partial^2\theta} \ln f(X; \theta) \bigg\vert \; \theta \right]
$$

In this way, Fisher information can be thought of as the curvature of the support curve near the maximum likelihood estimate.

... it looks like I need more general concepts.

# Statistics

# Questions
*	Does FI have units?  When we talk about entropy or relative entropy, we can give units as bits/nats/hartleys. Can FI be put into coding theory terms?
*	Does information geometry have immediate uses in machine learning
**	People go to a lot of work to norm their data -- Gelman talks about centering and standardizing variance. Can 'coordinate-free' stats remove the need
**	What constitutes a coordinate transformation which doesn't break this? Certainly translations and scalings should count, but do things like log/logistic/trigonometric transformations? Can any reversible change of variable be tolerated? (Surely not!) Any diffeomorphism?