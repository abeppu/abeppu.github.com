---
layout: post
title: other uses of solr faceting
---

When I was in college, I briefly experimented with solr. As an intern, I hacked together the initial round of search features for [twistage](http://twistage.com), which meant setting up a solr instance, feeding it data, and constructing queries from the frontend.  Now, at [Etsy](http://www.etsy.com) I get to work with solr again, and hopefully this time I'll learn more about its internals.  For the moment, however, I want to explore a couple tricks about how solr can be *used*.

*    Using timestamped queries and facet ranges, you can use your solr instance to construct time series data
*    

TODO : assemble an example dataset.  Want timestamps so I can do time series graphs, want some other real bin (like price?) so I can do a not time related bucketing, ideally would like to do geohash range bucketing -- and map onto google maps.

For instance, use the EPA dataset.  