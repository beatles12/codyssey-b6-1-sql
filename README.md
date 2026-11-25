
# CODYSSEY B6-1 용돈 기입장 데이터베이스

## 1. 프로젝트 소개
B2-1 용돈 기입장을 관계형 데이터베이스로 확장한
SQL 학습 프로젝트입니다.

SQLite를 이용해 회원, 카테고리, 거래, 예산 정보를
저장하고 조회·조인·집계·수정·삭제 기능을 구현했습니다.

## 2. 사용 기술
- SQLite
- SQL
- Python 표준 라이브러리 sqlite3 (실행용)

## 3. 데이터베이스 구조

| 테이블 | 역할 |
|---|---|
| members | 회원 정보 |
| categories | 수입·지출 분류 |
| transactions | 거래 내역 |
| budgets | 월별 예산 |

모든 테이블은 기본키(PK)를 가지며,
거래와 예산 테이블은 외래키(FK)로
회원 및 카테고리와 연결됩니다.

## 4. 파일 구성
- schema.sql : 테이블 및 제약조건 생성
- data.sql : 샘플 데이터 40건 입력
- queries.sql : 필수 SQL 15개
- results/sql-results.txt : SQL 실행 결과

## 5. SQL 구현 내용
- Q01~Q04 : 기본 조회
- Q05~Q08 : INNER JOIN, LEFT JOIN
- Q09~Q11 : COUNT, SUM, AVG, GROUP BY
- Q12 : 서브쿼리
- Q13 : UPDATE
- Q14 : DELETE
- Q15 : CREATE INDEX

## 6. 실행 환경 및 방법

- OS: Windows
- DB: SQLite 3.50.4
- 실행 도구: Python 내장 sqlite3

프로젝트 폴더에서 PowerShell을 실행합니다.

아래 명령어는 메모리에 임시 DB를 생성하므로
기존 budget.db를 변경하지 않습니다.

```powershell
py -c "import sqlite3,pathlib; d=sqlite3.connect(':memory:'); [d.executescript(pathlib.Path(f).read_text(encoding='utf-8')) for f in ('schema.sql','data.sql')]; q=[s for s in pathlib.Path('queries.sql').read_text(encoding='utf-8').split(';') if s.strip()]; [d.execute(s) for s in q]; print('PASS:',len(q),'SQL queries'); d.close()"
```

정상 실행 시 다음 메시지가 출력됩니다.

PASS: 15 SQL queries

각 SQL의 상세 실행 결과는
results/sql-results.txt에서 확인할 수 있습니다.

외래키 검사는 schema.sql의
PRAGMA foreign_keys = ON으로 활성화합니다.

## 7. 테스트 결과
- 테이블 4개 생성 성공
- 각 테이블 데이터 10건 입력 성공
- SQL 15개 실행 성공
- 존재하지 않는 외래키 참조 차단 확인
- UPDATE, DELETE, INDEX 정상 동작 확인

## 8. 설계 원칙
- 공식 미션 요구사항 우선
- 불필요한 프레임워크 사용 금지
- SQL과 데이터 관계에 집중
- 원본 데이터를 보호하면서 테스트
