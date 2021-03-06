---
layout: post
title: machine learning is not magic!
---

##First Post : Machine learning is not magic

A lot of machine learning has to do with learning functions.  We can generally think of learning these functions as either doing regression when the output variable of the function is a numerical value, or doing categorization when the dependent variable is discrete without any real ordering.  For the case of numerical dependent variables, the tutorial/textbook/lecture presentation tend to be "we have a univariate function $f$ where for some set of data $x_1 \ldots x_n$ we know the values $f(x_1) \ldots f(x_n)$.  Now given these $x$ we get univariate function $\hat{f}$ by $\ldots$".  Then you show them the results of a bunch of reasonable approaches thrown at the problem, and they all look ok at the beginning, and pretty good by the end. 

From the perspective of merely giving people an understanding of what's going on in the algorithms, this approach is fine.  But I think it introduces a problem where people think these approaches are more powerful than they are.  The simple "works" for several reasons which may not be true of real applications :
- The function $f$ is simple (but not too simple), and often real-world processes which create data will be much more complicated
- The function $f$ is solely informed by the values in the data, but in real life you may be missing valuable data
- The dimension is small, so there's enough data to go around.  When the dimension is high for many of the points you try to make predictions about, there will be no observed datapoint nearby to help you.

My first thought was to try to provide a category of examples where many strategies will fail -- but this isn't particularly interesting (e.g. provide too few datapoints and have a function with some narrow peaks, ridges or valleys).  Instead, I thought it would be fun to work with images.  Images can be cast as functions where $x$ is just the location of a pixel and $y$ is that pixel's color.  This is fun for me because I don't have any real experience working with image data -- just getting the data into a form I could work with was new territory (I'm pretty sure I did it wrong; maybe a machine vision or image processing person will correct me someday).  It's also beneficial to the reader in that people are intuitively able to understand the impact of providing more or less data, and people can easily understand the importance of domain knowledge which is beyond the grasp of the algorithm.

Before going any further, first let me give due credit to [the java KD-tree](http://www.cs.wlu.edu/~levy/software/kd/ "java KD-tree") I used for this.

![Me at the Louvre, summer 2009](http://farm5.static.flickr.com/4015/4335461359_4390eec794_b.jpg "foo")

In the above image, going left to right, you see the results of doing plain Nearest Neighbor, K Nearest Neighbor (with $k=3$) and K Nearest Neighbor with some smoothing (In a subsequent post, I want to do a Gaussian process/regression tack, and maybe some other mixture scheme).  And of course, top to bottom represents more to less data.  In particular, in each case I walked over the whole picture and included each pixel with some probability $p$, where in the top row $p = 0.1 * 2^{-7}$ and in the bottom row $p = 0.1$, and each row in between differs from those above and below by a factor of two.  Then for all non-sampled points, we try to guess the associated value given the sampled points, and those predictions, together with the sampled data are what you see displayed.  To be fair, each image is actually treated basically as three functions, one each for red, green and blue channels, and I've just remixed them for ease of presentation.

With the image above, I want to make a few points:

### Our models are wrong.

Ok, so not necessarily always. Sometimes our data actually works according to a clean model -- maybe a robot is navigating with distance sensors that really do have normal noise, for instance. But for netflix and your credit card company and everyone trying to do inference using data that comes from people, our model is probably wrong.  

When a human looks at the pictures on the bottom row, they're bringing a life's worth of domain knowledge to the table to understand it.  It's not just a map of (x,y) pairs to (r, g, b) values; it's a kid standing in front of a statue.  But the simple nearest neighbor model, and the fancy dirichlet mixture model, or some modified Ising model that make a straight-forward effort to just learn this as a picture are poor in that they don't have a concept of this function being a 2d image of a 3d world where solid objects are seen under light, let alone concepts of sphynxes or tourists or hair or eyes.

A while ago I worked on what we called a "click model".  Of course, I can't go into details, but at the high level, if a user searches for something, and gets back a list of results and clicks on only one of them, there's a tricky inference process about how this observation informs our understanding of the relevance of each of the returned results to the given query.  But really, you're trying to write a model of user behavior, and inevitably there are a huge number of factors which affect that behavior which your system can't consider.

### Machine learning can't aspire to be magic.  

It's just common sense.  A lot of people who have an idea of what machine learning is, but who haven't actually worked on it much (and even some who have) tend to strongly over-estimate its powers.  But the bottom line is sometimes there simply isn't enough data to really learn the underlying material.  No matter how smart your algorithms or your human visual system, given the very small amount of data in the top row of images, there's no realistic way that you could really 'learn' what's going on in the rest of the picture.  

Of course, the opposite is also true.  In the event that one can get measurements (or whatever) of a significant portion of the population as the observed data, it can be possible for even simple algorithms with no representation of the complex structure underlying the data (as in the bottom row of pictures above). Don't get me wrong -- different algorithms will fare better or worse, but they can all be in the same ballpark.  Above, if we were to evaluate the error of predicted RGB values from the true values of the original picture, we would see that the smoothed KNN approach is consistently superior to the KNN approach which is consistently superior to the single nearest neighbor approach.  But looking at the bottom row of pictures, does it really matter that much?

From the above two points, it would be tempting to say that supervised machine learning, and tasks like function learning or classification only can make meaningful improvements in some Goldilocks space of problems where where have enough data, but not too much.  But of course, what this misses is that how much data you have is relative to how big your space is, which is dependent on how you decide to represent your problem.

For instance, a language model trained on a bunch of sentences can really think of itself as having data dimension is $|V|^l$ where $V$ is the vocabulary size and $l$ is the longest sentence.  However an $n$-gram language model operates by picking some $n < l$ and reconfiguring its data to be points of dimension $|V|^n$, and instead of predicting the next word given the whole previous part of the sentence, it can just predict given the last $n$ words.

_This_ is how machine learning really advances -- by reconsidering ways that problems can be represented.