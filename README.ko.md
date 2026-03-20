# n8n-ops

[English](./README.md)

셀프 호스팅 `n8n` 인스턴스를 운영하고 디버깅하기 위한 이식 가능한 스킬 및 레퍼런스 모음입니다.

이 저장소는 사람을 위한 저장소 문서를 루트에 두고, 실제 스킬 payload는 중첩된 [n8n-ops](./n8n-ops) 디렉터리에 따로 둡니다. 이렇게 하면 저장소 메타데이터를 섞지 않고 다양한 에이전트 환경으로 스킬 폴더만 복사할 수 있습니다.

## 구조

```text
n8n-ops/
├── README.md
├── README.ko.md
└── n8n-ops/
    ├── SKILL.md
    ├── agents/
    ├── references/
    └── scripts/
```

## 이 스킬이 하는 일

- 공식 Public API를 사용한 셀프 호스팅 `n8n` 워크플로 조회 및 수정
- 실패한 실행 이력 분석 및 안전한 재시도
- 공식 credential schema 및 메타데이터 조회를 통한 크리덴셜 관리 가이드
- `n8n` MCP 노출 및 실행 사용 시점 안내
- 불안정한 `/rest/*` 엔드포인트에 대한 명시적 opt-in fallback 가이드

## 설계 원칙

- 워크플로, 실행, 크리덴셜 관련 작업의 source of truth는 `Public API`
- `MCP`는 노출된 워크플로 탐색 및 실행을 위한 보조 수단
- `/rest/*`는 불안정한 내부 인터페이스로 간주하며 명시적 허용 시에만 사용
- secret 값은 꼭 필요한 경우가 아니면 다시 출력하지 않음

## 설치

안쪽 [n8n-ops](./n8n-ops) 폴더를 각 에이전트의 skill 위치로 복사하면 됩니다.

- Codex: `~/.codex/skills/n8n-ops`
- Claude Code: `.claude/skills/n8n-ops`
- Gemini CLI / OpenCode: `.agents/skills/n8n-ops`

## 기본 사용법

번들 스크립트나 문서화된 API 절차를 사용하기 전에 환경 변수를 설정합니다.

```bash
export N8N_BASE_URL="https://n8n.example.com"
export N8N_API_KEY="your-api-key"
```

스크립트 사용 예시:

```bash
./n8n-ops/scripts/list_workflows.sh '?limit=10'
./n8n-ops/scripts/get_workflow.sh WORKFLOW_ID
./n8n-ops/scripts/list_failed_executions.sh '?status=error&limit=10'
./n8n-ops/scripts/list_credentials.sh '?limit=5'
./n8n-ops/scripts/get_credential.sh CREDENTIAL_ID
./n8n-ops/scripts/get_credential_schema.sh googleDriveOAuth2Api
```

## 예시 프롬프트

안쪽 스킬 폴더를 설치한 뒤 아래와 같은 프롬프트로 시작할 수 있습니다.

- `Use $n8n-ops to inspect workflow VP7vIk5u_lZXpvNWx5yew and tell me why it fails.`
- `Use $n8n-ops to compare the latest failed execution with the saved workflow and suggest a minimal fix.`
- `Use $n8n-ops to check whether this webhook workflow is ready to be exposed through MCP.`

## 저장소 관련 메모

- [README.md](./README.md)는 저장소 방문자를 위한 문서입니다
- [n8n-ops](./n8n-ops)가 실제로 배포 가능한 스킬 루트입니다
- 스킬 내부에는 의도적으로 추가 README 같은 저장소 전용 문서를 넣지 않았습니다
