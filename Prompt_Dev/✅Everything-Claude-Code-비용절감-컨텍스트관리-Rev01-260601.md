---
category: Prompt_Dev
type: code_asset
status: Verified (Rev.01)
tags:
  - Prompt/Optimization
  - Tool/Claude-Code
  - AI/AGENTS
date: "2026-06-01"
description: Claude Code CLI를 다역할 가상 개발 팀 환경으로 구축하기 위한 Everything Claude Code 설정 레시피 분석 및 최적화
---

> [!IMPORTANT]
> **[프롬프트 & 개발]** "**Everything Claude Code**"는 Claude Code CLI를 계획, TDD, 리뷰, 문서화 등을 병렬로 수행하는 '가상 개발 팀(다역할 에이전트)'으로 변모시키는 설정 레시피다. 도구보다 프로세스를 먼저 설계하여 개발 시간을 획기적으로 단축함과 동시에, 컨텍스트 로트(Context Rot) 방지 및 모델 비용 절감을 위한 최적화 전략이 필수적이다.
> - **Everything Claude Code**는 Claude Code CLI를 역할 분리 된 가상 개발팀처럼 운영하기 위한 설정 모음이다.
> - **에이전트**, **스킬**, **슬래시** **명령**, **규칙**, **훅** 을 조합해 계획, TDD, 리뷰, 문서화를 반복 가능한 흐름으로 만든다.
> - 핵심은 도구를 많이 붙이는 것이 아니라 **필요한 맥락과 가드레일** 만 켜서 Claude가 안정적으로 일하게 하는 것이다.

# 💸 Everything Claude Code (ECC) - 비용 절감 및 컨텍스트 최적화 시스템

**Everything Claude Code**(현재 저장소명 **ECC**)는 단순한 설정 모음을 넘어, Claude Code, Cursor, Codex 등 다양한 AI 코딩 하네스(Agent Harness) 위에서 동작하는 '성능 최적화 및 에이전트 통제 시스템'입니다. 특히 대규모 작업 시 필연적으로 발생하는 컨텍스트 로트(Context Rot)를 방어하고 API 비용을 획기적으로 낮추는 데 특화되어 있습니다.

## 1. 컨텍스트 로트(Context Rot)의 구조적원인과 ECC의 방어 기제
- **현상**: 긴 컨텍스트 윈도우를 사용할수록 출력 품질이 급격히 저하되며, 이미 수정한 파일을 다시 덮어쓰거나 이전의 오류를 반복하는 '망각 현상'.
- **발생 원인**:
  - **어텐션 희석 (Attention Dilution)**: 시스템 프롬프트, 툴 결과값, 파일 내용이 누적되면서 최신 작업 지시의 가중치가 하락.
  - **지시문 충돌 (Prompt Contradiction)**: 턴(Turn)이 길어지면서 이전 지시와 새로운 지시 간의 논리적 모순 발생.
  - **토큰 예산 초과**: 초기 로드된 방대한 파일들로 인해 정작 중요한 '추론(Thinking)'이나 '코드 작성'에 쓸 가용 토큰이 고갈.
- **ECC의 해결책**: 정적 프롬프트가 아닌, `recursive-decision-ledger`와 `benchmark-optimization-loop` 같은 최적화 스킬팩을 통해 컨텍스트를 동적으로 관리하고 압축합니다.

## 2. API 비용 80% 절감을 위한 하네스 최적화 (`settings.json`)
단일 최고성능 모델(Opus)에 의존하면 토큰 비용이 기하급수적으로 증가합니다. ECC는 역할에 따른 **모델 다변화(Model Fallback & Routing)** 전략을 취합니다.
1. **메인 모델 최적화**: `model`을 Opus 대신 Sonnet(claude-3-5-sonnet 등)으로 하향 조정하여 속도와 비용 효율성 확보.
2. **사고(Thinking) 토큰 제한**: `max_thinking_tokens`를 10,000으로 강제 축소(기본 32K)하여, 불필요한 장고(과적합 추론)로 인한 토큰 낭비 방지.
3. **서브 에이전트 경량화**: `sub_agent_model` 변수를 가장 가벼운 하이쿠(Haiku)로 설정하여, 코드 리뷰나 단순 검색 같은 보조 작업의 비용을 최소화.

## 3. ECC (Everything Claude Code) 핵심 코어 시스템
ECC는 60여 개의 에이전트와 240개가 넘는 스킬을 조합하여 다음 세 가지 코어 시스템을 구동합니다.
- **Continuous Learning V2 (지속 학습 및 메모리 시스템)**: 
  - 에이전트의 작업 과정을 100% 관찰하여 성공적인 반복 패턴을 `Instinct(본능)`으로 저장합니다.
  - 누적된 행동 패턴은 재사용 가능한 `Skill`로 승격되며, 팀 간 Export/Import를 통해 지식 자산으로 공유됩니다.
- **동적 컨텍스트 제어 (명령어 툴체인)**:
  - `/clear`: 컨텍스트 오염을 막기 위해 잦은 주기로 상태를 완전 초기화.
  - `/compact`: 마일스톤(리서치 완료, 디버깅 완료 등) 단위로 지나간 대화 내역을 강력하게 요약·압축 (※ 구현 도중 사용 시 코드 상태 손실 위험).
- **AgentShield (보안 및 권한 통제)**: 에이전트에게 Bash 실행 권한이나 파일 수정 권한을 부여할 때 발생하는 리스크를 통제합니다. 훅(Hook) 인젝션 취약점 검사, 하드코딩된 시크릿 키 노출 방지, 그리고 Linter 설정 파일의 임의 수정을 원천 차단합니다.


## 4. 해커톤 우승자의 AI 개발 팀 레시피 (ECC 아키텍처)


### 4.1 Everything Claude Code: 아키텍처 및 저장소 구조
Claude를 다역할 에이전트 팀으로 운영하기 위해 필요한 맥락을 역할별 폴더로 분리하여 관리한다. 메인 세션이 PM 역할을 맡고 세부 작업은 서브 에이전트가 병렬 수행한다.

- **Agents**: 역할 특화 프롬프트 모음 (planner, code-reviewer, tdd-guide 등). 툴 권한을 최소화하여 역할 충돌 방지 및 집중도 향상.
- **Skills**: 팀 공유 업무 매뉴얼 (coding-standards, tdd-workflow 등). TDD (RED→GREEN→REFACTOR) 루프 등을 명문화.
- **Commands**: `/plan`, `/tdd`, `/code-review` 등의 슬래시 명령어로 개발 루틴 플로우를 자동화.
- **Rules**: 항상 적용되는 품질 가드레일 (security.md, testing.md 등). "커버리지 80% 미만 PR 금지" 등의 규칙을 강제.
- **Hooks**: Pre/Post ToolUse 지점의 자동화 스크립트 (디버깅 코드 방치 경고, 포맷터 실행 등).
- **MCP Configs**: GitHub, Supabase, Vercel 등 SaaS용 MCP 템플릿. 컨텍스트 창 잠식을 막기 위해 프로젝트당 10개 이하 사용 권장.

### 4.2 해커톤 우승 차별성 및 한계점
- **우승 차별성**:
  - **멀티 에이전트 병렬화**: 각 에이전트가 자신의 도메인 맥락만 다루어 응답 품질과 속도 유지 및 개발 병목 감소.
  - **표준화된 루틴 및 품질 확보**: TDD 및 테스트 퍼스트, 에러 사전 차단, AI 코드 리뷰 자기 정제 루프 형성.
  - **풀스택 자동화**: MCP 연동을 통해 AI가 리포지토리 및 배포 인프라(Vercel, Supabase 등)를 직접 조작.
- **한계점 및 개선 방향**:
  - 동적 컨텍스트 로딩 및 필요 시점별 설정 교체 기능 도입 필요 (현재는 컨텍스트 창 잠식 위험 존재).
  - Bash 권한 오남용을 막기 위한 명령 2단계 승인, `/dry-run` 샌드박스 등의 안전장치 필요.
  - JS/TS 기반 웹 외 도메인(임베디드, 데이터 과학, 모바일 등) 확장을 위한 커뮤니티 스킬 추가 필요.


## 5. 원문 종합 분석 (AI 개발 파이프라인 관점)
별첨된 원문은 Claude Code를 단순한 보조 도구가 아닌, 완전한 **'다역할 가상 개발 팀'**으로 승격시키기 위한 훌륭한 레퍼런스를 제공합니다. 이 글이 제시하는 핵심 인사이트는 다음과 같습니다.

1. **도구보다 프로세스 우선 설계 (Process Over Tools)**
   - AI 에이전트를 효과적으로 도입하려면 어떤 도구를 쓸 것인가보다 **어떤 워크플로우를 태울 것인가**가 훨씬 중요합니다. 원문은 `/plan` → `/tdd` → `/code-review` → `/update-docs` 로 이어지는 표준화된 루틴을 강조합니다.
   - 이는 개발 속도를 비약적으로 높일 뿐만 아니라, 프롬프트 엔지니어링 자체를 하나의 일관된 '시스템 운영체제(OS)' 수준으로 격상시킵니다.

2. **컨텍스트와 권한의 분리 (Separation of Concerns)**
   - 메인 세션(PM)과 서브 에이전트(Planner, Code-Reviewer, TDD-Guide 등) 간의 역할 분리는 매우 영리한 접근입니다. 각 에이전트에게 필요한 맥락(Context)과 허용된 도구(Bash, Grep 등)를 제한함으로써, 모델이 불필요한 정보에 매몰되어 환각(Hallucination)을 일으키거나 의도치 않은 시스템 조작을 하는 것을 원천 차단합니다.

3. **안전망과 가드레일 내재화 (Built-in Guardrails)**
   - Hook과 Rule을 통한 강제성(예: 커버리지 80% 미만 PR 금지, 디버깅 코드 경고)은 AI 기반 자동화에서 필수적인 '브레이크' 역할을 합니다.
   - 이는 빠른 개발 속도 이면에 숨은 품질 저하 리스크를 최소화하고, AI 스스로가 작성한 코드를 다시 점검하는 자기 정제(Self-Refining) 루프를 구축합니다.

4. **현업 도입을 위한 과제 (Next Steps)**
   - 현재 JS/TS 스택에 편중되어 있으므로, Python/Django 등 다른 스택에 맞춘 Skill 및 Pattern 확장이 필수적입니다.
   - Opus 같은 무거운 모델 사용으로 인한 높은 비용 및 토큰 고갈(Context Rot) 문제를 해결하기 위해서는, 본 문서 상단에서 언급한 `settings.json` 최적화(Sonnet 하향, 하이쿠 서브 모델 지정)가 강력한 보완재 역할을 할 수 있습니다.

## 관련 문서 및 출처
- [[✅클로드코드와-옵시디언을-활용한-LLM-위키-구축]]
- **원문 출처**: [Everything Claude Code - 해커톤 우승자의 AI 개발 팀 레시피](https://roboco.io/posts/everything-claude-code-distilled/)
- **Everything Claude Code 깃허브**: [affaan-m/everything-claude-code](https://github.com/affaan-m/everything-claude-code)

---
## [별첨] Blog 원문 클리핑: Everything Claude Code

```text
Everything Claude Code - 해커톤 우승자의 AI 개발 팀 레시피
“AI를 팀으로 받아들이려면, 도구보다 프로세스를 먼저 설계해야 한다.” – Anthropic x Forum Ventures 해커톤 우승자 Affaan Mustafa


정도현 - 로보코 수석 컨설턴트
Everything Claude Code는 Claude Code CLI를 가상 개발 팀 환경으로 변모시키는 설정 모음집이다. 해커톤 우승자가 10개월 동안 실제 스타트업 제품을 만들며 다듬은 레시피가 공개 저장소 한 곳에 모였고, 이를 적용하면 Claude를 “시니어 엔지니어 + QA + 아키텍트”로 호출할 수 있다.1 리포지토리는 GitHub에서 누구나 확인할 수 있다.

Everything Claude Code

이 글은 레포지토리 구조, Claude API 활용 방식, 기술 스택, 그리고 해커톤 우승으로 이어진 차별성을 한눈에 정리한 기술 리포트다. 마지막에는 현재 한계와 개선 아이디어도 덧붙였다.

TL;DR
Everything Claude Code는 Claude Code CLI를 역할 분리된 가상 개발 팀처럼 운영하기 위한 설정 모음이다.
에이전트, 스킬, 슬래시 명령, 규칙, 훅을 조합해 계획, TDD, 리뷰, 문서화를 반복 가능한 흐름으로 만든다.
핵심은 도구를 많이 붙이는 것이 아니라 필요한 맥락과 가드레일만 켜서 Claude가 안정적으로 일하게 하는 것이다.
1. 프로젝트 개요
Everything Claude Code는 “Claude를 다역할 에이전트 팀으로 운영하라”는 명확한 철학으로 설계됐다.1 메인 세션이 프로젝트 매니저 역할을 맡고, 세부 작업은 다양한 서브 에이전트가 병렬로 수행한다. 작성자는 이 구성으로 2025년 9월 Anthropic x Forum Ventures 해커톤에서 zenith.chat을 완전히 Claude Code만으로 개발해 우승했다는 실전 사례도 공유했다.2

핵심 가치 제안은 세 가지다.

역할 분리: 역할별 프롬프트, 툴 권한, 톤을 분리해 LLM 집중도를 높인다.
프로세스 표준화: /plan, /tdd, /code-review 같은 슬래시 명령으로 개발 루틴을 자동화한다.
품질 가드레일: 규칙·스킬·훅을 조합해 보안, 테스트, 스타일을 강제한다.
이 철학을 토대로 저장소 전체는 “AI가 프로젝트 히스토리를 학습하고 도구를 직접 실행하는” 완성형 개발 파이프라인을 구성한다.

2. 저장소 구조와 아키텍처
레포지토리는 Claude Code에 필요한 맥락을 역할별 폴더로 분리해 관리한다. 실제 사용자는 필요한 파일을 자신의 ~/.claude 혹은 프로젝트 루트의 .claude로 복사해 활성화한다.

2.1 Agents
agents/는 역할 특화 프롬프트 모음이다. planner, architect, code-reviewer, security-reviewer, tdd-guide, build-error-resolver, e2e-runner, refactor-cleaner, doc-updater 등이 대표적이다.2 각 파일은 YAML 프런트매터로 모델(opus), 허용 툴(Read, Grep, Bash 등), 설명을 정의하고, 본문에는 역할별 지침을 담는다. 툴을 최소화해 집중도를 높이고, 에이전트 간 역할 충돌을 막는 것이 설계의 핵심 관점이다.

2.2 Skills
skills/는 팀이 공유하는 업무 매뉴얼이다. coding-standards.md, backend-patterns.md, frontend-patterns.md, security-review/, tdd-workflow/ 등이 포함된다.2 특히 tdd-workflow는 RED→GREEN→REFACTOR 루프와 커버리지 80% 요구사항을 상세히 명시해 Claude가 테스트 주도 개발을 자동으로 상기하도록 만든다. 스킬은 전사 공통(~/.claude/skills)과 프로젝트 전용(.claude/skills)으로 분리해 운영할 수 있다.

2.3 Commands
commands/에는 /plan, /tdd, /e2e, /code-review, /build-fix, /refactor-clean, /test-coverage, /update-docs 등 슬래시 명령 프롬프트가 있다.2 사용자는 대화창에서 명령만 입력하면, 해당 절차에 맞춘 프롬프트가 로딩되고 필요한 스킬·에이전트가 호출된다. 덕분에 “기능 계획 → TDD 실행 → 코드 리뷰 → 문서 동기화” 같은 일련의 개발 플로우를 버튼처럼 실행할 수 있다.

2.4 Rules
rules/는 항상 적용되는 가드레일이다. security.md, coding-style.md, testing.md, git-workflow.md, agents.md, performance.md, patterns.md, hooks.md 등으로 모듈화돼 있으며 Claude Code는 이 폴더의 모든 규칙을 시스템 프롬프트에 자동 삽입한다. 예를 들어 testing.md는 “커버리지 80% 미만 PR 금지” 규칙을 명시해 모델이 테스트 생략을 허용하지 않도록 한다.

2.5 Hooks
hooks/hooks.json은 Pre/Post ToolUse 지점에서 실행할 자동화 스크립트를 정의한다. 예시는 TypeScript 파일 편집 후 console.log가 남아있으면 경고하는 훅, 세션 종료 전 포맷터를 돌리는 훅 등이다.2 Hook matcher로 툴 이름·파일 패턴을 지정하고, Bash 명령이나 추가 명령을 실행하도록 구성한다. 반복적인 실수(디버깅 코드 방치, 테스트 누락 등)를 자동 감시하는 안전망 역할을 한다.

2.6 MCP 설정
mcp-configs/는 GitHub, Supabase, Vercel, Railway, ClickHouse 등 다수의 MCP 서버 설정 템플릿을 제공한다.1 사용자들은 필요한 항목을 ~/.claude/settings.json에 붙여 넣고 API 키를 채우면 Claude가 직접 해당 서비스 API를 호출할 수 있다. README는 “활성 MCP는 프로젝트당 10개 이하, 전체 툴은 80개 이하”라는 가이드도 제공한다. 지나친 MCP 활성화는 컨텍스트 창을 잠식해 모델 성능을 떨어뜨리기 때문이다.

2.7 Plugins & Examples
plugins/는 Claude Skills Marketplace와 외부 플러그인 설치법을 안내하는 문서 집합이다. examples/ 폴더에는 프로젝트 수준(CLAUDE.md)과 사용자 수준(user-CLAUDE.md) 설정 예시, 커스텀 statusline.json 등이 포함돼 있어 신규 사용자가 그대로 복사해 시작할 수 있다. 결과적으로 저장소 전체가 “레퍼런스 구현 + 템플릿” 역할을 겸한다.

3. Claude API 활용 원칙
Everything Claude Code가 강조하는 AI 활용 원칙은 다음 네 가지로 요약된다.

멀티 에이전트 병렬화
메인 세션이 큰 방향을 잡고 세부 작업은 서브 에이전트가 위임받아 수행한다. 각 에이전트는 자신의 도메인 맥락만 다루므로 응답 품질과 속도가 안정적으로 유지된다.1

TDD·테스트 퍼스트
/tdd 명령과 tdd-workflow 스킬을 통해 RED→GREEN→REFACTOR 사이클을 강제하고, testing.md 규칙으로 커버리지 80% 이상을 요구한다. Claude는 기능 요청을 받으면 테스트 추가 필요성을 항상 상기시킨다.

보안·품질 가드레일
security.md는 비밀키 하드코딩 금지, 입력 검증, 에러 처리, 취약 라이브러리 검사 등을 명문화한다. /code-review 명령과 code-reviewer 에이전트는 AI가 작성한 코드도 다시 AI가 리뷰하도록 만들어 자기 정제 루프를 형성한다.

컨텍스트 예산 관리
MCP·규칙·스킬·도구가 많을수록 시스템 프롬프트가 비대해지므로, README는 “필요한 설정만 활성화할 것”을 반복 강조한다.2 프로젝트별 최소 구성으로 집중력을 유지하는 것이 Claude 활용 효율을 결정한다.

이 원칙 때문에 Claude Code는 단순한 코드 자동완성 도구가 아니라, 프롬프트 엔지니어링 + 워크플로 엔진으로 기능한다.

4. 사용 기술 스택과 도구 체인
Everything Claude Code 자체는 Markdown·JSON 기반 설정집이지만, 그 배경에는 다음과 같은 스택이 깔려 있다.

Anthropic Claude Code CLI: 시스템 프롬프트를 조합하고 LLM과 툴 호출을 중개하는 런타임. 최신 Opus/Sonnet 모델을 지원한다.
MCP 서버 묶음: GitHub, Supabase, Vercel, Railway, ClickHouse 등 주요 SaaS용 MCP 템플릿을 제공해 Claude가 직접 API를 호출할 수 있게 한다.1
테스트 & 품질 도구: /e2e 커맨드는 Playwright 실행을 전제로 설계돼 있고, testing.md는 Jest/Vitest 등 JS 테스팅 스택을 내재화하고 단언하고 있다. /build-fix는 Node/Vite 빌드 오류를 다루도록 짜여 있다.
프론트엔드/백엔드 패턴: frontend-patterns.md에는 React/Next.js 지침, backend-patterns.md에는 API·DB·캐싱 베스트 프랙티스가 정리되어 있다. clickhouse-io.md처럼 특정 데이터 기술에 대한 스킬도 존재한다.
즉, 저장소는 “언어/프레임워크-중립”을 표방하지만 첫 번째 타깃은 TypeScript 기반 풀스택 웹 제품이다. 다른 언어나 도메인에 쓰려면 추가 스킬을 작성해야 한다.

5. 해커톤 우승으로 이어진 차별성
해커톤에서 Everything Claude Code가 발휘한 경쟁력은 다섯 가지로 정리할 수 있다.

역할 병렬화: 설계·구현·테스트를 서로 다른 에이전트가 동시에 처리해 개발 병목을 줄였다.
표준화된 개발 루틴: /plan → /tdd → /code-review → /update-docs 순서가 자동화돼 기능별 사이클이 짧고 일정했다.
풀스택 자동화: MCP 덕분에 Claude가 GitHub 이슈, Supabase 쿼리, Vercel 배포 등을 직접 수행해 사람은 제품 로직에만 집중했다.3
훅 기반 안전장치: console.log 제거, 테스트 누락 경고 같은 훅이 실수를 초기에 잡아 품질을 유지했다.
전투 검증된 노하우: 작성자가 실무에서 반복 검증한 프롬프트/규칙을 담았기에 ‘한 번 써본 통찰’이 아니라 ‘다듬어진 프레임워크’였다.
이 조합 덕분에 짧은 시간에도 높은 품질을 유지하는 “AI 주도 팀”이 구현됐고, 그것이 해커톤에서 차별화 요소로 작동했다.

6. 기술적 한계와 개선 방향
아무리 완성도가 높아도 여전히 해결할 과제는 존재한다.

컨텍스트 창 한계
MCP·규칙·스킬을 과도하게 켜면 Claude의 사용 가능 토큰이 줄어들어 장기 세션에서 맥락 손실이 발생한다. 동적 컨텍스트 로딩이나 필요 시점별 설정 교체 기능이 향후 보완 포인트다.

모델 비용과 가용성
Opus 모델은 느리고 비용이 높다. 사용량이 많을수록 부담이 커지므로, Sonnet이나 타 모델로의 자동 폴백 전략이 필요하다. Anthropic 외 모델을 꽂을 수 있는 추상화 레이어도 고민할 만하다.

온보딩 난도
에이전트·스킬·훅 개념을 모두 이해해야 하기에 초기 학습 곡선이 높다. 대화형 설정 마법사나 GUI 기반 설정 관리가 있다면 도입 장벽을 낮출 수 있다.

도메인 편중
현재 스킬은 JS/TS 웹 서비스에 최적화돼 있다. 임베디드, 데이터 과학, 모바일 등 다른 도메인용 스킬/명령을 커뮤니티가 계속 추가해야 범용 프레임워크가 된다.

실행 안전성
Bash 권한이 주어진 에이전트가 잘못된 명령을 실행할 리스크는 여전히 존재한다. 명령 2단계 승인, 샌드박스 모드, /dry-run 명령 같은 보호 장치가 향후 필요한 이유다.

성능 최적화
모든 작업을 AI가 설명하며 실행하면 속도가 느려질 수 있다. 응답 캐싱이나 에이전트 간 결과 공유 같은 최적화가 없으면 “빠르게 코딩” 경험과 거리가 생긴다.

7. 맺음말
Everything Claude Code는 단순한 설정 파일 모음이 아니라 AI와 함께 일하는 방식을 설계한 운영체제에 가깝다. 역할 단위 프롬프트, 테스트 중심 규칙, 훅 기반 자동화, MCP 연동이 결합하면서 “AI를 어떻게 팀원으로 쓸 것인가”라는 질문에 구체적인 답을 제시한다. 동시에, 컨텍스트 관리·온보딩·도메인 확장 같은 과제도 분명하다. 이 레포지토리를 자신의 프로젝트에 이식하면서 조직의 프로세스와 도메인 지식을 덧입히는 순간, AI는 더 이상 보조 도구가 아니라 지속 가능한 개발 파트너가 된다.
```

## 별첨.2 (GitHub 원문 클리핑)
> 원문 출처: [affaan-m/ECC (everything-claude-code)](https://github.com/affaan-m/everything-claude-code)

```text
The harness-native operator system for agentic work. Built from real-world multi-harness engineering workflows.
Not just configs. A complete system: skills, instincts, memory optimization, continuous learning, security scanning, and research-first development. Production-ready agents, skills, hooks, rules, MCP configurations, and legacy command shims evolved over 10+ months of intensive daily use building real products.
Works across Codex, Claude Code, Cursor, OpenCode, Gemini, Zed, GitHub Copilot, and other AI agent harnesses.

ECC v2.0.0-rc.1 adds the public Hermes operator story on top of that reusable layer.

This repo is the raw code only. The guides explain everything.

- Dashboard GUI — New Tkinter-based desktop application (ecc_dashboard.py or npm run dashboard) with dark/light theme toggle, font customization, and project logo in header and taskbar.
- Public surface synced to the live repo — metadata, catalog counts, plugin manifests, and install-facing docs now match the actual OSS surface: 63 agents, 249 skills, and 79 legacy command shims.
- Operator and outbound workflow expansion — brand-voice, social-graph-ranker, connections-optimizer, customer-billing-ops, ecc-tools-cost-audit, google-workspace-ops, project-flow-ops, and workspace-surface-audit round out the operator lane.
- Media and launch tooling — manim-video, remotion-video-creation, and upgraded social publishing surfaces make technical explainers and launch content part of the same system.
- Ecosystem hardening — AgentShield, ECC Tools cost controls, billing portal work, and website refreshes continue to ship around the core plugin instead of drifting into separate silos.
```

## 원본 개요
1. **매체**: 기타 아티클 / **날짜**: 2026-06-01
2. **주제**: Claude Code CLI를 다역할 가상 개발 팀 환경으로 구축하기 위한 Everything Claude Code 설정 레시피 분석 및 최적화
3. **원문 링크**: [원문 바로가기](https://github.com/affaan-m/everything-claude-code)
4. **Raw-Data 출처**: Raw-Data/Everything-Claude-Code-비용절감-컨텍스트관리-Rev01-260601.md
5. **분석 초점**: AI 기술 도입 타당성 및 신사업 기회 발굴
6. **핵심 사례**: 해당 리포트 본문 참조
7. **자료 성격**: 기술 요약 및 비즈니스 인사이트

