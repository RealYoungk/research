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

<div class="recent-posts">
  <h2>최신 분석</h2>
  {% assign all_posts = "" | split: "" %}
  {% assign all_posts = all_posts | concat: site.kospi %}
  {% assign all_posts = all_posts | concat: site.kosdaq %}
  {% assign all_posts = all_posts | concat: site.nasdaq %}
  {% assign all_posts = all_posts | concat: site.nyse %}
  {% assign all_posts = all_posts | concat: site.hkex %}
  {% assign all_posts = all_posts | concat: site.general %}

  {% assign sorted_posts = all_posts | sort: "updatedAt" | reverse %}

  {% if sorted_posts.size > 0 %}
  <ul class="post-list">
    {% for post in sorted_posts limit:10 %}
    <li>
      <a href="{{ post.url | relative_url }}">
        <h3>{{ post.title }}</h3>
      </a>
      {% if post.tags.size > 0 %}
      <div class="post-tags">
        {% for tag in post.tags %}
        <span class="tag">{{ tag }}</span>
        {% endfor %}
      </div>
      {% endif %}
      {% if post.updatedAt %}
      <span class="post-date">{{ post.updatedAt }}</span>
      {% elsif post.createdAt %}
      <span class="post-date">{{ post.createdAt }}</span>
      {% endif %}
    </li>
    {% endfor %}
  </ul>
  {% else %}
  <p class="empty-notice">아직 작성된 분석이 없습니다. 첫 번째 분석을 작성해보세요!</p>
  {% endif %}
</div>
