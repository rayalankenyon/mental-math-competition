-- GRKenyon APR 11 2017
-- Create math schema for Pogram 3 math web app
DROP SCHEMA IF EXISTS math CASCADE ;
CREATE SCHEMA math;

CREATE TABLE math.competitor (
	username VARCHAR(32) PRIMARY KEY,
	password VARCHAR(256),
	score INT DEFAULT 0,
	current_question INT DEFAULT 1
);

INSERT INTO math.competitor VALUES('admin', 'password');

CREATE TABLE math.question (
	id SERIAL PRIMARY KEY,
	text VARCHAR(256) NOT NULL,
	value INT DEFAULT 1
);

INSERT INTO math.question VALUES(1, '$$ 1 + 1 = $$', 1);
INSERT INTO math.question VALUES(2, '$$ 2 + 2 = $$', 1);
INSERT INTO math.question VALUES(3, '$$ 3 + 3 = $$', 1);
INSERT INTO math.question VALUES(4, '$$ 4 + 4 = $$', 1);
INSERT INTO math.question VALUES(5, '$$ 5 + 5 = $$', 1);
INSERT INTO math.question VALUES(6, '$$ 6 + 6 = $$', 1);
INSERT INTO math.question VALUES(7, '$$ 7 + 7 = 14 $$', 1);
INSERT INTO math.question VALUES(8, '$$ 8 + 8 = 13 $$', 1);
INSERT INTO math.question VALUES(9, '$$ 9 + 9 = 17 $$', 1);
INSERT INTO math.question VALUES(10, '$$ 10 + 10 = 20 $$', 1);

CREATE TABLE math.answer (
	id SERIAL PRIMARY KEY,
	question_id INT REFERENCES math.question(id),
	correct BOOLEAN DEFAULT FALSE,
	text VARCHAR(256) NOT NULL
);

INSERT INTO math.answer VALUES(1, 1, FALSE, '$$ 1 $$');
INSERT INTO math.answer VALUES(2, 1, TRUE, '$$ 2 $$');
INSERT INTO math.answer VALUES(3, 1, FALSE, '$$ 3 $$');
INSERT INTO math.answer VALUES(4, 1, FALSE, '$$ 4 $$');

INSERT INTO math.answer VALUES(5, 2, FALSE, '$$ 3 $$');
INSERT INTO math.answer VALUES(6, 2, TRUE, '$$ 4 $$');
INSERT INTO math.answer VALUES(7, 2, FALSE, '$$ 5 $$');
INSERT INTO math.answer VALUES(8, 2, FALSE, '$$ 6 $$');

INSERT INTO math.answer VALUES(9, 3, FALSE, '$$ 3 $$');
INSERT INTO math.answer VALUES(10, 3, FALSE, '$$ 4 $$');
INSERT INTO math.answer VALUES(11, 3, FALSE, '$$ 5 $$');
INSERT INTO math.answer VALUES(12, 3, TRUE, '$$ 6 $$');

INSERT INTO math.answer VALUES(13, 4, TRUE, '$$ 8 $$');
INSERT INTO math.answer VALUES(14, 4, FALSE, '$$ 9 $$');
INSERT INTO math.answer VALUES(15, 4, FALSE, '$$ 10 $$');
INSERT INTO math.answer VALUES(16, 4, FALSE, '$$ 11 $$');

INSERT INTO math.answer VALUES(17, 5, FALSE, '$$ 8 $$');
INSERT INTO math.answer VALUES(18, 5, FALSE, '$$ 9 $$');
INSERT INTO math.answer VALUES(19, 5, TRUE, '$$ 10 $$');
INSERT INTO math.answer VALUES(20, 5, FALSE, '$$ 11 $$');

INSERT INTO math.answer VALUES(21, 6, FALSE, '$$ 10 $$');
INSERT INTO math.answer VALUES(22, 6, FALSE, '$$ 11 $$');
INSERT INTO math.answer VALUES(23, 6, TRUE, '$$ 12 $$');
INSERT INTO math.answer VALUES(24, 6, FALSE, '$$ 13 $$');

INSERT INTO math.answer VALUES(25, 7, TRUE, '$$ TRUE $$');
INSERT INTO math.answer VALUES(26, 7, FALSE, '$$ FALSE $$');

INSERT INTO math.answer VALUES(27, 8, FALSE, '$$ TRUE $$');
INSERT INTO math.answer VALUES(28, 8, TRUE, '$$ FALSE $$');

INSERT INTO math.answer VALUES(29, 9, FALSE, '$$ TRUE $$');
INSERT INTO math.answer VALUES(30, 9, TRUE, '$$ FALSE $$');

INSERT INTO math.answer VALUES(31, 10, TRUE, '$$ TRUE $$');
INSERT INTO math.answer VALUES(32, 10, FALSE, '$$ FALSE $$');