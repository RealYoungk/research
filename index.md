---
layout: default
title: 홈
---

<div class="home-hero">
  <h1>기업 분석 노트</h1>
  <p>기업들의 비즈니스 모델, 재무제표, 산업 동향을 분석합니다.</p>
</div>

<h2>시장별 분류</h2>
<div class="market-grid">
  <a href="{{ '/kospi/' | relative_url }}" class="market-card">
    <span class="market-flag">🇰🇷</span>
    <span class="market-name">KOSPI</span>
    <span class="market-desc">코스피</span>
  </a>
  <a href="{{ '/kosdaq/' | relative_url }}" class="market-card">
    <span class="market-flag">🇰🇷</span>
    <span class="market-name">KOSDAQ</span>
    <span class="market-desc">코스닥</span>
  </a>
  <a href="{{ '/nasdaq/' | relative_url }}" class="market-card">
    <span class="market-flag">🇺🇸</span>
    <span class="market-name">NASDAQ</span>
    <span class="market-desc">나스닥</span>
  </a>
  <a href="{{ '/nyse/' | relative_url }}" class="market-card">
    <span class="market-flag">🇺🇸</span>
    <span class="market-name">NYSE</span>
    <span class="market-desc">뉴욕증권거래소</span>
  </a>
  <a href="{{ '/hkex/' | relative_url }}" class="market-card">
    <span class="market-flag">🇭🇰</span>
    <span class="market-name">HKEX</span>
    <span class="market-desc">홍콩거래소</span>
  </a>
  <a href="{{ '/general/' | relative_url }}" class="market-card">
    <span class="market-flag">📊</span>
    <span class="market-name">일반 분석</span>
    <span class="market-desc">산업 분석</span>
  </a>
</div>

<h2>최신 분석</h2>
{% if site.posts.size > 0 %}
<ul class="post-list">
  {% for post in site.posts limit:10 %}
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
