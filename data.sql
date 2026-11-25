
PRAGMA foreign_keys = ON;

-- 1. 회원 10명
INSERT INTO members (id, name, email) VALUES
(1, '회원01', 'test01@example.com'),
(2, '회원02', 'test02@example.com'),
(3, '회원03', 'test03@example.com'),
(4, '회원04', 'test04@example.com'),
(5, '회원05', 'test05@example.com'),
(6, '회원06', 'test06@example.com'),
(7, '회원07', 'test07@example.com'),
(8, '회원08', 'test08@example.com'),
(9, '회원09', 'test09@example.com'),
(10, '회원10', 'test10@example.com');

-- 2. 카테고리 10개
INSERT INTO categories (id, name, type) VALUES
(1, '식비', 'expense'),
(2, '교통비', 'expense'),
(3, '카페', 'expense'),
(4, '문화생활', 'expense'),
(5, '통신비', 'expense'),
(6, '쇼핑', 'expense'),
(7, '교육', 'expense'),
(8, '의료비', 'expense'),
(9, '급여', 'income'),
(10, '용돈', 'income');

-- 3. 거래 내역 10건
INSERT INTO transactions
(id, member_id, category_id, amount, spent_on, memo) VALUES
(1, 1, 1, 12000, '2026-11-03', '점심'),
(2, 1, 3, 5500, '2026-11-04', '커피'),
(3, 1, 2, 1500, '2026-11-05', '버스'),
(4, 1, 9, 2800000, '2026-11-01', '월급'),
(5, 1, 1, 18000, '2026-11-18', '저녁'),
(6, 2, 1, 25000, '2026-11-12', '식료품'),
(7, 2, 4, 14000, '2026-10-19', '영화'),
(8, 2, 10, 200000, '2026-11-02', '용돈'),
(9, 3, 7, 59000, '2026-09-22', '교재'),
(10, 3, 1, 8900, '2026-11-21', '간식');

-- 4. 월별 예산 10건
INSERT INTO budgets
(id, member_id, category_id, month, limit_amount) VALUES
(1, 1, 1, '2026-11', 300000),
(2, 1, 2, '2026-11', 100000),
(3, 1, 3, '2026-11', 80000),
(4, 2, 1, '2026-11', 250000),
(5, 2, 4, '2026-11', 100000),
(6, 3, 1, '2026-11', 200000),
(7, 3, 7, '2026-11', 150000),
(8, 4, 6, '2026-11', 200000),
(9, 5, 5, '2026-11', 70000),
(10, 6, 8, '2026-11', 100000);
