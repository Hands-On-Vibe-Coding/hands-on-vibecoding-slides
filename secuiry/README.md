# Security-Focused Vibe Coding

보안 관점에서의 바이브 코딩 방법론을 다루는 프레젠테이션 자료입니다.

## 📋 내용

### 주요 주제
- **AI 지원 보안 코딩**: AI를 활용한 안전한 코드 작성
- **자동화된 취약점 스캔**: CI/CD 파이프라인의 보안 게이트
- **보안 인증 프로세스**: 코드 리뷰와 보안 검증 워크플로우
- **실시간 협업 보안**: AI와 함께하는 보안 코드 리뷰

### 다이어그램
- `vibe-coding-flow`: 바이브 코딩의 전체 플로우
- `ci-security-gate`: CI/CD 보안 게이트 구조
- `certification-process`: 보안 인증 프로세스

## 🚀 빌드 방법

```bash
# 이 디렉토리의 모든 형식 생성
make secuiry

# 개별 형식 생성
make secuiry/security.pdf
make secuiry/security.pptx
make secuiry/security.html

# 다이어그램 업데이트
make diagrams-security
```

## 📁 파일 구조

```
secuiry/
├── security.md         # 메인 슬라이드 소스
├── security.pdf        # PDF 출력
├── security.pptx       # PowerPoint 출력
├── security.html       # HTML 출력
└── diagrams/          # 다이어그램 소스
    ├── *.drawio       # draw.io 원본 파일
    └── *.svg          # 변환된 SVG 파일
```

## 🎯 대상 청중

- 보안 엔지니어
- DevSecOps 실무자
- 보안을 고려하는 개발자
- AI 도구를 활용하는 보안 전문가

## 💡 핵심 메시지

"AI와 함께하는 개발에서도 보안은 타협할 수 없는 기본 원칙입니다.
바이브 코딩은 보안을 개발 프로세스에 자연스럽게 통합합니다."

## 🔗 관련 자료

- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [GitHub Security Features](https://github.com/features/security)
- [AWS Security Best Practices](https://aws.amazon.com/security/best-practices/)