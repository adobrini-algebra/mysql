/*
Zadatak: 
 
    Zadatak je napraviti bazu podataka za jednu videoteku.
    Potrebno je riješiti problem evidencije posudbe filmova.

1. Baza mora sadržavati podatke o filmovima i podatke o članovima
    te evidenciju posuđenih i vraćenih filmova.

2. Objekte baze podataka stvorite u MySQL-u.
    Svaku tablicu popunite sa po 3 zapisa
    (unesite 3 filma i 3 člana videoteke,
    te proizvoljno unesite što je koji član posudio,
    datum kada je posudio. Za samo jednog člana unesite da je vratio neki film).

3. Stvoriti SQL upit koji Vam daje popis imena i prezimena
    svih članova koji nisu vratili film.

4. Proširiti prošli SQL upit tako da uz imena i prezimena članova
    vrati i naziv filma kojeg nisu vratili.

5. Proširite upit tako da uz imena i prezimena članova
    i naziv filma kojeg nisu vratili vrati i izračunato
    polje koje računa koliko je dana film kod pojedinog člana.

+---------------------------------------------------------+
|                     TABLICA BODOVA                      |
+---------------------------------------------------------+
| R.B |  Zadatak                        |  Mogući bodovi  |
+---------------------------------------------------------+
| 1.  |  Stvaranje baze                 |         1       |
+---------------------------------------------------------+
| 2.  |  Stvaranje tablica u bazi       |         2       |
+---------------------------------------------------------+
| 3.  |  Stvaranje veza                 |         2       |
+---------------------------------------------------------+
| 4.  |  Popunjavanje tablica podacima  |         2       |
+---------------------------------------------------------+
| 5.  |  Stvaranje upita                |         3       |
+---------------------------------------------------------+

*/

DROP DATABASE IF EXISTS videoteka;

CREATE DATABASE IF NOT EXISTS videoteka 
	DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE videoteka;

CREATE TABLE IF NOT EXISTS film(
	id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
	naziv_filma VARCHAR(255) NOT NULL,
	godina_izlaska SMALLINT(4) UNSIGNED
	) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS clanovi (
	id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ime VARCHAR(50) NOT NULL,
	prezime VARCHAR(50) NOT NULL
	) ENGINE = InnoDB;
	
CREATE TABLE IF NOT EXISTS posudbe(
	id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
	film_id INT UNSIGNED NOT NULL,
	clan_id INT UNSIGNED NOT NULL,
	datum_posudbe TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	datum_povratka DATETIME NULL DEFAULT NULL,
	FOREIGN KEY (film_id) REFERENCES film(id),
	FOREIGN KEY (clan_id) REFERENCES clanovi(id)
	) ENGINE = InnoDB;

INSERT INTO clanovi (ime,prezime) 
	VALUES ('Marko','Marulić'),('Karlo','Manjić'),('Fred','Frod');

INSERT INTO film (naziv_filma,godina_izlaska) 
	VALUES ('300','2006'),('Glass','2019'),('Seven','1995');
 
INSERT INTO posudbe (film_id,clan_id,datum_posudbe,datum_povratka) 
	VALUES (1,2,'2019-10-06 19:32:27','2019-10-10 10:32:27');
	
INSERT INTO posudbe (film_id,clan_id,datum_posudbe) 
	VALUES (3,2,'2019-10-07 12:32:27'),(2,1,'2019-10-05 13:32:27');

SELECT clanovi.ime, clanovi.prezime
    FROM clanovi
    JOIN posudbe ON posudbe.clan_id = clanovi.id
    WHERE posudbe.datum_povratka IS NULL;

SELECT clanovi.ime, clanovi.prezime, film.naziv_filma
    FROM clanovi
    JOIN posudbe ON posudbe.clan_id = clanovi.id
    JOIN film ON posudbe.film_id = film.id
    WHERE posudbe.datum_povratka IS NULL;

SELECT clanovi.ime, clanovi.prezime, film.naziv_filma, DATEDIFF(now(), posudbe.datum_posudbe) AS 'Dana vani'
    FROM clanovi
    JOIN posudbe ON posudbe.clan_id = clanovi.id
    JOIN film ON posudbe.film_id = film.id
    WHERE posudbe.datum_povratka IS NULL;

