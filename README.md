# 기업 분석 블로그

기업 분석 공부 내용을 기록하는 Jekyll 블로그입니다.

## 📝 새 분석 글 작성하기

```bash
# 템플릿을 복사하여 _posts 폴더에 작성
cp _drafts/TEMPLATE.md _posts/2026-01-28-삼성전자.md
cp _drafts/TEMPLATE.md _posts/2026-01-28-apple.md
```

파일명은 날짜와 회사명 형식 사용: `YYYY-MM-DD-회사명.md`

예시: `_posts/2026-01-28-삼성전자.md`, `_posts/2026-01-28-apple.md`

---

## 📁 폴더 구조

```
research/
├── _config.yml          # 사이트 설정
├── _posts/              # 모든 분석 글
├── _drafts/             # 초안 (템플릿 포함)
│   └── TEMPLATE.md
├── kospi.md             # 코스피 분류 페이지
├── kosdaq.md            # 코스닥 분류 페이지
├── nasdaq.md            # 나스닥 분류 페이지
├── nyse.md              # NYSE 분류 페이지
├── hkex.md              # HKEX 분류 페이지
├── general.md           # 일반 분석 페이지
├── about.md             # 소개 페이지
├── index.md             # 홈페이지
└── .github/workflows/   # 자동 배포 설정
```

---

## 🔄 작업 흐름

```bash
# 새 글 발행
git add _posts/2026-01-28-삼성전자.md
git commit -m "Add: 삼성전자 분석"
git push
```

---

## 🏷️ 태그 가이드

### 시장 분류 (categories 필드)

front matter의 `categories` 필드로 시장 분류를 지정합니다.

| categories 값 | 시장 |
|--------------|------|
| `kospi` | 한국 코스피 |
| `kosdaq` | 한국 코스닥 |
| `nasdaq` | 미국 나스닥 |
| `nyse` | 미국 뉴욕증권거래소 |
| `hkex` | 홍콩증권거래소 |
| `general` | 산업 분석, 매크로, 일반 글 |

### 섹터 태그 (1차 태그 — 산업 분류)

글의 `tags` 배열 첫 번째에 사용. 기업이 속한 산업.

| 태그 | 포함 범위 |
|------|----------|
| `반도체` / `semiconductor` | 파운드리, 팹리스, 장비, 소재 |
| `IT` / `software` | SaaS, 플랫폼, 클라우드, AI |
| `금융` / `finance` | 은행, 보험, 증권, 핀테크 |
| `바이오` / `biotech` | 제약, 의료기기, 헬스케어 |
| `소비재` / `consumer` | 식품, 유통, 의류, 화장품 |
| `에너지` / `energy` | 석유, 가스, 신재생, 원자력 |
| `산업재` / `industrials` | 건설, 기계, 방산, 조선 |
| `통신` / `telecom` | 통신사, 미디어, 엔터테인먼트 |
| `부동산` / `realestate` | 리츠, 개발, 인프라 |
| `소재` / `materials` | 화학, 철강, 2차전지 소재 |
| `자동차` / `auto` | 완성차, 부품, 전기차, 자율주행 |

### 테마 태그 (2차 태그 — 투자 성격)

`tags` 배열 두 번째 이후에 사용. 복수 가능.

| 태그 | 의미 |
|------|------|
| `배당주` / `dividend` | 높은 배당수익률, 배당 성장 |
| `성장주` / `growth` | 높은 매출/이익 성장률 |
| `가치주` / `value` | 저평가, PER/PBR 매력 |
| `턴어라운드` / `turnaround` | 적자→흑자 전환, 구조조정 |
| `IPO` | 신규 상장, 공모 |
| `ESG` | 환경/사회/지배구조 테마 |
| `AI` | AI 관련 수혜주 |
| `인프라` / `infra` | 데이터센터, 전력, 건설 |

### 태그 작성 예시

```yaml
# _posts/2026-01-28-삼성전자.md
date: 2026-01-28
categories: kospi
tags: [반도체, 성장주, AI]

# _posts/2026-01-28-apple.md
date: 2026-01-28
categories: nasdaq
tags: [software, growth, AI]

# _posts/2026-01-28-셀트리온.md
date: 2026-01-28
categories: kosdaq
tags: [바이오, 턴어라운드]

# _posts/2026-01-28-반도체-산업-분석.md
date: 2026-01-28
categories: general
tags: [반도체, AI]
```

---

## ⚠️ 주의사항

- 모든 분석은 개인 학습 목적
- 투자 조언이 아님 (면책조항 필수)
- 저작권 있는 자료 인용 시 출처 명시
