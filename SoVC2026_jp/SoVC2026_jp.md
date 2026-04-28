---
marp: true
title: "State of Vibe Coding 2026 — 意図だけが残り、それ以外は抽象化される"
theme: default
footer: "State of Vibe Coding — 2026"
size: 16:9
paginate: true
style: |
  @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Mono:wght@400;700&family=Noto+Sans+JP:wght@400;700;900&display=swap');
  :root {
    --bg: #0a0a0a;
    --fg: #33ff33;
    --fg-dim: #1a9a1a;
    --fg-bright: #66ff66;
    --amber: #ffaa00;
    --red: #ff4444;
    --comment: #338833;
  }
  section {
    background: var(--bg);
    color: var(--fg);
    font-family: 'IBM Plex Mono', 'Noto Sans JP', monospace;
    font-size: 24px;
    text-shadow: 0 0 4px rgba(51, 255, 51, 0.3);
  }
  section::after {
    color: var(--fg-dim);
    text-shadow: none;
  }
  h1, h2, h3 {
    color: var(--fg-bright);
    text-shadow: 0 0 8px rgba(51, 255, 51, 0.5);
  }
  h1 { border-bottom: 2px solid var(--fg-dim); padding-bottom: 8px; }
  a { color: var(--fg-bright); }
  strong { color: var(--fg-bright); }
  code {
    background: #111;
    color: var(--fg);
    border: 1px solid var(--fg-dim);
  }
  pre {
    background: #050505;
    border: 1px solid var(--fg-dim);
    box-shadow: 0 0 10px rgba(51, 255, 51, 0.1);
  }
  pre code { border: none; }
  blockquote {
    border-left: 4px solid var(--fg-dim);
    color: var(--fg-bright);
    background: rgba(51, 255, 51, 0.05);
  }
  table { border-collapse: collapse; width: 100%; }
  th {
    background: #111;
    color: var(--fg-bright);
    border: 1px solid var(--fg-dim);
    padding: 8px 12px;
  }
  td {
    background: var(--bg);
    border: 1px solid var(--fg-dim);
    color: var(--fg);
    padding: 8px 12px;
  }
  tr:nth-child(even) td { background: #0d0d0d; }
  li::marker { color: var(--fg-dim); }
  footer {
    color: var(--fg-dim) !important;
    text-shadow: none;
    font-family: 'IBM Plex Mono', monospace;
  }
  section::before {
    content: '';
    position: absolute;
    top: 20px;
    left: 24px;
    width: 48px;
    height: 37px;
    background-color: var(--fg);
    -webkit-mask-image: url('../assets/roboco-logo.svg');
    mask-image: url('../assets/roboco-logo.svg');
    -webkit-mask-size: contain;
    mask-size: contain;
    -webkit-mask-repeat: no-repeat;
    mask-repeat: no-repeat;
    opacity: 0.6;
    z-index: 10;
  }
  section:first-of-type::before {
    width: 80px;
    height: 61px;
    top: 24px;
    left: 28px;
    opacity: 0.8;
  }
  section.divider {
    background: var(--bg);
    color: var(--fg-bright);
    font-size: 40px;
    text-align: center;
    display: flex;
    justify-content: center;
    align-items: center;
    text-shadow: 0 0 16px rgba(51, 255, 51, 0.6);
  }
  section.divider h1 { border-bottom: none; }
  section.impact h1 {
    font-size: 56px;
    font-weight: 900;
    text-shadow: 0 0 20px rgba(51, 255, 51, 0.7);
  }
  section.impact h2 {
    font-size: 44px;
    font-weight: 900;
    text-shadow: 0 0 16px rgba(51, 255, 51, 0.6);
  }
  .accent { color: var(--fg-bright); text-shadow: 0 0 6px rgba(51, 255, 51, 0.5); }
  .warn { color: var(--amber); text-shadow: 0 0 6px rgba(255, 170, 0, 0.4); }
  .amber { color: var(--amber); text-shadow: 0 0 6px rgba(255, 170, 0, 0.4); }
  .dim { color: var(--comment); }
---

# State of Vibe Coding 2026

> 意図だけが残る

<!--
[한국어 원문]
# State of Vibe Coding 2026

> 의도만 남는다
-->

---

## 発表者紹介

ジョン・ドヒョン
- ROBOCO 主席コンサルタント
- 30年目のソフトウェアエンジニア
- 2016〜2024年、Amazonでソフトウェアエンジニア・テクニカルトレーナーとして勤務
- 2024年末にVibe Codingの可能性を確信し、2026年にROBOCOを創業
- 現在は企業のAIトランスフォーメーションをコンサルティングしている

<!--
[한국어 원문]
## 발표자 소개

정도현
- ROBOCO 수석 컨설턴트
- 30년차 소프트웨어 엔지니어
- 2016~2024 아마존에서 소프트웨어 엔지니어, 테크니컬 트레이너로 근무
- 2024년 말 바이브 코딩의 가능성을 확인하고 2026년 ROBOCO 창업
- 현재 기업의 AI 트랜스포메이션을 컨설팅하고 있다
-->

---

## 今日お話しすること

- 2026年4月、Vibe Codingの現在地
- AIの能力の伸びと、その意味
- **ルールと好み**をどこで分けるか
- 仕様、実装、ハーネスはどう抽象化されていくか
- **Intent Engineering** — なぜ最終的には意図だけが残るのか
- その流れがすでに現実となっている事例 — OpenClaw
- では今、何から始めるか

<!--
[한국어 원문]
## 오늘 이야기할 것

- 2026년 4월, 바이브 코딩의 현재
- AI 능력의 성장과 그 의미
- **규칙과 취향**을 어디서 나눌 것인가
- 사양, 구현, 하네스가 어떻게 추상화되는가
- **Intent Engineering** — 왜 결국 의도만 남는가
- 그 흐름이 이미 현실인 사례 — OpenClaw
- 그래서 지금 무엇부터 시작할 것인가
-->

---

<!-- _class: divider -->

# 2026年4月、Vibe Codingの現在地

<!--
[한국어 원문]
# 2026년 4월, 바이브 코딩의 현재
-->

---

## Vibe CodingはAIトランスフォーメーションの一部だ

> もっと大きな何かが起きている

- コード生成はAIトランスフォーメーションの**一部分**にすぎない
- 仕様、テスト、デプロイ、モニタリング、学習まで一緒に変わってきている
- <span class="accent">ソフトウェア開発の全工程がAIとともに再編されつつある</span>

<!--
[한국어 원문]
## 바이브 코딩은 AI 전환의 일부다

> 더 큰 뭔가가 벌어지고 있음

- 코드 생성은 AI 트랜스포메이션의 **한 조각**일 뿐
- 사양, 테스트, 배포, 모니터링, 학습까지 함께 바뀌고 있다
- 소프트웨어 개발 전 과정이 AI와 함께 재편되고 있다
-->

---

<!-- _class: divider -->

# AIの能力は指数関数的に
# 伸び続けている

<!--
[한국어 원문]
# AI의 능력은 기하급수적으로
# 증가하고 있다
-->

---

## METR: AIタスク遂行時間のホライズン

<div style="display: flex; gap: 32px; align-items: center;">
<div style="flex: 1; min-width: 0;">

- 扱える作業範囲が**7か月ごとに2倍**に伸びている
- このトレンドが続けば、2026年までに人間の専門家が**1か月かかる作業**もAIが遂行可能
- 同時に伸びている3つの能力:
  - **知能** — より複雑な推論と判断
  - **記憶力** — より大きなコンテキストウィンドウ
  - **ツール使用** — ブラウザ、ターミナル、API

<span class="dim" style="font-size: 16px;">出典: metr.org/time-horizons</span>

</div>
<div style="flex: 1; min-width: 0;">

![METR Time Horizons](metr-graph.png)

</div>
</div>

<!--
[한국어 원문]
## METR: AI 작업 수행 시간의 지평선

- 작업 범위가 **7개월마다 2배**로 늘어난다
- 이 추세가 이어지면 2026년 안에 인간 전문가가 **1달 걸리는 작업**도 AI가 수행 가능
- 함께 커지는 세 가지 능력:
  - **지능** — 더 복잡한 추론과 판단
  - **기억력** — 더 큰 컨텍스트 윈도우
  - **도구 사용** — 브라우저, 터미널, API

출처: metr.org/time-horizons
-->

---

## この成長が意味すること

私たちはすでに指数関数的な上昇サイクルに入っている

- 実装可能な範囲は関数単位を超え、システム単位になった
- 仕様の作成は?
- ガードレールは?

> では、人間とAIの境界線はどこにあるのか?

<!--
[한국어 원문]
## 이 성장이 의미하는 것

우리는 기하급수적인 상승 사이클에 이미 진입해 있음

- 구현 가능 범위는 함수 단위를 넘어 시스템 단위가 되었음
- 사양 작성은?
- 가드레일은?

> 그렇다면 사람과 AI의 경계선은?
-->

---

<!-- _class: divider -->

# ルールと好みを区別せよ

<!--
[한국어 원문]
# 규칙과 취향을 구별하라
-->

---

## ルール: 組織全体に強制される必須事項

- ビルド/テストゲート — 抜けるとバグを見逃す
- Git安全ルール — マルチエージェントでの作業衝突を防ぐ
- セキュリティ境界 — シークレットのコミット、本番データの使用を禁止
- アーキテクチャ境界 — import、package、公開APIの制限
- 高リスクな変更 — 認証、決済、DBスキーマは手動レビュー必須

> <span class="warn">ルールはリポジトリでソースコードと一緒に管理され、CI/CDと結合してプロジェクト/チーム/組織/会社レベルで強制されなければならない。</span>

<!--
[한국어 원문]
## 규칙: 조직 전체에 강제 되는 필수 사항

- 빌드/테스트 게이트 — 빠지면 버그를 놓친다
- Git 안전 규칙 — 멀티 에이전트에서 작업 충돌을 막는다
- 보안 경계 — 시크릿 커밋, 실제 데이터 사용 금지
- 아키텍처 경계 — import, package, 공개 API 제한
- 고위험 변경 — 인증, 결제, DB 스키마는 수동 리뷰 필수

> 규칙은 리포지토리에서 소스코드와 함께 관리되며, CI/CD와 결합되어 프로젝트/팀/조직/회사 수준에서 강제되어야 한다.
-->

---

## 好み: 別のやり方でもいいもの

- セミコロン、空白、trailing comma
- 命名と import の並び順
- コメントスタイル
- 抽象化のタイミング
- feature-based vs layer-based の構造

<!--
[한국어 원문]
## 취향: 다르게 해도 괜찮은 것

- 세미콜론, 공백, trailing comma
- 이름 짓기와 import 정렬
- 주석 스타일
- 추상화 타이밍
- feature-based vs layer-based 구조
-->

---

<!-- _class: divider -->

# 結局、意図だけが残る

<!--
[한국어 원문]
# 결국 의도만 남는다
-->

---

## 仕様、実装、ハーネス — 好みの問題か?

| 領域 | 性格 | AI時代の位置づけ |
|------|------|-----------------|
| **仕様(Spec)** | What から導出可能 | AIが生成 |
| **実装(How)** | 技術選定 + コーディング | AIの領域 |
| **ハーネス(ガードレール)** | ルールの自動化 | ルール + スキル |
| **テスト** | 検証の自動化 | AIが生成 + CIが強制 |
| **デプロイ** | パイプライン | CDが自動実行 |

> <span class="warn">How よりも Why が重要</span>

<!--
[한국어 원문]
## 사양, 구현, 하네스 — 취향인가?

| 영역 | 성격 | AI 시대의 위치 |
|------|------|---------------|
| **사양(Spec)** | What에서 도출 가능 | AI가 생성 |
| **구현(How)** | 기술 선택 + 코딩 | AI의 영역 |
| **하네스(가드레일)** | 규칙의 자동화 | 규칙 + 스킬 |
| **테스트** | 검증의 자동화 | AI가 생성 + CI가 강제 |
| **배포** | 파이프라인 | CD가 자동 실행 |

> How 보다 Why가 중요
-->

---

<!-- _class: impact -->

## 最後まで人が握っているべきものは?

<!--
[한국어 원문]
## 끝까지 사람이 쥐고 있어야 할 것은?
-->

---

## Vibe Coding と XY 問題

XY 問題: 問題(X)ではなく、先に思いついた解法(Y)を固定してしまうこと

- <span class="warn">❌ 「ビルドを通して」</span> — その場しのぎの解法を採る
  → AI が**テストを削除して**ビルドだけ通す
- <span class="accent">✓ 「テスト X がなぜ失敗するのか診断して、修正方針を教えて」</span> — 問題(X)をそのまま伝える
  → AI が原因を分析して適切な修正案を提示する

> AIは意図を推論するが、<span class="warn">意図が明確でないと、誤った解法を採用してしまう。</span>
> <span class="accent">問題をそのまま伝えれば、AI は適切な解法を見つける。</span>

<!--
[한국어 원문]
## 바이브 코딩과 XY 문제

XY 문제: 문제(X) 대신 먼저 떠올린 해법(Y)을 고정하는 것

- ❌ "빌드 통과 시켜줘" — 임시방편적인 해법을 사용
  → AI가 **테스트를 삭제**해 빌드만 통과시킨다
- ✓ "테스트 X가 왜 실패하는지 진단하고 수정 방향을 알려줘" — 문제(X)를 그대로 전달
  → AI가 원인을 분석해 적절한 수정안을 제시한다

> AI는 의도를 추론하지만, 의도가 명확하지 못하면 잘못된 해법을 사용한다.
> 문제를 그대로 전달하면, AI는 적절한 해법을 찾는다.
-->

---

## 鍵は意図を明確に伝えること

> 意図エンジニアリング:
> 最小限の労力で **意図** を明確に伝えること

コード生成、検証、デプロイのコストが下がるほど、
残る希少資源は**「何を、なぜ作るのか」** — つまり <span class="accent">意図</span> だ。

<!--
[한국어 원문]
## 핵심은 의도의 명확한 전달이다

> 의도 공학:
> 최소한의 노력으로 **의도**를 명확하게 전달하는 것

코드 생성, 검증, 배포 비용이 함께 내려갈수록
남는 희소자원은 **"무엇을, 왜 만들 것인가"** — 즉, 의도다.
-->

---

## Intent Engineering

> **Ship intent, not code.**

```markdown
# INTENT — [Project Name]

> status: seed | exploring | clarified | killed

## Why    ← なぜ存在すべきか
## What   ← 何を作るのか
## Not    ← 絶対にやらないこと、境界線
## Learnings ← 探究の中で学んだこと
```

- **How** は AI が埋める。
- **Not がなければ** AI は空いた前提を勝手に埋める。

<!--
[한국어 원문]
## Intent Engineering

> **Ship intent, not code.**

# INTENT — [Project Name]
> status: seed | exploring | clarified | killed
## Why    ← 이것이 왜 존재해야 하는가
## What   ← 무엇을 만드는가
## Not    ← 절대 하지 않을 것, 경계선
## Learnings ← 탐구하며 배운 것들

- **How**는 AI가 채운다.
- **Not이 없으면** AI는 비어 있는 가정을 대신 채운다.
-->

---

## 意図のライフサイクル

```
seed → exploring → clarified → build
  │        │            │
  └────────┴────────────┴──→ killed
```

| 状態 | 説明 |
|------|------|
| **seed** | アイデアだけがある。仮説を書き、最初の実験をする |
| **exploring** | プロトタイプ、インタビュー、リサーチで検証中 |
| **clarified** | Why/What/Not が確信で埋まった。AI に渡す |
| **build** | 実装と検証を自動化パイプラインで実行する |
| **killed** | 「作らない方がいい」と証拠が示した。これも良い結果 |

<!--
[한국어 원문]
## 의도의 생명주기

seed → exploring → clarified → build → killed

| 상태 | 설명 |
|------|------|
| **seed** | 아이디어만 있다. 가설을 적고 첫 실험 |
| **exploring** | 프로토타입, 인터뷰, 리서치로 검증 중 |
| **clarified** | Why/What/Not이 확신으로 채워졌다. AI에게 넘긴다 |
| **build** | 구현과 검증을 자동화 파이프라인으로 실행한다 |
| **killed** | 증거가 "만들지 말라"고 한다. 이것도 좋은 결과다 |
-->

---

## パイプラインのうち、人の介入が必要な部分は?

```
  [Intent の伝達]   ← 意図を明確化
         ↓
  [Spec 生成]           ← Why/What/Not からタスクを導出
         ↓
  [実装]                ← コードを書く
         ↓
  [検証]                ← レビュー、テスト、リント
         ↓
  [デプロイ]            ← CI/CD によるリリース
         ↓
  [フィードバック]      ← ユーザーデータ分析
         ↓
  [学習 & 判断]         ← 評価し、意図を更新するか終了する
```

<!--
[한국어 원문]
## 파이프라인에서 사람이 개입이 필요한 부분은?

[Intent 전달]     ← 의도를 명확화
       ↓
[Spec 생성]        ← Why/What/Not에서 태스크 도출
       ↓
[구현]             ← 코드 작성
       ↓
[검증]             ← 리뷰, 테스트, 린트
       ↓
[배포]             ← CI/CD에 의한 릴리스
       ↓
[피드백]           ← 사용자 데이터 분석
       ↓
[학습 & 판단]      ← 평가하고, 의도를 갱신하거나 종료
-->

---

<!-- _class: divider -->

###  コードを見ない開発は可能か?

# すでに現実だ

<!--
[한국어 원문]
###  코드를 보지않는 개발이 가능한가?

# 이미 현실이다
-->

---

## OpenClawとは? — "The lobster way 🦞"

オーストリアのバイブコーダー **Peter Steinberger** が 2025年11月に始めた個人 AI アシスタント・フレームワーク

- **ローカル優先** — どの OS・プラットフォームでも動作
- **モデル非依存(BYOM)** — Claude · GPT · DeepSeek どの LLM とも結合
- **AGENTS.md + SOUL.md** — プレーンな Markdown でエージェントの運用と人格を記述
- 名前は **Clawdbot → Moltbot → OpenClaw** — 二度のリネームを経て定着
- スローガン: <span class="accent">"Your own personal AI assistant. Any OS. Any Platform."</span>

> 一人が5か月で作ったフレームワークが <span class="accent">バイブコーディング運動の中心軸</span> になった。

<!--
[한국어 원문]
## OpenClaw란? — "The lobster way 🦞"

오스트리아 바이브 코더 **Peter Steinberger**가 2025년 11월에 시작한 개인 AI 어시스턴트 프레임워크

- **로컬 우선** — 어떤 OS·플랫폼에서도 동작
- **모델 무관(BYOM)** — Claude · GPT · DeepSeek 어느 LLM과도 결합
- **AGENTS.md + SOUL.md** — 평문 마크다운으로 에이전트의 운영·정체성을 기술
- 이름은 **Clawdbot → Moltbot → OpenClaw** — 두 번의 리네이밍 끝에 정착
- 슬로건: "Your own personal AI assistant. Any OS. Any Platform."

> 한 사람이 5개월 만에 만든 프레임워크가 바이브 코딩 운동의 중심축이 되었다.
-->

---

## GitHub 史上最速で星を集めたプロジェクト

| 指標 | 規模 *(2026.04 時点)* |
|------|---------------------|
| GitHub スター | <span class="accent">347,000+</span> — 史上最多の新記録 |
| Forks | 74,800+ |
| コントリビューター | 900+ |
| Discord メンバー | 180,000 *(2か月で2倍)* |
| r/openclaw 購読者 | 450,000 |
| 公開エージェント・テンプレート | 162 *(awesome-openclaw-agents)* |

- <span class="accent">"AI/vibe-coded PRs welcome!"</span> — バイブコーディングを公式に歓迎する初のメジャー OSS
- 開始 5か月で Fortune 500 のセルフホスト・セキュリティ要件まで到達

<!--
[한국어 원문]
## GitHub 역사상 가장 빠르게 별을 모은 프로젝트

| 지표 | 규모 (2026.04 기준) |
|------|---------------------|
| GitHub 별 | 347,000+ — 역사상 최다 신기록 |
| Forks | 74,800+ |
| 컨트리뷰터 | 900+ |
| Discord 멤버 | 180,000 (2개월만에 2배) |
| r/openclaw 구독자 | 450,000 |
| 공개 에이전트 템플릿 | 162 (awesome-openclaw-agents) |

- "AI/vibe-coded PRs welcome!" — 바이브 코딩을 공식 환영하는 첫 메이저 OSS
- 시작 5개월 만에 Fortune 500의 자체 호스팅 보안 요구치까지 도달
-->

---

## OpenClaw: 一人 + AI = 20人チームの速度

GitHub **31万+ スター**。Vibe Coding がどこまで来たかを示す事例。

- **3〜8個の AI エージェント**を並列実行
- 1か月で **6,600 コミット**
- 入力は **1〜2文 + スクリーンショット**
- 人間はコードを全部読むより **構造と設計** を握る
- それを支えているのが **AGENTS.md とゲート** だ

> 人間はアーキテクチャ、好み、調整を担当する。
> 実装、ボイラープレート、リファクタリングはエージェントへ。

<!--
[한국어 원문]
## OpenClaw: 한 사람 + AI = 20명 팀의 속도

GitHub **31만+ 스타**. 바이브 코딩이 어디까지 왔는지 보여주는 사례.

- **3~8개 AI 에이전트**를 병렬 실행
- 한 달 **6,600개 커밋**
- 입력은 **1~2문장 + 스크린샷**
- 인간은 코드를 다 읽기보다 **구조와 설계**를 붙잡는다
- 이를 받쳐주는 것이 **AGENTS.md와 게이트**다

> 인간은 아키텍처, 취향, 조율을 맡는다.
> 구현, 보일러플레이트, 리팩터링은 에이전트에게.
-->

---

## OpenClaw 解剖 ① — 薄い憲法、厚いランブック

ルート `AGENTS.md` は **38行** のテレグラフ・スタイル

```
Telegraph style. Root rules only.
Read scoped AGENTS.md before subtree work.
```

- ルートは **原則・境界・承認ルール** のみ — トークン削減・注意分散の防止
- 詳細手順は **15個の skill** と下位 `AGENTS.md` に委譲
- 長さ自体が危険度を反映
  - `openclaw-pr-maintainer` — 59 LOC
  - `openclaw-release-maintainer` — <span class="accent">574 LOC</span>
  - `openclaw-ghsa-maintainer` — GHSA patch/publish シーケンス
  - `openclaw-parallels-smoke` — VM smoke / OS別の例外

> <span class="accent">「必要なガイドだけを読め」 — anti context-bloat 原則</span>

<!--
[한국어 원문]
## OpenClaw 해부 ① — 얇은 헌법, 두꺼운 런북

루트 `AGENTS.md`는 **38줄**의 텔레그래프 스타일

```
Telegraph style. Root rules only.
Read scoped AGENTS.md before subtree work.
```

- 루트는 **원칙·경계·승인 규칙**만 — 토큰 절감, 주의 분산 방지
- 세부 절차는 **15개 skill**과 하위 `AGENTS.md`로 위임
- 길이 자체가 위험도를 반영
  - `openclaw-pr-maintainer` — 59 LOC
  - `openclaw-release-maintainer` — 574 LOC
  - `openclaw-ghsa-maintainer` — GHSA patch/publish 시퀀스
  - `openclaw-parallels-smoke` — VM smoke / OS별 예외

> "필요한 가이드만 읽어라" — anti context-bloat 원칙
-->

---

## OpenClaw 解剖 ② — 危険な作業の専用 skill + Evidence bar

危険な作業ごとに prose guardrail が **証拠基準** を強制する

`openclaw-pr-maintainer` のマージ・ルール:

```
1. symptom evidence       ← 症状がコード/ログで再現できるか
2. root cause in code     ← どの経路のどの行が原因か
3. fix touching that path ← 修正が実際にその経路を触っているか
4. regression test        ← 回帰テストまたは例外理由
```

- <span class="warn">「issue text や AI rationale だけでマージ禁止」</span>
- `release-maintainer` は version bump/publish に **明示的承認** を要求
- <span class="accent">良い skill はコマンド集ではなく失敗防止装置</span>
  - 「やらないこと / 先に確認すること / 承認が必要なこと / artifact の場所」

<!--
[한국어 원문]
## OpenClaw 해부 ② — 위험 작업의 전용 skill + Evidence bar

위험 작업마다 prose guardrail이 **증거 기준**을 강제한다

`openclaw-pr-maintainer`의 머지 규칙:

1. symptom evidence       ← 증상이 코드/로그로 재현되는가
2. root cause in code     ← 어느 경로의 어느 줄이 원인인가
3. fix touching that path ← 수정이 실제 그 경로를 건드리는가
4. regression test        ← 회귀 테스트 또는 예외 사유

- "이슈 텍스트나 AI rationale만으로 머지 금지"
- release-maintainer는 version bump/publish에 명시적 승인 요구
- 좋은 skill은 명령 모음이 아니라 실패 방지 장치
-->

---

## OpenClaw 解剖 ③ — 失敗は prompt ではなく運用境界で

OpenClaw で最も多く壊れた場所は **skill の中身ではなかった**

| 壊れる地点 | 何が起きるのか |
|-----------|---------------|
| **経路** | `~` の解釈が違って、同じ skill が見えなくなる |
| **隔離** | host のパスを sandbox の中でそのまま使えない |
| **契約** | ドキュメントは「見える」と言うのにランタイムは「見えない」 |

> <span class="accent">「skill が何をするか」よりも「どこで見え、どう実行されるか」のほうが頻繁に壊れる。</span>

> <span class="warn">バイブコーディングのインフラは prompt 品質より先に — 経路・隔離・契約を設計せよ。</span>

<!--
[한국어 원문]
## OpenClaw 해부 ③ — 실패는 prompt가 아니라 운영 경계에서

OpenClaw에서 가장 많이 깨진 곳은 **skill의 내용이 아니었다**

| 깨지는 지점 | 무슨 일이 일어나는가 |
|------------|---------------------|
| **경로** | `~`가 다르게 풀려, 같은 skill이 안 보인다 |
| **격리** | host 경로를 sandbox 안에서 그대로 못 쓴다 |
| **계약** | 문서는 "보인다"는데 런타임은 "안 보인다" |

> "skill이 무엇을 하는가"보다 "어디서 보이고, 어떻게 실행되는가"가 더 자주 깨진다.

> 바이브 코딩 인프라는 prompt 품질보다 먼저 — 경로·격리·계약을 설계하라.
-->

---

<!-- _class: divider -->

# では、どう始めるか

<!--
[한국어 원문]
# 그래서 어떻게 시작할 것인가
-->

---

## 小さなものから、重要度の低いものから

- <span class="warn">最初から中核システムに適用しないこと</span>
- サイドプロジェクト、社内ツール、プロトタイプから始める
- 段階的に拡大:

```
サイドプロジェクト
  → 社内ツール
    → 新規サービス
      → 既存システムの改善
```

> ルールとスキルを高速な反復とともに更新する

<!--
[한국어 원문]
## 작은 것부터, 덜 중요한 것부터

- 처음부터 핵심 시스템에 적용하지 말 것
- 사이드 프로젝트, 내부 도구, 프로토타입부터 시작
- 점진적으로 확대:

사이드 프로젝트
  → 내부 도구
    → 신규 서비스
      → 기존 시스템 개선

> 규칙과 스킬을 빠른 반복과 함께 업데이트
-->

---

## 既存プロジェクトを Vibe Coding へ — Vibe Coding 準備の3ステップ

```
[1] コードベース分析  →  [2] ドキュメント + スキル  →  [3] ハーネス構築
    暗黙知 → 明示知       ルール・反復の抽出           行動境界の自動化
```

- 一度で完成させない — 小さな領域から繰り返す
- 各ステップを AI と一緒に進める
- 3ステップが回ることで <span class="accent">組織の Vibe Coding 資産</span> が積み上がる

<!--
[한국어 원문]
## 기존 프로젝트를 바이브 코딩으로 — 바이브 코딩 준비 3단계

[1] 코드베이스 분석  →  [2] 문서화 + 스킬  →  [3] 하네스 구축
    암묵지 → 명시지       규칙·반복 추출         행동 경계 자동화

- 한 번에 완성하지 않는다 — 작은 영역부터 반복
- 매 단계를 AI와 함께 진행한다
- 세 단계가 돌면서 조직의 바이브 코딩 자산이 쌓인다
-->

---

## ステップ 1 — コードベース分析

> AI にまずコードベースを理解させる

- **構造と依存関係** — モジュール境界、公開API、ビルドグラフ
- **ドメイン言語** — 用語、モデル、不変条件
- **暗黙のお約束** — 命名、レイヤー、エラーハンドリングのスタイル
- **リスクポイント** — 認証、決済、スキーマ変更

> <span class="accent">AI が先に読み、人が検証する。</span>
> 分析結果は次のステップの入力になる。

<!--
[한국어 원문]
## 1단계 — 코드베이스 분석

> AI에게 코드베이스를 먼저 이해시킨다

- **구조와 의존성** — 모듈 경계, 공개 API, 빌드 그래프
- **도메인 언어** — 용어, 모델, 불변식
- **암묵적 규약** — 네이밍, 레이어, 에러 처리 방식
- **위험 지점** — 인증, 결제, 스키마 변경

> AI가 먼저 읽고, 사람이 검증한다.
> 분석 결과는 다음 단계의 입력이 된다.
-->

---

## ステップ 2 — ドキュメント + スキル生成

分析結果を AI が毎回読み返せる形で残す

- **CLAUDE.md / AGENTS.md** — 組織ルール、ビルド/テストゲート、禁止事項
- **ドメインドキュメント** — Why/What/Not ベースの INTENT、用語集
- **スキル(Skills)** — 反復作業を再利用可能な手順として抽出
  - 例: API エンドポイント追加、マイグレーション生成、デプロイ手順

> <span class="accent">スキルを通じて、ドキュメントは人と AI に常時コンテキストを供給する</span>

<!--
[한국어 원문]
## 2단계 — 문서화 + 스킬 생성

분석 결과를 AI가 매번 다시 읽을 수 있는 형태로 남긴다

- **CLAUDE.md / AGENTS.md** — 조직 규칙, 빌드/테스트 게이트, 금지선
- **도메인 문서** — Why/What/Not 기반 INTENT, 용어집
- **스킬(Skills)** — 반복 작업을 재사용 가능한 절차로 추출
  - 예: API 엔드포인트 추가, 마이그레이션 생성, 배포 절차

> 스킬을 통해 문서는 사람과 AI에게 맥락을 상시 제공
-->

---

## ステップ 3 — ハーネス構築

> ルールをコードで強制する

- **フック(Hooks)** — 危険コマンドの遮断、コミット前ゲート
- **CI ゲート** — ビルド、テスト、リント、型チェック
- **権限ポリシー** — ファイル/ツール/ネットワークのアクセス許可リスト
- **サブエージェントの分離** — 役割ごとの権限とコンテキストの分離

> <span class="warn">ハーネスがなければ、意図はガイドラインに留まる。</span>
> <span class="accent">ハーネスがあって初めて、AI は自律的に、かつ安全に働ける。</span>

<!--
[한국어 원문]
## 3단계 — 하네스 구축

> 규칙을 코드로 강제한다

- **훅(Hooks)** — 위험 명령 차단, 커밋 전 게이트
- **CI 게이트** — 빌드, 테스트, 린트, 타입체크
- **권한 정책** — 파일/도구/네트워크 접근 허용 목록
- **서브에이전트 분리** — 역할별 권한과 컨텍스트 격리

> 하네스가 없으면 의도는 가이드라인에 그친다.
> 하네스가 있어야 AI가 자율적으로, 그리고 안전하게 일한다.
-->

---

## 意図の品質

意図の品質だけは、人の理解に依存している。

- **Why** を書くには → <span class="accent">ドメイン理解</span>
- **What** を書くには → <span class="accent">技術理解</span>
- **Not** を書くには → <span class="accent">経験</span>

> AI で学習と実験を加速できる!

<!--
[한국어 원문]
## 의도의 품질

의도의 품질 만큼은 사람의 이해에 달려 있다.

- **Why**를 쓰려면 → 도메인 이해
- **What**을 쓰려면 → 기술 이해
- **Not**을 쓰려면 → 경험

> AI로 학습과 실험을 가속시킬 수 있다!
-->

---

## トップダウン学習法 — Gabriel Petersson

OpenAI Sora チームの研究員、高校中退者が 6 年分の勉強を AI で圧縮した方法

- **問題・プロジェクトから始める** — 基礎理論は後回し
- **AI をチューター・第二の脳**として常に使う
- **詰まった箇所**を再帰的に掘り下げる
- 検証は試験ではなく <span class="accent">動く成果物(GitHub、デモ)</span>

> 「拡散モデルを学ぶのに <span class="accent">トップダウンなら3日、ボトムアップなら6年</span>」

<!--
[한국어 원문]
## 톱다운 학습법 — Gabriel Petersson

OpenAI Sora 팀 연구원, 고교 중퇴자가 6년치 공부를 AI로 압축한 방법

- **문제·프로젝트부터 시작** — 기초 이론은 뒤로 미룬다
- **AI를 튜터·제2의 뇌**로 상시 사용
- **막힌 지점**을 재귀적으로 파고든다
- 검증은 시험이 아니라 작동하는 결과물(GitHub, 데모)

> "디퓨전 모델을 배우는 데 톱다운이면 3일, 바텀업이면 6년"
-->

---

## ボトムアップ vs トップダウン

| 観点 | 伝統的なボトムアップ | Petersson のトップダウン |
|------|----------------------|--------------------------|
| 出発点 | 基礎数学・理論 | 実際の問題・プロジェクト |
| 順序 | 理論 → モデル → 応用 | 応用 → コード → 理論 |
| AI の位置 | しばしば禁止・カンニング扱い | チューター、ペアプログラマー |
| 認知負荷 | 抽象概念の暗記が先 | 問題コンテキストの中で習得 |
| 評価 | 試験・成績・学位 | 動くコード・成果物 |

> <span class="accent">応用から底まで降り、再び戻ってくる循環構造</span>

<!--
[한국어 원문]
## 바텀업 vs 톱다운

| 관점 | 전통 바텀업 | Petersson의 톱다운 |
|------|-------------|--------------------|
| 시작점 | 기초 수학·이론 | 실제 문제·프로젝트 |
| 순서 | 이론 → 모델 → 응용 | 응용 → 코드 → 이론 |
| AI의 위치 | 종종 금지·부정행위 | 튜터, 페어 프로그래머 |
| 인지 부하 | 추상 개념 암기 먼저 | 문제 맥락 속에서 습득 |
| 평가 | 시험·학점·학위 | 작동하는 코드·결과물 |

> 응용에서 바닥까지 내려갔다 다시 올라오는 순환 구조
-->

---

## AI にはこう質問する

> <span class="accent">ぼやけた説明ではなく、デバッグ可能な具体性まで</span>

- 「12歳に説明するように、すごく簡単に説明して」
- 「この概念を直感的な絵やグラフで描いて」
- 「すべての中間状態とテンソルの shape を見せて」
- 「確信が持てないなら、選択肢を並べて、なぜ通るかなぜ通らないか教えて」
- 「このコード大丈夫? バグありそう? もっと良い方法ある?」

> <span class="accent">意図の品質を支えているのは、結局このような学習ルーチンだ。</span>

<!--
[한국어 원문]
## AI에게 이렇게 질문하라

> 뭉뚱그린 설명이 아니라, 디버깅 가능한 구체성까지

- "12살에게 설명하듯 아주 쉽게 설명해줘"
- "이 개념을 직관적인 그림/그래프로 그려줘"
- "모든 중간 상태와 텐서 shape을 보여줘"
- "확실하지 않으면 옵션을 나열하고, 왜 되고 왜 안 되는지 알려줘"
- "이 코드 괜찮아? 버그 있을 것 같아? 더 좋은 방법 있어?"

> 의도의 품질을 받쳐 주는 것은 결국 이런 학습 루틴이다.
-->

---

<!-- _class: impact -->

### 意図を明確に
### 残りは AI に

# https://intent.roboco.io

<!--
[한국어 원문]
### 의도를 명확하게
### 나머지는 AI가

# https://intent.roboco.io
-->

---

## [広告] Challenge Driven Learning (CDL)

AI ツールの使い方ではなく、**AI と共に働くチームのやり方**を作る教育

```
AI インタビュー → 現場の課題定義 → AI と共に解決 → プロセスが組織に残る
```

- **現場のボトルネック**を直接解きながら、AI ベースの開発プロセスを体得
- 教育が終わって残るもの: ルール、エージェント、テスト戦略、ドキュメントテンプレート
- <span class="warn">個人の記憶ではなく、チームが再利用できるプロセス資産</span>

> <span class="accent">最も先進的な Vibe Coding 手法を実体験</span>

<!--
[한국어 원문]
## [광고] Challenge Driven Learning (CDL)

AI 도구 사용법이 아니라, **AI와 함께 일하는 팀의 방식**을 만드는 교육

AI 인터뷰 → 현업 문제 정의 → AI와 함께 해결 → 프로세스가 조직에 남는다

- **현업의 병목**을 직접 풀면서 AI 기반 개발 프로세스를 체득
- 교육이 끝나면 남는 것: 규칙, 에이전트, 테스트 전략, 문서 템플릿
- 개인의 기억이 아니라 팀이 재사용할 수 있는 프로세스 자산

> 가장 진보된 바이브 코딩 기법을 직접 체험
-->

---

<!-- _class: divider -->

# ご清聴ありがとうございました。

<!--
[한국어 원문]
# 경청해 주셔서 감사합니다.
-->
