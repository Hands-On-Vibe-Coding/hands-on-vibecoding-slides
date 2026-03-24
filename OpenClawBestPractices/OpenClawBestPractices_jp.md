---
marp: true
title: "OpenClaw: 世界最大のバイブコーディングプロジェクトから学ぶベストプラクティス"
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
## 世界最大のバイブコーディングプロジェクトから学ぶベストプラクティス

チョン・ドヒョン — ROBOCO.IO

---

<!-- _class: impact -->

# バイブコーディングを
# 本番環境で使えるのか？

---

<!-- _class: impact -->

## GitHubスター *33万個*。
## コントリビューター *1,200人+*。
## マージされたPR *23,000件+*。

使えるかどうかではなく、すでに使われている。

---

# OpenClawとは何か

- セルフホスティング型パーソナルAIアシスタント
- WhatsApp、Telegram、Discord、Slackなど**15以上のチャネル**に接続
- TypeScriptモノレポ、**30万+ LOC**、Fork **6.4万+**
- オーストリアの開発者 **Peter Steinberger** がAIエージェントで構築

---

<!-- _class: impact -->

## 注目すべきはここだ。
## これを*たった一人で*作った。

---

# Steinbergerのワークフロー

- ターミナルで **Codex CLI 3〜8個**を同時実行
- 同じフォルダで並列作業
- 2026年1月、1ヶ月で **6,600件以上のコミット**
- まるで20人チームのようなペース

---

<!-- _class: impact -->

## プロンプトはどんどん短くなった。
## 今は *1〜2文 + スクリーンショット1枚*。

入力の半分がスクリーンショットだ。

---

<!-- _class: accent -->

# どうやったら
# こんなことが可能なのか？

---

<!-- _class: impact -->

# 最も重要なのは
# *AGENTS.md*

---

# AGENTS.mdとは何か

- コードベースで作業する**すべてのAIエージェント向けの指示書**
- `CLAUDE.md`は同じファイルへのシンボリックリンク
- AIがミスするたびにルールを追加して段階的に構築

> 「組織の傷跡の集合体（organizational scar tissue）」
> — Steinberger

---

# AGENTS.mdに何を書くか

- ビルド/テストコマンド: `pnpm build`、`pnpm test`
- Gitルール: Conventional Commits、`git pull --rebase`
- **マルチエージェント安全ルール**
  - stash禁止、ブランチ切り替え禁止
  - 見知らぬ変更を発見 → 他のエージェントの作業と見なす
- セキュリティ境界: 実際の電話番号、本番設定値のコミット禁止

---

<!-- _class: impact -->

## 口伝の知識を
## *機械が読み取れる*
## 組織の記憶に変える。

---

<!-- _class: accent -->

# 9つのベストプラクティス

---

# 1. 生きたAGENTS.mdを維持せよ

AIエージェントがミスするたびにルールを追加せよ。

Steinbergerのファイルは **約800行**。
Git規約、テスト、アーキテクチャ、マルチエージェント調整がすべて含まれている。

---

# 2. Research → Plan → Implement

いきなり実装するな。

- **Research**: 「authモジュールを読んでセッションの動作を説明して」
- **Plan**: 「修正するファイルと変更内容を書いて」
- **Implement**: 計画をレビューしてから実装

> *「計画段階で誤解を見つけるコストは、*
> *連鎖エラーのデバッグより10倍安い。」*

---

# 3. Conventional Commitsを強制せよ

`fix(telegram): resolve TypeError in status command`

- AIエージェントが履歴を理解でき
- 自動チェンジログ生成も可能になる
- *機械解析可能な履歴*

---

<!-- _class: impact -->

# 4. AIエージェントを
# *ジュニアエンジニア*のように扱え

---

> 「以前チームを率いたことがある。
> 配下に多くのソフトウェアエンジニアがいた。
> あの時も、自分の望む通りのコードを
> 彼らが書かないことを受け入れなければならなかった。」
>
> — Steinberger

---

# 人間 vs エージェントの役割

**人間がやるべきこと：**
システムアーキテクチャ、テイスト（動くだけの解法 vs 優雅な解法）、セキュリティ設計

*エージェントに任せること：*
実装、ボイラープレート、スキャフォールディング、リファクタリング

---

# 5. 並列エージェントの調整ルール

同じフォルダで複数エージェントが同時作業可能。ただし：

- 編集前に `git status` / `git diff` を確認
- **アトミックなコミット**
- **stash禁止、ブランチ切り替え禁止**
- 見知らぬ変更 = 他のエージェントの作業

*ソロプレイ → マルチプレイオーケストレーション*

---

# 6. AI PRは透明な第一級市民

- AI使用の有無を**公開**
- テストレベルを**明示**: untested / lightly / fully tested
- **プロンプトやセッションログ**を添付
- 生成されたコードを**理解していること**を確認

> "AI PRs are first-class citizens here.
> We just want transparency."
>
> — AIによるPRを排除するのではなく、透明性を求めるだけだ。

---

# 7. テイストが不要なものはすべて自動化

- 自動ラベリング、自動応答、コードレビューボット
- stale Issue管理、シークレット検出
- デッドコード分析、重複チェック

**人間はアーキテクチャと品質判断に集中。**
残りは自動化するかエージェントに委任。

---

# 8. 介入するときと任せるときを区別せよ

**AIに任せよ：**
スキャフォールディング、UIコンポーネント、ボイラープレート、探索

*自ら介入せよ：*
認証、決済、DBスキーマ、API権限、セキュリティ全般

AIは「見た目は完璧だが微妙なバグがある」コードを生成する。
**すべての変更後、必ずテストせよ。**

---

# 9. プロンプトに制約条件をアンカーせよ

- 「**50行以内**で書いて」
- 「ファイル全体ではなく**修正した関数だけ**」
- 「決済フローだけ。**authには触るな**」
- 「`UserService.ts`の**既存パターン**に従え」

*曖昧なプロンプト = 曖昧な結果*

---

<!-- _class: accent -->

# ここまでの実践を踏まえて

---

<!-- _class: impact -->

## バイブコーディングは
## エンジニアリング規律を *捨てること* ではなく
## **再配置すること** だ。

---

# Steinbergerの学習曲線

2025年6月 — 詳細な仕様書を作成
2025年後半 — スクリーンショット中心の短いプロンプト
2026年現在 — 最小限の監督で **3〜8個の並列エージェント** を運用

すべてのバイブコーダーがたどることになる学習曲線だ。

---

<!-- _class: impact -->

## コードを自分で書くスキルから、
## *コードを書くシステムを*
## *設計するスキル*へ。

---

# 今日すぐできること

`AGENTS.md`（または `CLAUDE.md`）を作れ。

1. AIがミスするたびにルールを追加せよ
2. ビルドコマンド、Gitルール、セキュリティ境界を書け
3. チームの暗黙知を機械が読める形に変えよ

> **「組織の傷跡の集合体」**
> — これが最も強力なツールになる。

---

<!-- _class: accent -->

# ありがとうございました

チョン・ドヒョン — ROBOCO.IO
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
