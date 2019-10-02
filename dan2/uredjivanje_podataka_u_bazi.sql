
UPDATE zaposlenici SET ime = 'Saša' WHERE ime = 'Pero';
UPDATE zaposlenici SET ime = 'Pero' WHERE id = 1;

DELETE FROM zaposlenici WHERE id = 6 OR id = 5;
DELETE FROM zaposlenici WHERE prezime = 'Perić' AND ime = 'Pero';

ALTER TABLE zaposlenici ADD COLUMN vrijeme INT AFTER prezime;

ALTER TABLE zaposlenici ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
INSERT INTO zaposlenici (ime, prezime, poslovnica_id) VALUES ('Zoran', 'Zoranić', 2);

ALTER TABLE zaposlenici ADD COLUMN updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP;
INSERT INTO zaposlenici (ime, prezime, poslovnica_id) VALUES ('Mijo', 'Zmijić', 3);

UPDATE zaposlenici SET ime = 'Ivan' WHERE id = 2 OR id = 4;

ALTER TABLE zaposlenici DROP COLUMN vrijeme;