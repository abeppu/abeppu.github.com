---
layout: post
title: candlestick plots in d3
---

So, for a while now I've been using [protovis](http://mbostock.github.com/protovis/) for visualizing data related to search quality (at [work](http://www.etsy.com)). Last week I was working on tweaking some plots, and had to check some documentation, and I saw the notice on the protovis main page that it's no longer under active development, and their team is now focused on [d3](http://mbostock.github.com/d3/), a library which I had only looked at but never tried before. So, I figured I'd give it a whirl and work with it a bit before trying to buy the time to port all my protovis code at work to d3. It has a similar feel to working in protovis, but protovis "marks" are supplanted by actual svg elements. Here's a candlestick chart of the AMZN stock price for the past few weeks : 

<div id="chart"></div>

Also, [here's](/blog/candlestick.html#GOOG) a larger form of it (but for Google data).

<script type="text/javascript" src="/js/candlestick.js"></script>
<script type="text/javascript" src="/js/fetchstockdata.js"></script>
<script type="text/javascript">
 var width = 500;
 var height = 300;
 $(document).ready(fetchData);
</script>

