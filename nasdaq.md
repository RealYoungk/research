---
layout: page
title: NASDAQ
permalink: /nasdaq/
---

## 미국 나스닥 상장 기업 분석

{% assign posts = site.posts | where_exp: "post", "post.categories contains 'nasdaq'" %}
{% if posts.size > 0 %}
<ul class="post-list">
{% for post in posts %}
  <li>
    <a href="{{ post.url | relative_url }}"><h3>{{ post.title }}</h3></a>
    {% if post.tags.size > 0 %}
    <div class="post-tags">{% for tag in post.tags %}<span class="tag">{{ tag }}</span> {% endfor %}</div>
    {% endif %}
    <span class="post-date">{{ post.date | date: "%Y-%m-%d" }}</span>
  </li>
{% endfor %}
</ul>
{% else %}
<p class="empty-notice">아직 작성된 분석이 없습니다.</p>
{% endif %}
