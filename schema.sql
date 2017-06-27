-- WARNING! Speak to Joe or Matt first. CASCADE is very very dangerous.

\connect test

DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users (
  ID SERIAL PRIMARY KEY,
  TOKEN VARCHAR(255) NOT NULL,
  NAME VARCHAR(255) NOT NULL,
  EMAIL VARCHAR(255) NOT NULL,
  PHONE VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS saved_queries CASCADE;
CREATE TABLE saved_queries (
  ID SERIAL PRIMARY KEY,
  API_ID INT REFERENCES apis (ID),
  ARGUMENTS TEXT NOT NULL,
  USER_ID INT REFERENCES users (ID),
  CREATED_AT TIMESTAMP NOT NULL
);

DROP TABLE IF EXISTS apis CASCADE;
CREATE TABLE apis (
  ID SERIAL PRIMARY KEY,
  NAME varchar(255)
);

DROP TABLE IF EXISTS words CASCADE;
CREATE TABLE words (
  ID SERIAL PRIMARY KEY,
  API_ID INT REFERENCES apis (ID),
  WORD TEXT NOT NULL
);
