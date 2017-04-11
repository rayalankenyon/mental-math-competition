--
-- Create_Math.SQL by GRKenyon 
-- FEB 28 2017
-- Create math schema for melody-math web app
--
DROP SCHEMA IF EXISTS math CASCADE;
CREATE SCHEMA math;

CREATE TABLE math.choice (
	id SERIAL PRIMARY KEY,
	choicetext VARCHAR(256) NOT NULL
);

INSERT INTO math.choice VALUES(201, '$$\frac{17}{12}$$');
INSERT INTO math.choice VALUES(202, '$$\frac{12}{17}$$');
INSERT INTO math.choice VALUES(203, '$$\frac{5}{7}$$');
INSERT INTO math.choice VALUES(204, '$$\frac{7}{5}$$');
INSERT INTO math.choice VALUES(205, '$$\frac{1-\sqrt{2}}{2}$$');
INSERT INTO math.choice VALUES(206, '$$\frac{2-\sqrt{3}}{2}$$');
INSERT INTO math.choice VALUES(207, '$$\frac{3-\sqrt{2}}{3}$$');
INSERT INTO math.choice VALUES(208, '$$False$$');
INSERT INTO math.choice VALUES(209, '$$True$$');

CREATE TABLE math.competitor (
	id SERIAL PRIMARY KEY,
	username VARCHAR(32) NOT NULL,
	password VARCHAR(256) NOT NULL,
	firstname VARCHAR(32) NOT NULL,
	lastname VARCHAR(32) NOT NULL,
	score INT
);

INSERT INTO math.competitor VALUES(101, 'Superman32', 'Rosebud', 'Jordan', 'Jara', NULL);
INSERT INTO math.competitor VALUES(102, 'Rocker96', 'PSWRD', 'Clinton', 'Petrie', NULL);
INSERT INTO math.competitor VALUES(103, 'SBSeaton100', 'PSSWD', 'Samuel', 'Seaton', NULL);

CREATE TABLE math.question (
	id SERIAL PRIMARY KEY,
	questiontext VARCHAR(256) NOT NULL,
	correctanswer_choice_id INT NOT NULL,
	foil1_choice_id INT,
	foil2_choice_id INT,
	foil3_choice_id INT
);

INSERT INTO math.question VALUES(301, '$$\frac{2}{3} + \frac{3}{4}$$', 201, 202, 203, 204);
INSERT INTO math.question VALUES(302, '$$\sin(\frac{\pi}{6})-\cos(\frac{\pi}{4})$$', 205, 206, 207, NULL);
INSERT INTO math.question VALUES(303, '$$\frac{3}{4} \in \{x|12x^2+17x=-6\}$$', 208, 209, NULL, NULL);

CREATE TABLE math.submission (
	competitor_id INT NOT NULL,
	question_id INT NOT NULL,
	attime TIMESTAMP NOT NULL,
	selected_choice_id INT NOT NULL
);

INSERT INTO math.submission VALUES(101, 302, '2017-02-28 14:47:54.0', 206);
INSERT INTO math.submission VALUES(103, 301, '2017-02-28 15:07:59.0', 203);
INSERT INTO math.submission VALUES(102, 303, '2017-02-28 15:07:59.0', 208);

\q