---
marp: true
title: "OpenClaw: 세계 최대 바이브 코딩 프로젝트에서 배우는 모범 사례"
theme: default
size: 16:9
paginate: true
style: |
  section {
    font-size: 32px;
    font-weight: bold;
    justify-content: center;
  }
  section::after {
    content: attr(data-marpit-pagination) ' / ' attr(data-marpit-pagination-total);
    font-size: 16px;
    color: #888;
  }
  section.accent::after {
    color: rgba(255,255,255,0.6);
  }
  #clock {
    position: fixed;
    top: 12px;
    right: 24px;
    font-size: 18px;
    font-weight: normal;
    color: #888;
    z-index: 9999;
    font-family: monospace;
  }
  section.accent {
    background: #0066cc;
    color: white;
  }
  section.accent h1, section.accent h2, section.accent h3 {
    color: white;
  }
  section.impact h1 {
    font-size: 64px;
    line-height: 1.3;
  }
  section.impact h2 {
    font-size: 52px;
    line-height: 1.3;
  }
  h1 {
    font-size: 52px;
  }
  h2 {
    font-size: 44px;
  }
  blockquote {
    border-left: 6px solid #0066cc;
    padding-left: 20px;
    font-size: 36px;
    color: #555;
  }
  code {
    font-size: 28px;
  }
  ul {
    font-size: 30px;
  }
  li {
    margin-bottom: 12px;
  }
---

<!-- _class: accent -->

# OpenClaw
## 세계 최대 바이브 코딩 프로젝트에서 배우는 모범 사례

정도현 — ROBOCO.IO

---

<!-- _class: impact -->

# 바이브 코딩을
# 프로덕션에서 쓸 수 있냐고?

---

<!-- _class: impact -->

## GitHub 스타 *33만개*.
## 기여자 *1,200명+*.
## 머지된 PR *23,000개+*.

쓸 수 있냐가 아니라, 이미 쓰고 있다.

---

# OpenClaw가 뭔가

- 셀프 호스팅 개인 AI 어시스턴트
- WhatsApp, Telegram, Discord, Slack 등 **15개+ 채널** 연결
- TypeScript 모노레포, **30만+ LOC**, Fork **6.4만+**
- 오스트리아 개발자 **Peter Steinberger**가 AI 에이전트로 구축

---

<!-- _class: impact -->

## 핵심은 이거다.
## 이걸 *혼자* 만들었다.

---

# Steinberger의 워크플로

- 터미널에 **Codex CLI 3~8개** 동시 실행
- 같은 폴더에서 병렬로 작업
- 2026년 1월, 한 달에 **6,600개+ 커밋**
- 겉보기엔 20명 규모 팀의 속도

---

<!-- _class: impact -->

## 프롬프트는 점점 짧아졌다.
## 지금은 *1~2문장 + 스크린샷 하나*.

입력의 절반이 스크린샷이다.

---

<!-- _class: accent -->

# 그래서 어떻게 했길래
# 이게 가능한 건가?

---

<!-- _class: impact -->

# 제일 중요한 건
# *AGENTS.md*

---

# AGENTS.md가 뭔가

- 코드베이스에서 작업하는 **모든 AI 에이전트를 위한 지침서**
- `CLAUDE.md`는 같은 파일의 심볼릭 링크
- AI가 실수할 때마다 규칙을 추가해서 점진적으로 작성

> "조직의 상처가 축적된 흔적의 모음"
> — Steinberger

---

# AGENTS.md에 뭘 적나

- 빌드/테스트 명령어: `pnpm build`, `pnpm test`
- Git 규칙: Conventional Commits, `git pull --rebase`
- **멀티 에이전트 안전 규칙**
  - stash 금지, 브랜치 변경 금지
  - 모르는 변경 발견 → 다른 에이전트 작업으로 간주
- 보안 경계: 실제 전화번호, 운영 설정값 커밋 금지

---

<!-- _class: impact -->

## 구전 지식을
## *기계가 읽을 수 있는*
## 제도적 기억으로 바꾼다.

---

<!-- _class: accent -->

# 9가지 모범 사례

---

# 1. 살아 있는 AGENTS.md를 유지하라

AI 에이전트가 실수할 때마다 규칙을 추가하라.

Steinberger의 파일은 **~800줄**.
git 규약, 테스트, 아키텍처, 멀티 에이전트 조율 전부 들어있다.

---

# 2. Research → Plan → Implement

구현부터 하지 마라.

- **Research**: "auth 모듈을 읽고 세션 동작을 설명해"
- **Plan**: "수정할 파일과 변경 내용을 적어"
- **Implement**: 계획 검토 후 구현

> *"계획 단계에서 오해를 잡는 비용은*
> *연쇄 오류 디버깅보다 10배 저렴하다."*

---

# 3. Conventional Commits를 강제하라

`fix(telegram): resolve TypeError in status command`

- AI 에이전트가 히스토리를 이해할 수 있고
- 자동 체인지로그 생성도 가능해진다
- *기계 해석 가능한 히스토리*

---

<!-- _class: impact -->

# 4. AI 에이전트를
# *주니어 엔지니어*처럼 다뤄라

---

> "예전에 팀을 이끈 적이 있다.
> 내 아래에 많은 소프트웨어 엔지니어가 있었다.
> 그때도 내가 원하는 방식과 똑같은 코드를
> 그들이 쓰지는 않는다는 점을 받아들여야 했다."
>
> — Steinberger

---

# 인간 vs 에이전트의 역할

**인간이 할 일:**
시스템 아키텍처, 취향(작동 vs 우아한 해법), 보안 설계

*에이전트에게 맡길 일:*
구현, 보일러플레이트, 스캐폴딩, 리팩터링

---

# 5. 병렬 에이전트에는 명시적 조율 규칙

같은 폴더에서 여러 에이전트 동시 작업 가능. 단:

- 수정 전 `git status` / `git diff` 확인
- **원자적 커밋**
- **stash 금지, 브랜치 변경 금지**
- 모르는 변경 = 다른 에이전트 작업

*1인 플레이 → 멀티플레이 오케스트레이션*

---

# 6. AI PR은 투명한 1급 시민

- AI 사용 여부 **공개**
- 테스트 수준 **명시**: untested / lightly / fully tested
- **프롬프트나 세션 로그** 첨부
- 생성된 코드를 **이해하고 있음** 확인

> "AI PRs are first-class citizens here.
> We just want transparency."

---

# 7. 취향이 필요 없는 건 전부 자동화

- 자동 라벨링, 자동 응답, 코드 리뷰 봇
- stale 이슈 관리, 시크릿 탐지
- 데드 코드 분석, 중복 검사

**인간은 아키텍처와 품질 판단에 집중.**
나머지는 자동화하거나 에이전트에 위임.

---

# 8. 개입할 때와 맡길 때를 구분하라

**AI에 맡겨라:**
스캐폴딩, UI 컴포넌트, 보일러플레이트, 탐색

*직접 개입하라:*
인증, 결제, DB 스키마, API 권한, 보안 전부

AI는 "겉보기에 완벽하지만 미묘한 버그가 있는" 코드를 만든다.
**모든 변경 후 반드시 테스트.**

---

# 9. 프롬프트에 제약 조건을 고정하라

- "**50줄 이하**로 작성해"
- "파일 전체가 아니라 **수정된 함수만**"
- "결제 플로만. **auth는 건드리지 마**"
- "`UserService.ts`의 **기존 패턴**을 따를 것"

*모호한 프롬프트 = 모호한 결과*

---

<!-- _class: accent -->

# 결론

---

<!-- _class: impact -->

## 바이브 코딩은
## 엔지니어링 규율을 *버리는 일*이 아니라
## **재배치하는 일**이다.

---

# Steinberger의 학습 곡선

2025년 6월 — 상세한 명세 작성
2025년 후반 — 스크린샷 중심의 짧은 프롬프트
2026년 현재 — 최소 감독으로 **3~8개 병렬 에이전트** 운영

모든 바이브 코더가 따라가게 될 곡선이다.

---

<!-- _class: impact -->

## 코드를 직접 쓰는 숙련에서,
## *코드를 쓰는 시스템을*
## *설계하는 숙련*으로.

---

# 오늘 당장 할 수 있는 것

`AGENTS.md` (또는 `CLAUDE.md`)를 만들어라.

1. AI가 실수할 때마다 규칙을 추가하라
2. 빌드 명령, git 규칙, 보안 경계를 적어라
3. 팀의 암묵지를 기계가 읽을 수 있는 형태로 바꿔라

> **"조직의 상처가 축적된 흔적"**
> 이것이 가장 강력한 도구다.

---

<!-- _class: accent -->

# 감사합니다

정도현 — ROBOCO.IO
roboco.io/posts/openclaw-vibe-coding-best-practices/

<div id="clock"></div>
<script>
function updateClock() {
  const now = new Date();
  const h = String(now.getHours()).padStart(2, '0');
  const m = String(now.getMinutes()).padStart(2, '0');
  const s = String(now.getSeconds()).padStart(2, '0');
  const el = document.getElementById('clock');
  if (el) el.textContent = h + ':' + m + ':' + s;
}
setInterval(updateClock, 1000);
updateClock();
</script>
