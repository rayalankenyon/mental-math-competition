DROP SCHEMA IF EXISTS math CASCADE ;
CREATE SCHEMA math;

CREATE TABLE math.competitor (
	username VARCHAR(32) PRIMARY KEY,
	score INT DEFAULT 0
);

INSERT INTO math.competitor VALUES('gregory', 1000);
INSERT INTO math.competitor VALUES('rayalan', 999);
INSERT INTO math.competitor VALUES('kenyon',  998);

CREATE TABLE math.question (
	id SERIAL PRIMARY KEY,
	text VARCHAR(256) NOT NULL,
	points INT NOT NULL,
	answered INT DEFAULT 0
);

INSERT INTO math.question(id, text, points) VALUES(1, '\( 0.4 \times 160 \)', 2);
INSERT INTO math.question(id, text, points) VALUES(2, '\( 2^{12} \)', 2);
INSERT INTO math.question(id, text, points) VALUES(3, '\( e^{2}>9 \)', 2);
INSERT INTO math.question(id, text, points) VALUES(4, '\( 3\ |\ 85203 \)', 2);
INSERT INTO math.question(id, text, points) VALUES(5, '\( 8x-3=101 \)', 2);
INSERT INTO math.question(id, text, points) VALUES(6, '\( \left| \begin{matrix} 6& 4\\ 8& 9\end{matrix} \right|  \)', 2);
INSERT INTO math.question(id, text, points) VALUES(7, '\( x>0\ \land \left( x-7\right) ^{2}=81 \)', 2);
INSERT INTO math.question(id, text, points) VALUES(8, '\( 35\%\ \ of\ \ 480 \)', 2);
INSERT INTO math.question(id, text, points) VALUES(9, '\( f\left( 3\right)\ \ \text{if}\ \ f\left( x\right) =2x^{2}-10x+1 \)', 2);
INSERT INTO math.question(id, text, points) VALUES(10, '\( \sin \left( \dfrac {\pi } {6}\right) +\cos \left( \dfrac {\pi } {3}\right)  \)', 2);

INSERT INTO math.question(id, text, points) VALUES(11, '\( 58 \times 62 \)', 3);
INSERT INTO math.question(id, text, points) VALUES(12, '\( m\ \ \text{if}\ \ P_{1}=\left( 16,18\right) \land P_{2}=\left( 9,60\right)  \)', 3);
INSERT INTO math.question(id, text, points) VALUES(13, '\( x\ \lt\ 0\ \land \left| 2x-1\right| =5 \)', 3);
INSERT INTO math.question(id, text, points) VALUES(14, '\( 5-12y\ \lt\ -11 \)', 3);
INSERT INTO math.question(id, text, points) VALUES(15, '\( \int _{\pi }^{2\pi }2\sin \left( x\right) dx \)', 3);
INSERT INTO math.question(id, text, points) VALUES(16, '\( \int _{1}^{2}\left( x^{2}+x\right) dx \)', 3);
INSERT INTO math.question(id, text, points) VALUES(17, '\( f\text{&prime;}\left( -4\right)  \ \text{if}\ \ f\left( x\right) =x^{3}+x^{2}+x \)', 3);
INSERT INTO math.question(id, text, points) VALUES(18, '\( x>1\dfrac {1} {3}\ \ \land\ \ 8x^{2}-22x+15=0 \)', 3);
INSERT INTO math.question(id, text, points) VALUES(19, '\( 34\times 294 \)', 3);
INSERT INTO math.question(id, text, points) VALUES(20, '\( \begin{align*} & 2x-3y=-2\\ & 4x+y=24\end{align*} \)', 3);

INSERT INTO math.question(id, text, points) VALUES(21, '\( \text{Least positive &theta; &SuchThat; }\ 2\sin \left( \theta \right) =-\sqrt {3} \)', 4);
INSERT INTO math.question(id, text, points) VALUES(22, '\( \log _{10}\left( 2s+8\right) =3 \)', 4);
INSERT INTO math.question(id, text, points) VALUES(23, '\( f\text{&prime;}\left( x\right)  \ \text{if}\ \ f\left( x\right) =\sin \left( x^{2}\right)  \)', 4);
INSERT INTO math.question(id, text, points) VALUES(24, '\( 37\times 63 \)', 4);
INSERT INTO math.question(id, text, points) VALUES(25, '\( \left( \begin{matrix} 10\\ 3\end{matrix} \right)  \)', 4);
INSERT INTO math.question(id, text, points) VALUES(26, '\( \text{57 in binary} \)', 4);
INSERT INTO math.question(id, text, points) VALUES(27, '\( 8! \)', 4);
INSERT INTO math.question(id, text, points) VALUES(28, '\( \text{Least x &SuchThat; }\ \log _{2}\left( x+1\right) +\log _{2}\left( x\right) =1 \)', 4);
INSERT INTO math.question(id, text, points) VALUES(29, '\( \dfrac {k} {594}=\dfrac {4} {3} \)', 4);
INSERT INTO math.question(id, text, points) VALUES(30, '\( \text{P(doubles or sum=5) if two dice rolled} \)', 4);

CREATE TABLE math.answer (
	id SERIAL PRIMARY KEY,
	question_id INT REFERENCES math.question(id),
	correct BOOLEAN DEFAULT FALSE,
	text VARCHAR(256) NOT NULL
);

INSERT INTO math.answer(question_id, correct, text) VALUES(1, TRUE, '\( 64 \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(1, FALSE, '\( 54 \)');

INSERT INTO math.answer(question_id, correct, text) VALUES(2, TRUE, '\( 4096 \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(2, FALSE, '\( 5144 \)');

INSERT INTO math.answer(question_id, correct, text) VALUES(3, TRUE, '\( False \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(3, FALSE, '\( True \)');

INSERT INTO math.answer(question_id, correct, text) VALUES(4, TRUE, '\( True \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(4, FALSE, '\( False \)');

INSERT INTO math.answer(question_id, correct, text) VALUES(5, TRUE, '\( 13 \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(5, FALSE, '\( 11 \)');

INSERT INTO math.answer(question_id, correct, text) VALUES(6, TRUE, '\( 22 \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(6, FALSE, '\( 86 \)');

INSERT INTO math.answer(question_id, correct, text) VALUES(7, TRUE, '\( 16 \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(7, FALSE, '\( 2 \)');

INSERT INTO math.answer(question_id, correct, text) VALUES(8, TRUE, '\( 168 \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(8, FALSE, '\( 178 \)');

INSERT INTO math.answer(question_id, correct, text) VALUES(9, TRUE, '\( -11 \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(9, FALSE, '\( -9 \)');

INSERT INTO math.answer(question_id, correct, text) VALUES(10, TRUE, '\( 1 \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(10, FALSE, '\( \sqrt {3} \)');

INSERT INTO math.answer(question_id, correct, text) VALUES(11, TRUE, '\( 3596 \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(11, FALSE, '\( 3476 \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(11, FALSE, '\( 3582 \)');

INSERT INTO math.answer(question_id, correct, text) VALUES(12, TRUE, '\( -7 \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(12, FALSE, '\( -\dfrac {1} {7} \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(12, FALSE, '\( -\dfrac {2} {7} \)');

INSERT INTO math.answer(question_id, correct, text) VALUES(13, TRUE, '\( -2 \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(13, FALSE, '\( -3 \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(13, FALSE, '\( -4 \)');

INSERT INTO math.answer(question_id, correct, text) VALUES(14, TRUE, '\( \left( \dfrac {4} {3},\infty \right)  \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(14, FALSE, '\( \left( -\infty ,-\dfrac {3} {4}\right)  \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(14, FALSE, '\( \left( \dfrac {5} {3},\infty \right)  \)');

INSERT INTO math.answer(question_id, correct, text) VALUES(15, TRUE, '\( -4 \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(15, FALSE, '\( \dfrac {3\pi } {2} \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(15, FALSE, '\( -2\pi  \)');

INSERT INTO math.answer(question_id, correct, text) VALUES(16, TRUE, '\( 3\dfrac {5} {6} \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(16, FALSE, '\( 5\dfrac {1} {3} \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(16, FALSE, '\( 4\dfrac {1} {6} \)');

INSERT INTO math.answer(question_id, correct, text) VALUES(17, TRUE, '\( 57 \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(17, FALSE, '\( 61 \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(17, FALSE, '\( 73 \)');

INSERT INTO math.answer(question_id, correct, text) VALUES(18, TRUE, '\( \dfrac {3} {2} \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(18, FALSE, '\( \dfrac {5} {3} \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(18, FALSE, '\( 1\dfrac {5} {6} \)');

INSERT INTO math.answer(question_id, correct, text) VALUES(19, TRUE, '\( 9996 \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(19, FALSE, '\( 9656 \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(19, FALSE, '\( 10056 \)');

INSERT INTO math.answer(question_id, correct, text) VALUES(20, TRUE, '\( \left( 5,4\right)  \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(20, FALSE, '\( \left( 4,5\right)  \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(20, FALSE, '\( \left( 3,6\right)  \)');

INSERT INTO math.answer(question_id, correct, text) VALUES(21, TRUE, '\( \dfrac {4\pi } {3} \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(21, FALSE, '\( \dfrac {5\pi } {3} \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(21, FALSE, '\( \dfrac {7\pi } {6} \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(21, FALSE, '\( \dfrac {11\pi } {6} \)');

INSERT INTO math.answer(question_id, correct, text) VALUES(22, TRUE, '\( 496 \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(22, FALSE, '\( 504 \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(22, FALSE, '\( 488 \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(22, FALSE, '\( 484 \)');

INSERT INTO math.answer(question_id, correct, text) VALUES(23, TRUE, '\( 2x\cdot \cos \left( x^{2}\right) \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(23, FALSE, '\( 2\cdot \cos \left( 2x\right) \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(23, FALSE, '\( -2x\cdot \cos \left( 2x^{2}\right) \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(23, FALSE, '\( 4x\cdot \cos \left( 2x\right)  \)');

INSERT INTO math.answer(question_id, correct, text) VALUES(24, TRUE, '\( 2331 \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(24, FALSE, '\( 2341 \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(24, FALSE, '\( 2351 \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(24, FALSE, '\( 2361 \)');

INSERT INTO math.answer(question_id, correct, text) VALUES(25, TRUE, '\( 120 \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(25, FALSE, '\( 360 \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(25, FALSE, '\( 240 \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(25, FALSE, '\( 180 \)');

INSERT INTO math.answer(question_id, correct, text) VALUES(26, TRUE, '\( 111001 \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(26, FALSE, '\( 110101 \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(26, FALSE, '\( 101011 \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(26, FALSE, '\( 110111 \)');

INSERT INTO math.answer(question_id, correct, text) VALUES(27, TRUE, '\( 40320 \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(27, FALSE, '\( 38760 \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(27, FALSE, '\( 42240 \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(27, FALSE, '\( 43180 \)');

INSERT INTO math.answer(question_id, correct, text) VALUES(28, TRUE, '\( 1 \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(28, FALSE, '\( -2 \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(28, FALSE, '\( -1 \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(28, FALSE, '\( 2 \)');

INSERT INTO math.answer(question_id, correct, text) VALUES(29, TRUE, '\( 792 \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(29, FALSE, '\( 786 \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(29, FALSE, '\( 812 \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(29, FALSE, '\( 772 \)');

INSERT INTO math.answer(question_id, correct, text) VALUES(30, TRUE, '\( \dfrac {5} {18} \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(30, FALSE, '\( \dfrac {9} {36} \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(30, FALSE, '\( \dfrac {7} {18} \)');
INSERT INTO math.answer(question_id, correct, text) VALUES(30, FALSE, '\( \dfrac {11} {36} \)');