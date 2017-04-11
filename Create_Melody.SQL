-- 
-- Create_Melody.SQL  by  JA Solheim  04 NOV 2016
-- This file contains a PostgreSQL script that,
-- when executed, creates the Melody schema & tables.
-- 
SELECT current_date, current_time ;
SELECT current_database() ;
DROP SCHEMA IF EXISTS MELODY CASCADE ;
CREATE SCHEMA MELODY ;
--
CREATE TABLE MELODY.BAND
  ( Band_ID     INT  NOT NULL,
    Name        VARCHAR(50) NOT NULL,
    City        VARCHAR(25),
    Region      VARCHAR(15),
    Country     VARCHAR(20),
    WebAddress  VARCHAR(40),
    EntryDate   DATE,
    LeadSource  VARCHAR(10),
    PRIMARY KEY ( Band_ID ) ) ;
--
Insert Into MELODY.BAND Values(1,'The Neurotics','Peterson','NC','USA','www.theneurotics.com','2003-05-14','Directmail');
Insert Into MELODY.BAND Values(2,'Louis Holiday','Clinton','IL','USA' ,NULL,'2003-06-03','Directmail');
Insert Into MELODY.BAND Values(3,'Word','Anderson','IN','USA',NULL,'2003-06-08','Email');
Insert Into MELODY.BAND Values(5,'Sonata','Alexandria','VA','USA','www.classical.com/sonata','2003-06-08','Ad');
Insert Into MELODY.BAND Values(10,'The Bullets','Alverez','TX','USA',NULL,'2003-08-10','Email');
Insert Into MELODY.BAND Values(14,'Jose MacArthur','Santa Rosa','CA','USA','www.josemacarthur.com','2003-08-17','Ad');
Insert Into MELODY.BAND Values(15,'Confused','Tybee Island','GA','USA',NULL,'2003-09-14','Directmail');
Insert Into MELODY.BAND Values(17,'The Kicks','New Rochelle','NY','USA',NULL,'2003-12-03','Ad');
Insert Into MELODY.BAND Values(16,'Today','London','ONT','Canada','www.today.com','2003-10-07','Email');
Insert Into MELODY.BAND Values(18,'21 West Elm','Alamaba','VT','USA','www.21westelm.com','2003-02-05','Ad');
Insert Into MELODY.BAND Values(11,'Highlander','Columbus','OH','USA',NULL,'2002-08-10','Email');
SELECT * FROM MELODY.BAND ;
--
CREATE TABLE MELODY.GENRE
  ( Genre  VARCHAR(15) NOT NULL,
    PRIMARY KEY ( Genre ) ) ;
--
Insert into MELODY.Genre Values('alternative');
Insert into MELODY.Genre Values('classical');
Insert into MELODY.Genre Values('jazz');
Insert into MELODY.Genre Values('metal');
Insert into MELODY.Genre Values('R&B');
Insert into MELODY.Genre Values('rap');
Insert into MELODY.Genre Values('pop');
SELECT * FROM MELODY.Genre ;
--
CREATE TABLE MELODY.MUSICIAN
  ( Musician_ID  INT  NOT NULL,
    FirstName    VARCHAR(25),
    LastName     VARCHAR(25),
    Address      VARCHAR(60),
    City         VARCHAR(25),
    Region       VARCHAR(15),
    PostalCode   VARCHAR(10),
    Country      VARCHAR(20),
    HomePhone    VARCHAR(16),
    WorkPhone    VARCHAR(16),
    EMail        VARCHAR(40),
    Gender       CHAR(1),
    DateOfBirth  DATE,
    Sales_ID     SMALLINT,
    PRIMARY KEY ( Musician_ID ) ) ;
--
Insert into MELODY.MUSICIAN Values(10,'Roberto','Alvarez','Rt 1','Anderson','IN','46019','USA','7651552983','7651628837','ral@mightyhostl.com','M',DATE('1968-01-18'),2);
Insert into MELODY.MUSICIAN Values(31,'Jose','MacArthur','51444 Vine','Santa Rosa','CA','99999','USA','6331289393',NULL,'jmac@dowop.com','M',DATE('1978-06-24'),1);
Insert into MELODY.MUSICIAN Values(13,'Mary','Chrisman','1772 East 117th','Fishers','IN','46123','USA','3171820387',NULL,'mjc17@daviscorp.com','F',DATE('1973-03-01'),1);
Insert into MELODY.MUSICIAN Values(15,'Warren','Boyer','167 Alamo Dr','Alverez','TX','75601','USA','8221722883',NULL,'wbman@uptime.net','M',DATE('1969-04-19'),2);
Insert into MELODY.MUSICIAN Values(32,'Doug','Finney','2020 Dubois','Savannah','GA','30003','USA','9821222929',NULL,'fennyd@bitspeed.com','M',DATE('1963-08-04'),3);
Insert into MELODY.MUSICIAN Values(19,'Terry','Irving','18a 7th St','Tybee Island','GA','30004','USA','5411252093',NULL,NULL,'M',DATE('1959-06-22'),3);
Insert into MELODY.MUSICIAN Values(21,'Michelle','Henderson','201 Bonaventure','Savannah','GA','30005','USA','8221928273',NULL,NULL,'F',DATE('1964-03-15'),2);
Insert into MELODY.MUSICIAN Values(34,'William','Morrow','PO Box 1882','New Rochelle','NY','10014','USA','9981722928',NULL,'wmorrow@wmorrow.com','M',DATE('1965-03-17'),2);
Insert into MELODY.MUSICIAN Values(29,'Frank','Payne','5412 Clinton','New Rochelle','NY','10014','USA','9981737464',NULL,NULL,'M',DATE('1960-01-17'),1);
Insert into MELODY.MUSICIAN Values(35,'Aiden','Franks','167 East 38th','Alverez','TX','75601','USA','8321729283','8321723833','kosmo@ispl.com','M',DATE('1983-09-02'),2);
Insert into MELODY.MUSICIAN Values(3,'Bryce','Sanders','PO Box 1292','Peterson','NC','27104','USA','6441824283',NULL,'bs@cookery.com','M',DATE('1966-06-11'),2);
Insert into MELODY.MUSICIAN Values(14,'Carol','Wanner','787 Airport Rd','Alverez','TX','75601','USA','6831223944',NULL,NULL,'F',DATE('1978-11-08'),3);
Insert into MELODY.MUSICIAN Values(33,'Brian','Ranier','23 Gregory Lane','London','ONT','M6Y 2Y7 ','Canada','6231842933',NULL,NULL,'M',DATE('1957-10-19'),3);
Insert into MELODY.MUSICIAN Values(7,'Marcellin','Lambert','142 Sample Rd','Alexandria','VA','20102','USA','8331929302',NULL,'mlambert@corkscrew.com','M',DATE('1959-11-14'),3);
Insert into MELODY.MUSICIAN Values(8,'Caroline','Kale','1515 Stone Church Rd','Allen','VA','20321','USA','7321223742',NULL,NULL,'F',DATE('1956-05-30'),3);
Insert into MELODY.MUSICIAN Values(9,'Kerry','Fernandez','15 Midway','Lynchberg','VA','21223','USA','2211229384','2211223939',NULL,'M',DATE('1962-01-16'),1);
Insert into MELODY.MUSICIAN Values(26,'Tony','Wong','115 Maple St','McKensie','ONT','M8H 3T1','Canada','3311692832','3311692822','twong@tamilla.org','M',DATE('1955-11-01'),2);
Insert into MELODY.MUSICIAN Values(18,'Bonnie','Taft','RR4','Alamaba','VT','05303','USA','3721223292',NULL,'taffygirl@signon.com','F',DATE('1960-09-21'),1);
Insert into MELODY.MUSICIAN Values(20,'Louis','Holiday','15 Davis Ct','Clinton','IL','63882','USA','1451223838',NULL,NULL,'M',DATE('1969-07-27'),2);
Insert into MELODY.MUSICIAN Values(22,'Bobby','Crum','RR2','Pine','VT','05412','USA','1831828211',NULL,NULL,'M',DATE('1965-06-10'),3);
Insert into MELODY.MUSICIAN Values(28,'Vic','Cleaver','100 Maple','Reston','VT','05544','USA','8111839292',NULL,NULL,'M',DATE('1957-02-10'),2);
Insert into MELODY.MUSICIAN Values(30,'Roberto','Goe','14 Gray Rd','Columbus','OH','48110','USA','2771123943',NULL,NULL,'M',DATE('1967-09-12'),1);
Insert into MELODY.MUSICIAN Values(36,'Davis','Goodman','2020 COUNTRY Rd','Columbus','OH','48318','USA','2771152882','2771128833','goody@irvingnet.com','M',DATE('1980-10-27'),2);
SELECT * FROM MELODY.MUSICIAN ;
--
CREATE TABLE MELODY.SalesPerson
  ( Sales_ID              SMALLINT  NOT NULL,
    FirstName             VARCHAR(20) NOT NULL,
    LastName              VARCHAR(20) NOT NULL,
    Initials              CHAR(3),
    WeeklyBaseSalary      DECIMAL(5,2),
    Supervisors_Sales_ID  SMALLINT,
    PRIMARY KEY ( Sales_ID ) ) ;
--
Insert into MELODY.SalesPerson Values(1,'Bob','Bentley','bbb',100,4);
Insert into MELODY.SalesPerson Values(2,'Lisa','Williams','lmw',300,4);
Insert into MELODY.SalesPerson Values(3,'Clint','Sanchez','cls',100,1);
Insert into MELODY.SalesPerson Values(4,'Scott','Bull','sjb',NULL, NULL);  
SELECT * FROM MELODY.SalesPerson ;
--
CREATE TABLE MELODY.Studio
    (  Studio_ID   INT NOT NULL,
       Name        VARCHAR(40),
       Address     VARCHAR(60),
       City        VARCHAR(25),
       Region      VARCHAR(15),
       PostalCode  VARCHAR(10),
       Country     VARCHAR(20),
       WebAddress  VARCHAR(40),
       Contact     VARCHAR(50),
       EMail       VARCHAR(40),
       Phone       VARCHAR(16),
       Sales_ID    SMALLINT,
       PRIMARY KEY ( Studio_ID )  ) ;
--
Insert Into MELODY.Studio Values(1,'MakeTrax','3000 S St Rd 9','Anderson','IN','46012','USA','www.maketrax.com','Gardner Roberts','groberts@maketrax.com','7651223000',3);
Insert Into MELODY.Studio Values(2,'Lone Star Recording','PO Box 221','Davis','TX','76382','USA','www.lsrecords.com','Manuel Austin','ma@lonestarrec.com','8821993748',2);
Insert Into MELODY.Studio Values(3,'Pacific Rim','681 PCH','Santa Theresa','CA','99320','USA','www.pacrim.org','Harry Lee','harry@pcrim.org','3811110033',2);
SELECT * FROM MELODY.Studio ;
--
CREATE TABLE MELODY.Album
    (  Album_ID   INT NOT NULL ,
       Band_ID    INT,
       Title      VARCHAR (50) ,
       Studio_ID  INT,
       UPC        CHAR (13) ,
       Genre      VARCHAR (15),
       PRIMARY KEY ( Album_ID )  ) ;
--
Insert Into MELODY.Album Values(1,1,'Meet the Neurotics',1,'2727366627','alternative');
Insert Into MELODY.Album Values(3,15,'Smell the Glove',2,'1283772282','metal');
Insert Into MELODY.Album Values(4,10,'Time Flies',3,'1882344222','alternative');
Insert Into MELODY.Album Values(5,1,'Neurotic Sequel',1,'2828830202','alternative');
Insert Into MELODY.Album Values(6,5,'Sonatas',2,'3999320021','classical');
Insert Into MELODY.Album Values(7,2,'Louis at the Keys',3,'3838227111','jazz');
SELECT * FROM MELODY.Album ;
--
CREATE TABLE MELODY.Track
    (  Album_ID           INT NOT NULL,
       TrackNumber        SMALLINT NOT NULL,
       TrackTitle         VARCHAR(50),
       LengthInSeconds    SMALLINT,
       MP3_Available      BOOLEAN,
       RealAud_Available  BOOLEAN,
       PRIMARY KEY ( Album_ID, TrackNumber )  ) ;
--
Insert into MELODY.Track Values(4,1,'Bob''s Dream',185,TRUE,TRUE);
Insert into MELODY.Track Values(4,3,'Third''s Folly',352,TRUE,TRUE);
Insert into MELODY.Track Values(4,2,'My Wizard',233,TRUE,TRUE);
Insert into MELODY.Track Values(3,1,'Fat Cheeks',352,TRUE,TRUE);
Insert into MELODY.Track Values(1,1,'Hottie',233,TRUE,TRUE);
Insert into MELODY.Track Values(1,2,'Goodtime March',293,TRUE,TRUE);
Insert into MELODY.Track Values(1,3,'TV Day',305,TRUE,TRUE);
Insert into MELODY.Track Values(1,4,'Call Me an Idiot',315,TRUE,TRUE);
Insert into MELODY.Track Values(1,5,'25',402,TRUE,TRUE);
Insert into MELODY.Track Values(1,6,'Palm',322,TRUE,TRUE);
Insert into MELODY.Track Values(1,7,'Front Door',192,TRUE,TRUE);
Insert into MELODY.Track Values(1,8,'Where''s the Rain',175,TRUE,TRUE);
Insert into MELODY.Track Values(3,2,'Rocky and Natasha',283,TRUE,TRUE);
Insert into MELODY.Track Values(3,3,'Dweeb',273,TRUE,TRUE);
Insert into MELODY.Track Values(3,4,'Funky Town',252,TRUE,TRUE);
Insert into MELODY.Track Values(3,5,'Shoes',182,TRUE,TRUE);
Insert into MELODY.Track Values(3,6,'Time In - In Time',129,TRUE,TRUE);
Insert into MELODY.Track Values(6,1,'Violin Sonata No. 1 in D Major',511,TRUE,TRUE);
Insert into MELODY.Track Values(6,2,'Violin Sonata No. 2 in A Major',438,TRUE,TRUE);
Insert into MELODY.Track Values(6,3,'Violin Sonata No. 4 in E Minor',821,TRUE,FALSE);
Insert into MELODY.Track Values(6,4,'Piano Sonata No. 1',493,TRUE,FALSE);
Insert into MELODY.Track Values(6,5,'Clarinet Sonata in E Flat',399,TRUE,FALSE);
Insert into MELODY.Track Values(5,1,'Song 1',285,TRUE,TRUE);
Insert into MELODY.Track Values(5,2,'Song 2',272,TRUE,TRUE);
Insert into MELODY.Track Values(5,3,'Song 3',299,TRUE,TRUE);
Insert into MELODY.Track Values(5,4,'Song 4',201,TRUE,TRUE);
Insert into MELODY.Track Values(5,5,'Song 5',198,TRUE,FALSE);
Insert into MELODY.Track Values(5,6,'Song 6',254,TRUE,FALSE);
Insert into MELODY.Track Values(5,7,'Song 7',303,TRUE,TRUE);
Insert into MELODY.Track Values(5,8,'Song 8',230,TRUE,FALSE);
Insert into MELODY.Track Values(5,9,'Song 8 and 1/2',45,TRUE,FALSE);
Insert into MELODY.Track Values(7,1,'I Don''t Know',201,TRUE,FALSE);
Insert into MELODY.Track Values(7,2,'What''s the Day',332,TRUE,FALSE);
Insert into MELODY.Track Values(7,3,'Sirius',287,TRUE,FALSE);
Insert into MELODY.Track Values(7,4,'Hamburger Blues',292,TRUE,FALSE);
Insert into MELODY.Track Values(7,5,'Road Trip',314,TRUE,FALSE);
Insert into MELODY.Track Values(7,6,'Meeting You',321,TRUE,TRUE);
Insert into MELODY.Track Values(7,7,'Improv 34',441,TRUE,TRUE);
Insert into MELODY.Track Values(7,8,'Hey',288,TRUE,TRUE);
Insert into MELODY.Track Values(4,4,'Leather',185,TRUE,TRUE);
Insert into MELODY.Track Values(4,5,'Hot Cars Cool Nights',192,TRUE,TRUE);
Insert into MELODY.Track Values(4,6,'Music in You',204,TRUE,TRUE);
Insert into MELODY.Track Values(4,7,'Don''t Care About Time',221,TRUE,TRUE);
Insert into MELODY.Track Values(4,8,'Kiss',218,TRUE,TRUE);
Insert into MELODY.Track Values(4,9,'Pizza Box',183,TRUE,TRUE);
Insert into MELODY.Track Values(4,10,'Goodbye',240,TRUE,TRUE);
Insert into MELODY.Track Values(3,7,'Wooden Man',314,FALSE,FALSE);
Insert into MELODY.Track Values(3,8,'UPS',97,FALSE,FALSE);
Insert into MELODY.Track Values(3,9,'Empty',182,FALSE,FALSE);
Insert into MELODY.Track Values(3,10,'Burrito',65,FALSE,FALSE);
SELECT * FROM MELODY.Track ;
--
CREATE TABLE MELODY.Musician_Band
    (  Musician_ID  INT NOT NULL ,
       Band_ID      INT NOT NULL ,
       Responsible  BOOLEAN NOT NULL ,
       PRIMARY KEY ( Musician_ID, Band_ID )  ) ;
--
Insert into MELODY.Musician_Band Values(20,2,TRUE);
Insert into MELODY.Musician_Band Values(31,14,TRUE);
Insert into MELODY.Musician_Band Values(3,1,TRUE);
Insert into MELODY.Musician_Band Values(10,3,TRUE);
Insert into MELODY.Musician_Band Values(13,3,FALSE);
Insert into MELODY.Musician_Band Values(7,5,TRUE);
Insert into MELODY.Musician_Band Values(8,5,FALSE);
Insert into MELODY.Musician_Band Values(9,5,FALSE);
Insert into MELODY.Musician_Band Values(32,15,FALSE);
Insert into MELODY.Musician_Band Values(19,15,TRUE);
Insert into MELODY.Musician_Band Values(21,15,FALSE);
Insert into MELODY.Musician_Band Values(34,17,TRUE);
Insert into MELODY.Musician_Band Values(29,17,FALSE);
Insert into MELODY.Musician_Band Values(15,10,TRUE);
Insert into MELODY.Musician_Band Values(35,10,FALSE);
Insert into MELODY.Musician_Band Values(14,10,FALSE);
Insert into MELODY.Musician_Band Values(33,16,TRUE);
Insert into MELODY.Musician_Band Values(26,16,FALSE);
Insert into MELODY.Musician_Band Values(18,18,TRUE);
Insert into MELODY.Musician_Band Values(28,18,FALSE);
Insert into MELODY.Musician_Band Values(22,18,FALSE);
Insert into MELODY.Musician_Band Values(30,11,TRUE);
Insert into MELODY.Musician_Band Values(36,11,FALSE);
SELECT * FROM MELODY.Musician_Band ;
--
-- DROP SCHEMA IF EXISTS MELODY CASCADE ;
--
SELECT current_date, current_time ;
\q
--
