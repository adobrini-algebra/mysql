
/*************** DATUMSKE FUNKCIJE *********************/

select date_add(now(), INTERVAL 42 DAY);

select datediff('2007-07-19','2007-07-15');

select date_format(now(),'%M');

select date_format(now(),'%m');

select day(now());

select day('2007-09-07');

select month(now());

select year(now());

/*************** FUNKCIJE ZA RAD SA TEKSTOM *********************/

select left('Baze podataka',4);

select length('Baze podataka');

select lower('BAZE podataka');

select ltrim('    Baze podataka');

select replace('Borg borgira borgijom','borg','zork');

select repeat('baze',2);

select reverse ('Baze');

select right('Baze podataka',5);

select rtrim('Baze podataka    ');

select substring('Baze podataka',6,7);

select upper('BAZE podataka');
