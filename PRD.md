# PRD: 기업분석 블로그

## 개요

Jaspr + jaspr_content로 기업분석 블로그를 구축한다.
Flutter 공식 문서 사이트(flutter.dev)와 동일한 기술 스택을 채택한다.

## 기술 스택

| 항목 | 기술 |
|------|------|
| 프레임워크 | Jaspr (Dart) |
| 콘텐츠 | jaspr_content (Markdown + Frontmatter + 파일 기반 라우팅) |
| 템플릿 | Mustache |
| 빌드 | Jaspr SSG (정적 사이트 생성) |
| 배포 | GitHub Pages 또는 Firebase Hosting |

## 콘텐츠 작성 방식

- Markdown 파일 + YAML Frontmatter
- 파일 기반 라우팅 (디렉토리 구조 = URL)
- Mustache 템플릿으로 동적 데이터 삽입
- 한국어 전용 (전문용어는 영어 그대로 사용)

### Frontmatter 스펙

```yaml
---
title: "큐라클"
description: "큐라클 기업 분석"
date: 2026-01-28
sector: biotech
market: kosdaq
tags: [성장주, AI]
tickers: [365270]
---
```

| 필드 | 타입 | 필수 | 설명 |
|------|------|------|------|
| title | string | O | 기업명 |
| description | string | | 요약 설명 |
| date | date | O | 작성일 |
| sector | string | O | 섹터 (1차 분류) |
| market | string | O | 시장 (kospi, kosdaq, nasdaq, nyse, hkex) |
| tags | list | | 테마 태그 (성장주, 배당주, AI 등) |
| tickers | list | | 종목코드 |

### 섹터 값

| sector 값 | 설명 |
|-----------|------|
| semiconductor | 반도체 (파운드리, 팹리스, 장비, 소재) |
| it | IT/소프트웨어 (SaaS, 플랫폼, 클라우드, AI) |
| finance | 금융 (은행, 보험, 증권, 핀테크) |
| biotech | 바이오/제약 (의료기기, 헬스케어 포함) |
| consumer | 소비재 (식품, 유통, 의류, 화장품) |
| energy | 에너지 (석유, 가스, 신재생, 원자력) |
| industrials | 산업재 (건설, 기계, 방산, 조선) |
| telecom | 통신/미디어 (엔터테인먼트 포함) |
| realestate | 부동산 (리츠, 개발, 인프라) |
| materials | 소재 (화학, 철강, 2차전지 소재) |
| auto | 자동차 (완성차, 부품, 전기차, 자율주행) |

## 디렉토리 구조

```
content/
├── _data/
│   └── site.yaml
├── index.md
├── about.md
└── posts/
    ├── 2026-01-28-큐라클.md
    └── ...
```

### site.yaml

```yaml
name: 기업 분석 노트
author: 영진
description: 기업들의 비즈니스 모델과 재무 분석
lang: ko
```

## 페이지 구성

### 홈 (`/`)
- 전체 포스트 목록 (최신순 정렬)
- 섹터별 필터링 (탭 또는 태그 클릭)
- 각 항목: 기업명, 섹터, 시장, 날짜 표시

### 포스트 상세 (`/posts/{slug}/`)
- Frontmatter 메타 정보 표시 (섹터, 시장, 태그, 종목코드)
- Markdown 본문 렌더링
- 목차 (TOC) 자동 생성

### 소개 (`/about/`)
- 블로그 소개
- 면책조항 (투자 조언 아님)
- 연락처

## UI 요구사항

- jaspr_content BlogLayout 기반
- 다크모드 / 라이트모드 지원
- 반응형 레이아웃 (모바일 대응)
- 테이블, 코드블록, 목차 스타일링

## 범위 외

- 댓글
- 검색
- CMS / 관리자
- 사용자 인증
- Analytics

## 마일스톤

1. Jaspr 프로젝트 초기화 + jaspr_content 설정
2. ContentApp 구성 + 디렉토리 구조 셋업
3. 샘플 포스트 작성 (큐라클 분석글 이관)
4. 홈 페이지 (포스트 목록 + 섹터 필터링)
5. 포스트 상세 페이지 (목차 포함)
6. 스타일링 + 다크모드
7. 빌드 + 배포 설정
