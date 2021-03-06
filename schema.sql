CREATE DATABASE birthday_article;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  firstname VARCHAR(100),
  lastname VARCHAR(100),
  birth_year INTEGER,
  birth_month INTEGER,
  birth_day INTEGER,
  email VARCHAR(400),
  password_digest VARCHAR(100)
);

CREATE TABLE bookmarks (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  article_id TEXT,
  guest_name VARCHAR(100),
  FOREIGN KEY (user_id) REFERENCES users (id) on DELETE CASCADE
);

ALTER TABLE users ADD COLUMN color VARCHAR(100);