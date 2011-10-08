---
layout: default
title: Resume
---

# Aaron Beppu

## Education
* **2005-2008** University of California Berkeley  
BA in Cognitive Science, concentration in computational modeling  
  (Highest Honors, Departmental Citation, 3.8 GPA)

## Experience
* **January 2011 - Present** Etsy.com  
*Software Engineer in Search*
	* Designed and implemented system to improve search ranking by "learning" from repeated successes and failures. Offline clickstream analysis (Cascading+Hadoop) to discover the product features most important for a given query, coupled with online construction of "augmented" Solr queries favoring those features. Showed 20% improvement in conversion rate in A/B tests.
    * Analytics and dashboarding to compare search metrics (e.g. GMS per search, click rate, etc) between A/B test conditions. Dashboards presented graphs in-browser using protovis/js. Metrics computed offline using Cascading/Hadoop.
    * Discovery of domain-specific stemming problems. Hadoop analysis of clickstream data to discover words which stem to the same form (e.g. "card", "carded") which have important semantic distinctions in our marketplace (as "carded" refers to wool). Implemented new stemmer which keeps these words distinct.
    * Autosuggestion of place names in a manner sensitive to population and user's location.
* **July 2008 - December 2010** A9.com (a wholly-owned subsidiary of Amazon)  
*Software Development Engineer in Search Analytics*  
  * Agglomerative clustering to find sets of similar queries and products based on user behavior data  
  * Generative models of user click behavior (and approximate Bayesian inference) to compensate for 'position-bias' in ordered search results 
  * Distributed system for orchestrating complex analytics work-flows  
  * Large scale ongoing analytics of search related user behavior using Hadoop  
  * Methods and tools to evaluate quality of spelling suggestions via Mechanical Turk  
  * Metrics to gauge proportion of Amazon's traffic, clicks, product views, purchases, and purchase dollar attributable to search  
  * Finding, summarizing and reporting sequences of user actions which strongly suggest that the user is having a poor search experience

* **Summer 2007** Twistage  
*Intern*  
  * Framework for browser-based testingof web-apps (based on Selenium), which was subsequently adopted for use before all deploys  
  * Search features (indexing, querying, snippets and highlighting) for a large repository of video content, based on Solr/Lucene

## Other
* Beppu, A., Griffiths, T. L. (2009). Iterated learning and the cultural ratchet. _Proceedings of the 31st Annual Conference of the Cognitive Science Society_.
* The above describes cases when a sequence of communicating Bayesian agents will have the same asymptotic consistency as a single learner, and when they will not. The predictions of our model are validated using a lab-based learning experiment with human participants.
* Presenting "Datamining for Product Search Ranking" at Hadoop World 2011.

