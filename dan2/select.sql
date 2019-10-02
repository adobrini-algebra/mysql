SELECT * FROM zaposlenici; -- dohvati sve stupce iz tablice

SELECT ime, prezime FROM zaposlenici;

-- pseudomimi atributa
SELECT ime AS Ime, prezime AS Prezime FROM zaposlenici;
SELECT ime Ime, prezime 'Prezime osobe' FROM zaposlenici;

SELECT * FROM zaposlenici WHERE ime = 'Ivan' OR ime = 'Zoran' AND prezime = 'Zoranić';

SELECT * FROM zaposlenici WHERE created_at < NOW();

SELECT ime, prezime, now() sada  FROM zaposlenici;

SELECT * FROM zaposlenici WHERE updated_at IS NOT NULL; 

SELECT TIMEDIFF(updated_at, created_at) AS vremenska_razlika FROM zaposlenici WHERE updated_at IS NOT NULL;

SELECT CONCAT(ime, ' ', prezime) AS 'Ime i Prezime' FROM zaposlenici;

SELECT * FROM zaposlenici WHERE ime LIKE '_o%';

SELECT * FROM zaposlenici WHERE ime LIKE '%Zo%';

SELECT DISTINCT ime FROM zaposlenici;
SELECT ime FROM zaposlenici GROUP BY ime;
SELECT ime, count(*) AS Broj FROM zaposlenici GROUP BY ime;

SELECT * FROM zaposlenici ORDER BY ime;
SELECT * FROM zaposlenici ORDER BY ime DESC;
SELECT * FROM zaposlenici ORDER BY ime, prezime;