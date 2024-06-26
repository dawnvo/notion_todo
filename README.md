![cover](./assets/guide/cover.png)

# Notion Todo

간단하게 일정을 관리하고 노션과 연동할 수 있어요.

<br/>

## 기능 설명

- [+] 누르면 TASK 추가
- [+] 길게 누르면 ROUTINE 추가
- 항목을 좌측으로 스와이프 하고 [삭제] 누르면 삭제
- 우측 상단 [동기화] 누르면 노션 DB에 동기화

<br/>

## 사용 방법

### 0. 사전 안내

- Android만 지원해요. (iOS는 테스트 못했어요)
- 노션을 연결하는 과정이 번거로워요.

<br/>

### 1. 다운로드

먼저 [Notion Todo 앱](https://github.com/yeonvora/notion-todo/releases/tag/v1.0.0-beta)을 다운로드 해요.

![download-app](./assets/guide/a1-download-apk.png)

<br/>

### 2. Notion API 설정

2-1. [Notion Integrations](https://www.notion.so/my-integrations)에 접속해 로그인한 후, [새 API 통합 만들기]를 누르세요.

![my-integrations](./assets/guide/b1-my-integrations.png)

2-2. 다음과 같이 설정 후 [제출]을 누르세요.

![create-api](./assets/guide/b2-create-api.png)

2-3. 생성된 API의 `시크릿 토큰`을 복사해요.

![copy-secret-key](./assets/guide/b3-copy-secret-key.png)

<br/>

### 3. 데이터베이스 설정

3-1. [Notion Todo 데이터베이스](https://yeonvora.notion.site/fcb5a6d8c4b14367a53054c09628e9f1?v=8e1cc0ebd81140cf94735c6122d0bf5d)를 자신의 워크스페이스에 복제해요.

![copy-database](./assets/guide/c1-copy-database.png)

3-2. 방금 만든 API를 복제한 데이터베이스에 연결해요.

![copy-database-id](./assets/guide/c2-connect-my-api.png)

3-3. [공유]를 누르고 `데이터베이스 ID` 부분을 복사해요.

![copy-database-id](./assets/guide/c3-copy-database-id.png)

<br/>

### 4. 설정 완료

지금까지 발급받은 `시크릿 토큰`과 `데이터베이스 ID`를 입력해 [설정하기]를 누르면 사전 설정이 끝납니다.

![cover](./assets/guide/a2-setup.png)
