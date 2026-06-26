# 🔮 Wiki-Insight: LLM-Wiki Dual Deployment Portal

<p align="center">
  <img src="https://img.shields.io/badge/Deployment-Vercel%20%26%20GitHub%20Pages-blueviolet?style=for-the-badge&logo=vercel" alt="Deployment">
  <img src="https://img.shields.io/badge/Frontend-Three.js%20%26%20VanillaJS-00f0ff?style=for-the-badge&logo=three.js" alt="ThreeJS">
  <img src="https://img.shields.io/badge/Automation-PowerShell-blue?style=for-the-badge&logo=powershell" alt="PowerShell">
  <img src="https://img.shields.io/badge/Version-v1.0.0--First%20Release-magenta?style=for-the-badge" alt="Version">
</p>

---

## 🌌 개요 (Overview)

**Wiki-Insight**는 옵시디언(Obsidian) 기반의 **AI 신사업 위키(LLM-Wiki)**에서 에이전트와 인간 협업을 통해 창출한 핵심 비즈니스 프롬프트, 분석 보고서 및 고품질 HTML 발표자료 슬라이드를 영구적인 지식 자산으로 관리하고 공유하기 위한 정적 아카이브 저장소입니다.

**GitHub Pages**와 **Vercel**의 2-Track 정적 호스팅을 활용한 **이중 배포(Dual Deployment)** 환경을 제공하며, 사용자는 Three.js 3D 그래픽 기술을 적용한 미래지향적 메인 포탈 인터페이스를 통해 복잡한 폴더 경로 없이 카테고리별 발표자료를 역동적이고 빠르게 열람할 수 있습니다.

---

## 🏛️ 핵심 아키텍처 및 철학 (Core Philosophy)

> [!NOTE]
> 본 저장소는 단순한 문서 백업을 넘어 **"지식의 완전한 자산화"** 및 **"오프라인 단독 구동 보장"**을 목표로 설계되었습니다.

### 1. Rule-04: Assetization (자산화 원칙)
- 원본 텍스트 데이터의 미러링 공간인 `Wiki-Pages/`와 물리적으로 분리되어 운영됩니다.
- 새로운 가치가 생성되거나 정제된 산출물(인사이트 보고서, 자동화 템플릿, 발표자료 슬라이드 등)만을 영구 보관 대상으로 지정합니다.
- HTML 슬라이드의 경우 위키 내에서 단절되지 않도록 **3단계 프록시 인덱싱 정책(MOC 파일 등록 + 메인 포탈 링크 매핑 + 서브 포탈 링크 매핑)**을 준수합니다.

### 2. Zero-External-Dependency (로컬 이미지 자산화)
- 기존 HTML 슬라이드 내부의 이미지들은 롱블랙 CDN, S3, 유튜브 썸네일, 포털 뉴스 등 외부 웹 서버의 경로를 참조하고 있어 네트워크 장애나 CDN 삭제 시 엑스박스(Broken Link)가 발생할 리스크가 있었습니다.
- 이를 해결하기 위해 **PowerShell 기반 이미지 로컬라이징 파이프라인**을 적용하여, **총 132개(실제 파일 개수 기준)**의 이미지를 프로젝트 로컬 에셋(`Assets/`)으로 완벽히 다운로드받고 HTML 내 경로를 상대 경로(`../Assets/...`)로 변환 완료하였습니다.

### 3. 2-Track Dual Deployment (이중 배포)
- 개발 브랜치의 커밋 및 푸시 시 **GitHub Actions + Pages** 및 **Vercel** 빌드 파이프라인을 통과하여 인터넷이 연결된 어디서나 접근이 가능한 고가용성 공유 웹 환경을 유지합니다.

---

## 📂 폴더 구조 및 발표자료 매핑 (Directory & Slide Maps)

하위 디렉토리 내의 개발 프로세스용 `.md` 파일은 비공개 정책에 따라 `.gitignore` 처리가 되어 있으며, 배포용 정적 자산인 `.html`과 루트 인덱스 문서들만 원격 저장소에 추적/배포됩니다.

```text
Wiki-Insight/
├── index.html                     # Three.js 3D 기반 메인 포탈 페이지
├── index-by-Claude-Sonnet.html    # Claude Sonnet 디자인 포탈 페이지
├── index-by-Gemini-Flash-Pro.html # Gemini Flash Pro 디자인 포탈 페이지
├── 🔮html-발표자료-종합-아카이브-MOC.md # 옵시디언 그래프 뷰용 통합 인덱스 Node
│
├── Business_Models/               # 도메인 1: 비즈니스 모델 발표자료
├── Idea_Insights/                 # 도메인 2: 아이디어 & 인사이트 발표자료
├── Tech_Infra/                    # 도메인 3: 기술 및 인프라 발표자료
│
└── Assets/                        # 로컬 자산화 이미지 에셋 보관소
    ├── Business_Models/
    ├── Idea_Insights/
    └── Tech_Infra/
```

### 📋 발표자료 상세 인벤토리 (총 20건)

| 도메인 | 한글 발표자료 제목 | 배포용 파일 경로 | 자산화 이미지 수 | 상태 |
| :--- | :--- | :--- | :---: | :---: |
| **Business Models** | 이야이야앤프렌즈 브랜딩 - 발표자료 | [그리스-디자이너와-할머니-추억을-압착한-올리브유-발표자료.html](./Business_Models/그리스-디자이너와-할머니-추억을-압착한-올리브유-발표자료.html) | 8 | ✅ 완료 |
| | 더 컨쿼러 — 100만 명을 뛰게 한 경험 설계 | [더-컨쿼러-100만-명-발표자료.html](./Business_Models/더-컨쿼러-100만-명-발표자료.html) | 5 | ✅ 완료 |
| | 레벨스 헬스(Levels Health) — 데이터 맥락화 비즈니스 전략 | [레벨스헬스-혈당-스파이크를-분석하는-앱-발표자료.html](./Business_Models/레벨스헬스-혈당-스파이크를-분석하는-앱-발표자료.html) | 6 | ✅ 완료 |
| | 블랙썬더 — 30년 역전극의 브랜드 전략 | [블랙썬더-30년-역전극-발표자료.html](./Business_Models/블랙썬더-30년-역전극-발표자료.html) | 8 | ✅ 완료 |
| | 스타벅스코리아 리스크 매니지먼트 — 무엇을 놓쳤는가 | [스타벅스코리아-리스크매니지먼트-발표자료.html](./Business_Models/스타벅스코리아-리스크매니지먼트-발표자료.html) | 6 | ✅ 완료 |
| | 카바(CAVA) — 1조원 상장사의 지중해식 브랜딩 | [카바-CAVA-1조원-브랜딩-발표자료.html](./Business_Models/카바-CAVA-1조원-브랜딩-발표자료.html) | 7 | ✅ 완료 |
| | 투비(Tubi) — B급 OTT의 파괴적 혁신 | [투비-B급OTT-발표자료.html](./Business_Models/투비-B급OTT-발표자료.html) | 8 | ✅ 완료 |
| **Idea & Insights** | 이정문 화백 — 1965년에 예측한 2000년대 | [1965년에-예측한-2000년대-이정문-화백-발표자료.html](./Idea_Insights/1965년에-예측한-2000년대-이정문-화백-발표자료.html) | 5 | ✅ 완료 |
| | 가브리엘 피터슨 — 21세기 아키텍트형 인재 | [가브리엘-피터슨-발표자료.html](./Idea_Insights/가브리엘-피터슨-발표자료.html) | 1 | ✅ 완료 |
| | 바이브시대 — 카페사장이 AI와 공존하는 법 | [바이브시대-카페사장-발표자료.html](./Idea_Insights/바이브시대-카페사장-발표자료.html) | 9 | ✅ 완료 |
| | 안드레 카파시 — AI 패러다임의 나침반 | [안드레-카파시-인물-발표자료.html](./Idea_Insights/안드레-카파시-인물-발표자료.html) | 1 | ✅ 완료 |
| | 안유진 — 멀티 페르소나 브랜드 전략 | [안유진-멀티페르소나-발표자료.html](./Idea_Insights/안유진-멀티페르소나-발표자료.html) | 7 | ✅ 완료 |
| | 양자컴퓨팅과 암호화폐 미래 시나리오 | [양자컴퓨팅-암호화폐-미래-시나리오-발표자료.html](./Idea_Insights/양자컴퓨팅-암호화폐-미래-시나리오-발표자료.html) | 5 | ✅ 완료 |
| | 퓨처캐스트: 이란-미국 종전 이후의 미래 시나리오 | [이란-미국-종전이후-미래예측-발표자료.html](./Idea_Insights/이란-미국-종전이후-미래예측-발표자료.html) | 4 | ✅ 완료 |
| | 코스피 9000 반도체 편중 미래 시나리오 | [코스피-9000-반도체-편중-미래-시나리오-발표자료.html](./Idea_Insights/코스피-9000-반도체-편중-미래-시나리오-발표자료.html) | 4 | ✅ 완료 |
| | 퍼거슨 리더십 — 위대한 팀을 만드는 비밀 | [퍼거슨-리더십-발표자료.html](./Idea_Insights/퍼거슨-리더십-발표자료.html) | 17 | ✅ 완료 |
| | 스크럽대디 — 5000억 부활의 비밀 | [스크럽대디-5000억-부활의-비밀-발표자료.html](./Idea_Insights/스크럽대디-5000억-부활의-비밀-발표자료.html) | 5 | ✅ 완료 |
| **Tech & Infra** | LLM-Wiki 철학과 구현 — 검색을 넘어 축적으로 | [LLM-Wiki-철학과-구현-발표자료.html](./Tech_Infra/LLM-Wiki-철학과-구현-발표자료.html) | 3 | ✅ 완료 |
| | 안드레 카파시 — AI Ascent 2026 인터뷰 완전정리 | [안드레-카파시-에이전트-엔지니어링-발표자료.html](./Tech_Infra/안드레-카파시-에이전트-엔지니어링-발표자료.html) | 3 | ✅ 완료 |
| | 마크다운을 버려라 — AI 출력의 진화 법칙 | [마크다운-버리고-HTML로-AI출력의-진화-발표자료.html](./Tech_Infra/마크다운-버리고-HTML로-AI출력의-진화-발표자료.html) | 2 | ✅ 완료 |
---

## 🌐 포탈 3종 및 아카이브 MOC (Entry Points)

### 🪐 1. 3D Web Portal (`index.html`)
- **Three.js** 3D 라이브러리를 사용해 무한한 우주 공간과 디지털 정보 링이 공존하는 **퓨처리스틱 컨셉**의 UI를 자랑합니다.
- 동적 애니메이션(Torus Knot 회전, Orbitting Rings, Floating Cubes)과 실시간 통계 카운터(발표자료 개수, 도메인 개수 자동 연동)가 구현되어 있습니다.

### 🎨 2. LLM-specific Sub-portals
- `index-by-Claude-Sonnet.html`: Claude Sonnet 에이전트가 최적의 구조로 고안한 서브 포탈 레이아웃입니다.
- `index-by-Gemini-Flash-Pro.html`: Gemini Flash Pro 에이전트가 시각적 통계와 유연한 링크 배치를 적용한 서브 포탈 레이아웃입니다.

### 🔮 3. Obsidian MOC Index Node (`🔮html-발표자료-종합-아카이브-MOC.md`)
- 웹 배포에서 예외 처리되어 깃에 연동되는 **옵시디언 전용 프록시 문서**입니다. 그래프 뷰 상에서 고립될 수 있는 HTML 파일들의 연결 고리 역할을 하며, 마크다운 링크를 통해 즉각 로컬 HTML 파일을 호출할 수 있습니다.

---

## ⚙️ 이미지 자산화 파이프라인 가이드 (Maintenance Guide)

새로운 슬라이드 발표자료를 위키에 추가하고 이미지를 로컬 자산화하려면 아래의 프로세스를 활용하십시오.

### 1. `image_links.json` 업데이트
새롭게 추가할 HTML 파일 경로와 내부 외부 이미지 URL 링크를 추가합니다.
```json
[
  {
    "File": "새로운-발표자료.html",
    "Src": "https://external-domain.com/image-path.png"
  }
]
```

### 2. 자산화 스크립트 실행
파워쉘 환경에서 `download_assets.ps1`을 실행합니다.
```powershell
.\download_assets.ps1
```
- 본 스크립트는 `image_links.json`을 읽고 해당 파일이 위치한 도메인(폴더)을 자동 인식하여 `Assets/[Domain]/` 디렉토리를 생성합니다.
- 이미지를 순차적으로 다운로드(`[파일명]_img[번호].[확장자]`)하고, HTML 코드 내 이미지 주소를 로컬 경로(`../Assets/[Domain]/...`)로 자동 업데이트합니다.

---

## 📝 릴리즈 노트 (Release Notes)

### 🚀 v1.3.0 (2026-06-22) - "Inventory Clean-up & Structure Optimization"
- **발표자료 인벤토리 및 정합성 갱신**: 사용자 요청 및 분류 체계 조정에 따라 발표자료 5건 삭제(1인 개발자, AI 대체 못하는 사람, 클로드 코드 800시간, 일일 주식시황 2건) 및 카테고리 재분류(퍼거슨 리더십, 스크럽대디 -> Idea & Insights, 마크다운 버리기 -> Tech & Infra)를 반영하여 상세 인벤토리를 총 20건으로 동기화 완료.
- **이미지 에셋 정리**: 삭제된 슬라이드에 해당하던 이미지 리소스를 제거하고 잔여 이미지 상대 경로 정합성을 복구 완료.
- **Wiki-Meta/ 폴더 폐지 대응**: `Wiki-Meta/` 내 파일들의 루트 이관에 따라 README 및 아카이브 내 연관 경로 참조를 최종 갱신 완료.

### 🚀 v1.2.0 (2026-06-20) - "Additional Slide Ingestion & Local Assetization"
- **신규 발표자료 10건 추가 배포**: 1인 개발자 성공법칙, 1965년 이정문 화백 예측, AI 대체 불가능 인재(신재식), 주식시황 뉴스분석, 양자컴퓨팅 미래 시나리오, 이란-미국 종전 예측, 코스피 9000 반도체 편중 미래 시나리오, 마크다운 버리기 등 총 10건의 HTML 발표자료를 추가하고 MOC 및 3D 포탈에 싱크 완료.
- **로컬 이미지 자산화 고도화**: 추가된 발표자료의 이미지들을 에셋 폴더 구조(`Assets/Idea_Insights/` 등)로 이동 및 상대 경로 전환을 완료하여 총 132개 로컬 에셋 이미지 동기화 완료.
- **Obsidian MOC 노드 동기화**: [🔮html-발표자료-종합-아카이브-MOC.md](./🔮html-발표자료-종합-아카이브-MOC.md)에 25개 에셋의 파일 링크와 판단 근거 등을 완벽하게 갱신하여 지식망의 정합성 유지.

### 🚀 v1.0.0 (2026-06-16) - "Knowledge Assetization & Dual Deployment"

**프로젝트의 첫 공식 릴리즈를 기록합니다.** 본 릴리즈는 파편화된 외부 정적 슬라이드 문서들을 통합 포탈 아키텍처로 엮어내고, 의존성을 완벽하게 배제하여 지식의 영구 소장 가치를 극대화한 이정표입니다.

#### 🌟 Key Features
- **3D 메인 포탈 서비스 런칭**: Three.js WebGL 기반의 인터랙티브 반응형 메인 포탈(`index.html`) 구축 완료.
- **15건의 정적 발표자료 배포망 완성**: Business Models(9), Idea Insights(4), Tech Infra(2) 등 도메인별 분류 완료 및 이중 배포망(Vercel & GitHub Pages) 정상 가동.
- **이미지 로컬 자산화 파이프라인 구축**: `download_assets.ps1` 및 `image_links.json` 매핑 체계를 완성하여 총 105개 웹 이미지 자산을 로컬 디렉토리로 동기화 완료.
- **Rule-04: Assetization 설계 적용**: 개발용 리포트와 최종 배포용 산출물을 물리적으로 격리하는 `.gitignore` 설정 및 MOC 프록시 노드(`🔮html-발표자료-종합-아카이브-MOC.md`) 구조 설계.

#### 🔧 Improvements & Fixed
- **완전 오프라인 실행 보장**: 외부 웹 이미지 주소에 의존하지 않고 로컬 `Assets/` 디렉토리를 바라보도록 전체 15개 HTML 슬라이드 업데이트.
- **Three.js 성능 최적화**: 3,500개의 별자리 입자 필드 및 다중 광원 쉐이딩 연산을 최적화하여 저성능 장치에서도 60fps 보장.
