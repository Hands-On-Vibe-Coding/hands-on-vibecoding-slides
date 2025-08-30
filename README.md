# Hands-On Vibe Coding Slides

AI 협업 개발 방법론 "바이브 코딩(Vibe Coding)"에 대한 프레젠테이션 자료 모음입니다.

## 📁 디렉토리 구조

- **`secuiry/`** - 보안 중심 바이브 코딩 슬라이드 (보안 자동화, 취약점 스캔)
- **`devops/`** - DevOps 관점의 바이브 코딩 슬라이드 (CI/CD, 인프라 자동화)
- **`donga/`** - 동아대학교 발표 자료 (학생 대상 AI 코딩 교육)
- **`ausg/`** - AUSG 발표 자료 (AWS 사용자 그룹)

## 🚀 빠른 시작

### 전체 빌드
```bash
make all  # 모든 슬라이드를 PDF, PPTX, HTML로 생성
```

### 디렉토리별 빌드
```bash
make secuiry  # secuiry 디렉토리의 모든 형식 생성
make devops   # devops 디렉토리의 모든 형식 생성
make donga    # donga 디렉토리의 모든 형식 생성
make ausg     # ausg 디렉토리의 모든 형식 생성
```

### 형식별 빌드
```bash
make pdf   # 모든 슬라이드를 PDF로 생성
make pptx  # 모든 슬라이드를 PPTX로 생성
make html  # 모든 슬라이드를 HTML로 생성
```

### 미리보기
```bash
make preview security  # 브라우저에서 security 슬라이드 미리보기
make preview devops    # 브라우저에서 devops 슬라이드 미리보기
```

## 🛠 필수 도구

- **[Marp CLI](https://github.com/marp-team/marp-cli)** - Markdown 슬라이드 변환
  ```bash
  npm install -g @marp-team/marp-cli
  ```

- **[draw.io](https://www.drawio.com/)** - 다이어그램 생성 (선택사항)
  ```bash
  # macOS
  brew install --cask drawio
  ```

## 📝 슬라이드 작성

각 디렉토리의 Markdown 파일(`.md`)을 편집하여 슬라이드를 작성합니다.
Marp 문법을 사용하여 슬라이드를 구성합니다.

### Marp 기본 문법
```markdown
---
marp: true
theme: default
paginate: true
---

# 제목 슬라이드

---

## 내용 슬라이드

- 항목 1
- 항목 2
```

## 🎨 다이어그램

`secuiry/diagrams/` 디렉토리의 `.drawio` 파일들은 자동으로 SVG로 변환됩니다:
```bash
make diagrams  # 모든 다이어그램을 SVG로 변환
```

## 📚 추가 명령어

```bash
make help        # 사용 가능한 모든 명령어 보기
make list-files  # 사용 가능한 슬라이드 목록 보기
make clean       # 생성된 파일 정리
```

## 🔗 관련 링크

- [Vibe Coding 개념](https://github.com/Hands-On-Vibe-Coding)
- [Marp 문서](https://marpit.marp.app/)
- [draw.io 사용법](https://www.drawio.com/doc/)

## 📄 라이선스

이 프로젝트의 슬라이드 자료는 교육 목적으로 자유롭게 사용할 수 있습니다.