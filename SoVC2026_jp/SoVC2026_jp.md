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
  .warn { color: var(--red); text-shadow: 0 0 6px rgba(255, 68, 68, 0.4); }
  .amber { color: var(--amber); text-shadow: 0 0 6px rgba(255, 170, 0, 0.4); }
  .dim { color: var(--comment); }
---

# State of Vibe Coding 2026

> 意図だけが残る

---

## 発表者紹介

ジョン・ドヒョン
- ROBOCO 主席コンサルタント
- 30年目のソフトウェアエンジニア
- 2016〜2024年、Amazonでソフトウェアエンジニア・テクニカルトレーナーとして勤務
- 2024年末にVibe Codingの可能性を確信し、2026年にROBOCOを創業
- 現在は企業のAIトランスフォーメーションをコンサルティングしている

---

## 今日お話しすること

- 2026年4月、Vibe Codingの現在地
- AIの能力の伸びと、その意味
- **ルールと好み**をどこで分けるか
- 仕様、実装、ハーネスはどう抽象化されていくか
- **Intent Engineering** — なぜ最終的には意図だけが残るのか
- その流れがすでに現実となっている事例 — OpenClaw、oh-my-claudecode
- では今、何から始めるか

---

<!-- _class: divider -->

# 2026年4月、Vibe Codingの現在地

---

## Vibe CodingはAIトランスフォーメーションの一部だ

> もっと大きな何かが起きている

- コード生成はAIトランスフォーメーションの**一部分**にすぎない
- 仕様、テスト、デプロイ、モニタリング、学習まで一緒に変わってきている
- <span class="accent">ソフトウェア開発の全工程がAIとともに再編されつつある</span>

---

<!-- _class: divider -->

# AIの能力は指数関数的に
# 伸び続けている

---

## METR: AIタスク遂行時間のホライズン

<div style="display: flex; gap: 32px; align-items: center;">
<div style="flex: 1; min-width: 0;">

- 扱える作業範囲が**7か月ごとに2倍**に伸びている
- このトレンドが続けば、2029年までに人間が**1か月かかる作業**もAIが遂行
- 同時に伸びている3つ:
  - **知能** — より複雑な推論と判断
  - **記憶力** — より大きなコンテキストウィンドウ
  - **ツール使用** — ブラウザ、ターミナル、API

<span class="dim" style="font-size: 16px;">出典: metr.org/time-horizons</span>

</div>
<div style="flex: 1; min-width: 0;">

![METR Time Horizons](metr-graph.png)

</div>
</div>

---

## この成長が意味すること

私たちはすでに指数関数的な上昇サイクルに入っている

- 実装可能な範囲は関数単位を超え、システム単位になった
- 仕様の作成は?
- ガードレールは?

> では、人間とAIの境界線はどこにあるのか?

---

<!-- _class: divider -->

# ルールと好みを区別せよ

---

## ルール: 組織全体に強制される必須事項

- ビルド/テストゲート — 抜けるとバグを見逃す
- Git安全ルール — マルチエージェントでの作業衝突を防ぐ
- セキュリティ境界 — シークレットのコミット、本番データの使用を禁止
- アーキテクチャ境界 — import、package、公開APIの制限
- 高リスクな変更 — 認証、決済、DBスキーマは手動レビュー必須

> <span class="accent">ルールはチーム/組織/会社のレベルで強制されなければならない。</span>

---

## 好み: 別のやり方でもいいもの

- セミコロン、空白、trailing comma
- 命名と import の並び順
- コメントスタイル
- 抽象化のタイミング
- feature-based vs layer-based の構造

---

<!-- _class: divider -->

# 結局、意図だけが残る

---

## 仕様、実装、ハーネス — 好みの問題か?

| 領域 | 性格 | AI時代の位置づけ |
|------|------|-----------------|
| **仕様(Spec)** | What から導出可能 | AIが生成 |
| **実装(How)** | 技術選定 + コーディング | AIの領域 |
| **ハーネス(ガードレール)** | ルールの自動化 | ルール + スキル |
| **テスト** | 検証の自動化 | AIが生成 + CIが強制 |
| **デプロイ** | パイプライン | CDが自動実行 |

> 好みの余地は一部だけ。
> <span class="accent">だから最後まで人が握っていなければならないのは How ではなく意図だ。</span>

---

<!-- _class: impact -->

## 最後まで人が握っているべきものは?

---

## Vibe Coding と XY 問題

XY 問題: 問題(X)ではなく、先に思いついた解法(Y)を固定してしまうこと

- 「ビルドを通して」 → AI が**テストを削除する**

> AIは意図を推論するが、<span class="warn">意図が明確でないと、誤った解法を採用してしまう。</span>

---

## 鍵は意図を明確に伝えること

> 意図エンジニアリング:
> 最小限の労力で **意図** を明確に伝えること

コード生成、検証、デプロイのコストが下がるほど、
残る希少資源は**「何を、なぜ作るのか」** — つまり <span class="accent">意図</span> だ。

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

---

<!-- _class: divider -->

###  コードを見ない開発は可能か?

# すでに現実だ

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

---

## oh-my-claudecode: 意図ベースのマルチエージェント・オーケストレーション

意図を渡すだけで、専門エージェントが順に処理する:

```
意図の伝達
  → explore (コードベース探索)
    → research (調査)
      → plan (実装計画の策定)
        → implement (コーディング)
          → verify (検証)
            → commit (コミット)
```

- 探索からコミットまで自動化されたパイプライン
- 役割が分かれた専門エージェントが各段階を担当
- <span class="accent">すでにプロダクションのワークフローとして稼働中</span>

---

<!-- _class: divider -->

# では、どう始めるか

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

---

## 既存プロジェクトを Vibe Coding へ — Vibe Coding 準備の3ステップ

```
[1] コードベース分析  →  [2] ドキュメント + スキル  →  [3] ハーネス構築
    暗黙知 → 明示知       ルール・反復の抽出           行動境界の自動化
```

- 一度で完成させない — 小さな領域から繰り返す
- 各ステップを AI と一緒に進める
- 3ステップが回ることで <span class="accent">組織の Vibe Coding 資産</span> が積み上がる

---

## ステップ 1 — コードベース分析

> AI にまずコードベースを理解させる

- **構造と依存関係** — モジュール境界、公開API、ビルドグラフ
- **ドメイン言語** — 用語、モデル、不変条件
- **暗黙のお約束** — 命名、レイヤー、エラーハンドリングのスタイル
- **リスクポイント** — 認証、決済、スキーマ変更

> <span class="accent">AI が先に読み、人が検証する。</span>
> 分析結果は次のステップの入力になる。

---

## ステップ 2 — ドキュメント + スキル生成

分析結果を AI が毎回読み返せる形で残す

- **CLAUDE.md / AGENTS.md** — 組織ルール、ビルド/テストゲート、禁止事項
- **ドメインドキュメント** — Why/What/Not ベースの INTENT、用語集
- **スキル(Skills)** — 反復作業を再利用可能な手順として抽出
  - 例: API エンドポイント追加、マイグレーション生成、デプロイ手順

> <span class="accent">スキルを通じて、ドキュメントは人と AI に常時コンテキストを供給する</span>

---

## ステップ 3 — ハーネス構築

> ルールをコードで強制する

- **フック(Hooks)** — 危険コマンドの遮断、コミット前ゲート
- **CI ゲート** — ビルド、テスト、リント、型チェック
- **権限ポリシー** — ファイル/ツール/ネットワークのアクセス許可リスト
- **サブエージェントの分離** — 役割ごとの権限とコンテキストの分離

> <span class="warn">ハーネスがなければ、意図はガイドラインに留まる。</span>
> <span class="accent">ハーネスがあって初めて、AI は自律的に、かつ安全に働ける。</span>

---

## 意図の品質

意図の品質だけは、人の理解に依存している。

- **Why** を書くには → <span class="accent">ドメイン理解</span>
- **What** を書くには → <span class="accent">技術理解</span>
- **Not** を書くには → <span class="accent">経験</span>

> AI で学習と実験を加速できる!

---

## トップダウン学習法 — Gabriel Petersson

OpenAI Sora チームの研究員、高校中退者が 6 年分の勉強を AI で圧縮した方法

- **問題・プロジェクトから始める** — 基礎理論は後回し
- **AI をチューター・第二の脳**として常に使う
- **詰まった箇所**を再帰的に掘り下げる
- 検証は試験ではなく <span class="accent">動く成果物(GitHub、デモ)</span>

> 「拡散モデルを学ぶのに <span class="accent">トップダウンなら3日、ボトムアップなら6年</span>」

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

---

## AI にはこう質問する

> <span class="accent">ぼやけた説明ではなく、デバッグ可能な具体性まで</span>

- 「12歳に説明するように、すごく簡単に説明して」
- 「この概念を直感的な絵やグラフで描いて」
- 「すべての中間状態とテンソルの shape を見せて」
- 「確信が持てないなら、選択肢を並べて、なぜ通るかなぜ通らないか教えて」
- 「このコード大丈夫? バグありそう? もっと良い方法ある?」

> <span class="accent">意図の品質を支えているのは、結局このような学習ルーチンだ。</span>

---

<!-- _class: impact -->

### 意図を明確に
### 残りは AI に

# https://intent.roboco.io

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

---

<!-- _class: divider -->

# ご清聴ありがとうございました。
