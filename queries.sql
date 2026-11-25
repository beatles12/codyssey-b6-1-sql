
-- Q01. 최근 거래 5건 조회
SELECT id, member_id, amount, spent_on, memo
FROM transactions
ORDER BY spent_on DESC, id DESC
LIMIT 5;

-- Q02. 10,000원 이상 거래 중 금액이 큰 5건
SELECT id, amount, memo
FROM transactions
WHERE amount >= 10000
ORDER BY amount DESC
LIMIT 5;

-- Q03. 회원 1번의 2026년 11월 거래
SELECT id, amount, spent_on, memo
FROM transactions
WHERE member_id = 1
  AND spent_on >= '2026-11-01'
  AND spent_on < '2026-12-01'
ORDER BY spent_on DESC;

-- Q04. 메모에 '커피'가 포함된 거래
SELECT id, amount, memo
FROM transactions
WHERE memo LIKE '%커피%';

-- Q05. 거래 내역에 회원 이름과 분류 이름 연결
SELECT m.name, c.name, t.amount, t.spent_on
FROM transactions AS t
INNER JOIN members AS m ON t.member_id = m.id
INNER JOIN categories AS c ON t.category_id = c.id;

-- Q06. 식비 거래에 회원 이름 연결
SELECT m.name, t.amount, t.memo
FROM transactions AS t
INNER JOIN members AS m ON t.member_id = m.id
INNER JOIN categories AS c ON t.category_id = c.id
WHERE c.name = '식비';

-- Q07. 월별 예산에 회원 이름과 분류 이름 연결
SELECT m.name, c.name, b.month, b.limit_amount
FROM budgets AS b
INNER JOIN members AS m ON b.member_id = m.id
INNER JOIN categories AS c ON b.category_id = c.id;

-- Q08. 한 번도 거래에 사용되지 않은 카테고리
SELECT c.id, c.name
FROM categories AS c
LEFT JOIN transactions AS t ON c.id = t.category_id
WHERE t.id IS NULL;

-- Q09. 회원별 지출 합계와 거래 건수
SELECT m.name,
       COUNT(*) AS transaction_count,
       SUM(t.amount) AS total_expense
FROM transactions AS t
JOIN members AS m ON t.member_id = m.id
JOIN categories AS c ON t.category_id = c.id
WHERE c.type = 'expense'
GROUP BY m.id, m.name
ORDER BY total_expense DESC;

-- Q10. 카테고리별 평균 지출
SELECT c.name,
       AVG(t.amount) AS average_expense
FROM transactions AS t
JOIN categories AS c ON t.category_id = c.id
WHERE c.type = 'expense'
GROUP BY c.id, c.name
ORDER BY average_expense DESC;

-- Q11. 월별 수입과 지출 합계
SELECT substr(t.spent_on, 1, 7) AS month,
       c.type,
       SUM(t.amount) AS total_amount
FROM transactions AS t
JOIN categories AS c ON t.category_id = c.id
GROUP BY substr(t.spent_on, 1, 7), c.type
ORDER BY month, c.type;

-- Q12. 평균 지출 금액보다 큰 거래 조회
SELECT t.id, t.amount, t.memo
FROM transactions AS t
JOIN categories AS c ON t.category_id = c.id
WHERE c.type = 'expense'
  AND t.amount > (
      SELECT AVG(t2.amount)
      FROM transactions AS t2
      JOIN categories AS c2
        ON t2.category_id = c2.id
      WHERE c2.type = 'expense'
  )
ORDER BY t.amount DESC;

-- Q13. 거래 2번 금액을 6,000원으로 수정
UPDATE transactions
SET amount = 6000
WHERE id = 2;

-- Q14. 거래 10번 삭제
DELETE FROM transactions
WHERE id = 10;

-- Q15. 회원별 기간 검색을 위한 인덱스 생성
CREATE INDEX IF NOT EXISTS idx_transactions_member_date
ON transactions (member_id, spent_on);
