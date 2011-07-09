---
layout: default
title: Notes
---


<p>
The following are written to aid my own learning and organization. While I hope that others might find them useful, I hold myself to no particular standards with respect to editing, originality, or correctness. </p>
    {% for page in site.pages %}
      {% if page.type == "notes" %}
[{{page.title}}]({{page.url}})
      {% endif %}
    {% endfor %}




