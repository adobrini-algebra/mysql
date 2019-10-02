
INSERT INTO grad (ime) VALUES ('Zagreb');
INSERT INTO grad (ime) VALUES ('Split');
INSERT INTO grad (ime) VALUES ('Varaždin'), ('Osijek');

SELECT * FROM grad;

INSERT INTO poslovnica (naziv, grad_id) VALUES ('12-105', 1);
INSERT INTO poslovnica (naziv, grad_id) VALUES ('12-106', 2), ('12-107', 3), ('12-108', 1);

SELECT * FROM poslovnica;

INSERT INTO zaposlenici (ime, prezime, poslovnica_id) VALUES ('Pero', 'Perić', 1);
INSERT INTO zaposlenici (ime, prezime, poslovnica_id) VALUES ('Marko', 'Markić', 2), ('Ana', 'Anić', 3), ('Iva', 'Ivić', 4);

SELECT * FROM zaposlenici;

INSERT INTO voditelj_poslovnice (zaposlenik_id, poslovnica_id) VALUES (2,2), (4,1);

SELECT * FROM voditelj_poslovnice;