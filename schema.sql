
-- SQLite 외래키 검사 활성화
PRAGMA foreign_keys = ON;

-- 1. 사용자 테이블
CREATE TABLE IF NOT EXISTS members (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE
);

-- 2. 카테고리 테이블
CREATE TABLE IF NOT EXISTS categories (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    type TEXT NOT NULL CHECK (type IN ('income', 'expense')),
    UNIQUE (name, type)
);

-- 3. 거래 내역 테이블
CREATE TABLE IF NOT EXISTS transactions (
    id INTEGER PRIMARY KEY,
    member_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    amount INTEGER NOT NULL CHECK (amount > 0),
    spent_on TEXT NOT NULL,
    memo TEXT,
    FOREIGN KEY (member_id) REFERENCES members(id),
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- 4. 월별 예산 테이블
CREATE TABLE IF NOT EXISTS budgets (
    id INTEGER PRIMARY KEY,
    member_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    month TEXT NOT NULL,
    limit_amount INTEGER NOT NULL CHECK (limit_amount >= 0),
    FOREIGN KEY (member_id) REFERENCES members(id),
    FOREIGN KEY (category_id) REFERENCES categories(id),
    UNIQUE (member_id, category_id, month)
);