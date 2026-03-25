# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Marp 기반 프레젠테이션 슬라이드 모음 저장소. 각 하위 디렉토리가 독립적인 발표 자료(덱)이며, Markdown으로 작성하고 Marp CLI로 PDF/PPTX/HTML을 생성한다.

## Build System

Marp CLI (`marp`)가 필수. `npm install -g @marp-team/marp-cli`로 설치.

```bash
make all                  # 모든 덱을 PDF, PPTX, HTML로 빌드
make pdf / pptx / html    # 특정 포맷만 전체 빌드
make <디렉토리명>          # 특정 디렉토리만 빌드 (e.g., make SoVC2025)
make preview <name>       # 브라우저 미리보기 (e.g., make preview security)
make diagrams             # draw.io → SVG 변환 (secuiry/diagrams/)
make clean                # 생성된 파일 삭제
make list-files           # 감지된 덱 목록 출력
```

빌드 출력물(*.pdf, *.pptx, *.html)은 .gitignore에 등록되어 있으므로 커밋하지 않는다.

## Slide Deck Structure

각 덱은 `<디렉토리>/<이름>.md` 형태. Marp frontmatter(`marp: true`, `theme`, `paginate`, `size: 16:9` 등)로 시작하고, `---`로 슬라이드를 구분한다.

| 디렉토리 | 주제 |
|-----------|------|
| `SoVC2025/` | State of Vibe Coding 2025 |
| `SELU/` | 바이브 코딩을 이용한 SW 엔지니어링 레벨 업 |
| `SELU_jp/` | SELU 일본어 버전 |
| `secuiry/` | 보안 중심 바이브 코딩 (draw.io 다이어그램 포함) |
| `devops/` | DevOps 관점 바이브 코딩 |
| `donga/` | 동아대학교 발표 |
| `ausg/` | AUSG(AWS 사용자 그룹) 발표 |
| `AIDrivenStudy/` | AI 기반 학습 |
| `ClaudeCodeIsABeast/` | Claude Code 소개 |
| `PlatformEngineeringOnViebCodeing/` | 플랫폼 엔지니어링 × 바이브 코딩 |

## Diagrams

`secuiry/diagrams/` 에 draw.io 파일(`.drawio`)이 있으며, `make diagrams`로 SVG 변환. draw.io Desktop 앱 필요 (`brew install --cask drawio`). secuiry 덱의 HTML 빌드 시 다이어그램이 자동 의존성으로 처리된다.

## Conventions

- 슬라이드 Markdown 편집 시 Marp 문법을 따른다 (Marpit 기반).
- `secuiry`는 오타가 아닌 기존 디렉토리명이므로 그대로 유지한다.
- 라이선스: CC BY-NC 4.0 (비상업적 이용만 허용).
