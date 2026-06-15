# Wiki-Insight (LLM-Wiki Vercel Deployment)

이 저장소(폴더)는 옵시디언 기반의 **AI 신사업 위키(LLM-Wiki)**에서 에이전트가 새롭게 창출한 프롬프트, 분석 리포트, 그리고 HTML 슬라이드 발표자료가 영구 자산으로 저장되는 공간입니다. 

Vercel을 통해 정적 웹사이트로 배포되어, 위키에서 생성된 HTML 슬라이드 및 각종 인사이트 문서를 웹 상에서 열람할 수 있도록 구성되어 있습니다.

## 📂 폴더 및 파일 구조 (Directory Structure)

```text
Wiki-Insight/
├── index.html (기본 포탈 메인 페이지)
├── index-by-Claude-Sonnet.html (Claude Sonnet 버전 포탈)
├── index-by-Gemini-Flash-Pro.html (Gemini Flash Pro 버전 포탈)
├── 🔮html-발표자료-종합-아카이브-MOC.md (발표자료 MOC 인덱스)
│
├── Business_Models/ (비즈니스 모델 분석 및 인사이트)
│   ├── 그리스-디자이너와-할머니-추억을-압착한-올리브유-발표자료.html
│   ├── 더-컨쿼러-100만-명-발표자료.html
│   ├── 레벨스헬스-혈당-스파이크를-분석하는-앱-발표자료.html
│   ├── 블랙썬더-30년-역전극-발표자료.html
│   ├── 스크럽대디-5000억-부활의-비밀-발표자료.html
│   ├── 스타벅스코리아-리스크매니지먼트-발표자료.html
│   ├── 카바-CAVA-1조원-브랜딩-발표자료.html
│   ├── 투비-B급OTT-발표자료.html
│   └── 퍼거슨-리더십-발표자료.html
│
├── Idea_Insights/ (인물 사전 및 트렌드 인사이트)
│   ├── 가브리엘-피터슨-발표자료.html
│   ├── 바이브시대-카페사장-발표자료.html
│   ├── 안드레-카파시-인물-발표자료.html
│   └── 안유진-멀티페르소나-발표자료.html
│
├── Prompt_Dev/ (프롬프트 및 개발 가이드)
│   └── (.md 파일은 .gitignore 정책에 의해 배포에서 제외됨)
│
└── Tech_Infra/ (기술 및 인프라 구축)
    ├── LLM-Wiki-철학과-구현-발표자료.html
    └── 안드레-카파시-에이전트-엔지니어링-발표자료.html
```

## 🌐 Vercel 배포 시 주요 진입점 (Entry Points)

- **`index.html`**: Vercel 배포 시 최초로 접속되는 메인 포탈 페이지입니다.
- **포탈 인덱스**: `index-by-Claude-Sonnet.html` 및 `index-by-Gemini-Flash-Pro.html`을 통해 카테고리별 발표자료에 시각적으로 접근할 수 있습니다.
- **프레젠테이션 (HTML)**: `발표자료.html`로 끝나는 파일들은 LLM-Wiki에서 자동 생성된 고품질 슬라이드 형태의 자료입니다. 웹 환경에서 즉시 열람 및 프레젠테이션 진행이 가능합니다.

## 📝 관리 원칙 (Rule-04: Assetization)

이 폴더는 AI 신사업 위키의 [AGENTS.md] **Rule-04: Assetization** 원칙에 따라 특별히 분리 관리됩니다.
- 원본 데이터의 1차적인 미러링 공간인 `Wiki-Pages/`와 철저히 분리하여, 새로운 가치가 창출된 **자산화 문서(인사이트, 자동화, 발표자료)**만 영구 보관합니다.
- 비마크다운 에셋(HTML 등) 생성 시 **3단계 프록시 인덱싱(MOC + 2종의 포탈 인덱스 업데이트)**이 의무화되어 있어, 어떠한 지식 자산도 위키 내에서 고립(Orphan)되지 않도록 관리되고 있습니다.
