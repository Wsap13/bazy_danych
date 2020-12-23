Tworzenie tabel
create table klient (id_klient int primary key auto_increment, imie varchar(45) not null,nazwisko varchar(45) not null,nip float);
create table zlecenie (id_zlecenia int primary key auto_increment, data_zamowienia datetime ,numer_zamowienia int not null );
create table status_realizacji (id_statusu int primary key auto_increment,nazwa_statusu varchar(45);
create table reklama (id_reklamy int primary key auto_increment,cena float(9,2));
create table rodzaj_reklamy (id_rodzaju int primary key auto_increment,rodzaj_reklamy varchar(45));
create table rodzaj_materialu(id_materialu int primary key auto_increment, nazwa_materialu varchar(45);

Naprawianie popełnionych przeze mnie błędów 
alter table klient add column firma first nip;
alter table klient add column firma enum('tak','nie') default 'nie';
alter table klient drop nip;
alter table klient add column nip float(10);
alter table rodzaj_reklamy RENAME COLUMN rodzaj_reklamy to nazwa_rodzaju;
alter table zlecenie add column klient int;
alter table zlecenie add column status_realizacji int;
alter table klient modify nip varchar(10);
ALTER TABLE zlecenie RENAME COLUMN numer_zamowienia TO numer_zlecenia;
alter table zlecenie modify data_zamowienia date;
alter table reklama add column rodzaj int;
alter table reklama add column material int;
alter table reklama add column zlecenie int;

Dodawanie kluczy obcych
alter table zlecenie add foreign key (status_realizacji) references status_realizacji(id_rodzaju) on delete cascade;
alter table reklama add foreign key (material) references rodzaj_materialu(id_materialu) on delete cascade;
alter table reklama add foreign key (rodzaj) references rodzaj_reklamy(id_rodzaju) on delete cascade;
alter table reklama add foreign key (zlecenie) references zlecenie(id_zlecenia) on delete cascade;

Uzupełnianie tabel
insert into rodzaj_reklamy (nazwa_rodzaju) values('neon i ledon'),('stoiska targowe'),('flagi reklamowe'),('pylony');
insert into klient (imie,nazwisko,nip) values ('Grzegorz','Brzęczyszczykiewicz','8821881731');
insert into klient (imie,nazwisko,nip) values ('Adam','Zieliński','3281486051');
insert into klient (imie,nazwisko,nip) values ('Leszek','Kaźmierczak','2247725311');
insert into klient (imie,nazwisko,firma,nip) values ('filip','Szcześniak','tak','2596219647');
insert into status_realizacji(nazwa_statusu)values('oczekujace'),('wstrzymane'),('zakonczone'),('w trakce');
insert into rodzaj_reklamy(nazwa_rodzaju) values
('tablica szyld'),('reklama na pojazdach'),('reklama na plandekach tir'),('kaseton swietlny jednostronny');
insert into rodzaj_materialu(nazwa_materialu)values('plyta pcv'),('plyta pmma'),('blacha ocynk'),('poliwęglan kanalikowy')('płyta warstwowa Dibond ');
insert into zlecenie (data_zamowienia,numer_zamowienia,klient) values ('2020-06-02',1,1);
insert into zlecenie (data_zamowienia,numer_zamowienia,klient,status_realizacji) values ('2020-06-02',1,1,1);
insert into zlecenie (data_zamowienia,numer_zamowienia,klient,status_realizacji) values ('2020-04-16',2,2,3);
insert into zlecenie (data_zamowienia,numer_zamowienia,klient,status_realizacji) values ('2020-04-16',3,4,1);
insert into reklama (cena,rodzaj,material,zlecenie) values (500,1,3,2),(3000,4,4,3),(2300,3,5,4),(1600,2,3,5);
insert into klient(imie,nazwisko,firma,nip) values('Łukasz','Paluszak','tak','5436948375'),('Adam','Ostrowski','tak','8974834692'),('Benito','Ricci','tak','5426112376');
insert into klient(imie,nazwisko,firma,) values('Kuba','Granowsli','nie',),('Tomasz','Iwańca','nie',),('Piotr','Szmidt','nie',);
insert into klient(imie,nazwisko,firma,) values('Kuba','Granowsli','nie',),('Tomasz','Iwańca','nie',),('Piotr','Szmidt','nie');
insert into klient(imie,nazwisko,firma,) values('Kuba','Granowsli','nie'),('Tomasz','Iwańca','nie'),('Piotr','Szmidt','nie');
insert into klient(imie,nazwisko,firma) values('Kuba','Granowsli','nie'),('Tomasz','Iwańca','nie'),('Piotr','Szmidt','nie');
insert into klient(imie,nazwisko,firma,nip) values('Szad','Akrobata','tak','5453927430');
insert into zlecenie(data_zamowienia,numer_zamowienia,klient,status_realizacji) values('2020-05-26',5,5,4),('2020-05-26',5,5,3),('2020-05-26',6,5,2),('2020-05-23',7,6,1),('2020-02-14',8,7,4),('2020-03-01',9,7,3),('2020-09-03',10,8,3),('2020-11-04',11,11,4),('2020-01-24',12,3,3);
insert into reklama(cena,rodzaj,material,zlecenie)values(600,1,3,6),(2300,3,5,7),(4000,4,5,8),(1000,2,1,9),(1300,1,4,10),(2300,3,5,11),(900,2,3,12),(2200,3,1,13),(5000,3,5,14);
insert into klient(imie,nazwisko,firma,nip)values('Wojciech','Sosnowski','tak','1507998013'),('Dariusz','Działek','nie',''),('Adam','Piechocki','nie','');
insert into zlecenie(data_zlecenia,numer_zlecenia,klient,status_realizacji) values('2020-04-24',13,9,1),('2020-07-16',14,10,4),('2020-09-14',15,4,3),('2020-11-16',16,8,4),
('2020-09-04',17,9,3),('2020-12-22',18,9,3),('2020-11-14',19,12,4),('2020-12-15',20,1,2),('2020-12-05',21,2,3),('2020-12-15',22,13,3),('2020-02-25',23,14,4),('2020-12-05',24,14,4);
insert into reklama(cena,rodzaj,material,zlecenie)values(1200,7,6,16),(3000,6,5,17),(3400,8,3,18),(5000,6,5,19),(1400,5,2,20),(2400,3,6,21),(3100,8,6,22),(1300,6,1,23),(4400,5,5,24),(800,1,3,25),(1900,2,6,26);


Dodawanie wyzwalaczy.
DELIMITER //
CREATE TRIGGER reklamy_na_tirach
BEFORE INSERT ON reklama
FOR EACH ROW
BEGIN
  IF NEW.rodzaj=3
  THEN
    SET NEW.material =6;
  END IF;
END
//
DELIMITER;

DELIMITER //
CREATE TRIGGER reklamy_na_pojazdach
BEFORE INSERT ON reklama
FOR EACH ROW
BEGIN
  IF NEW.rodzaj=2
  THEN
    SET NEW.material =6;
  END IF;
END
//
DELIMITER;


DELIMITER //
CREATE TRIGGER czy_firma
BEFORE INSERT ON klient
FOR EACH ROW
BEGIN
  IF NEW.firma=('nie')
  THEN
    SET NEW.nip =('osoba prywatna');
  END IF;
END
//


Dodawanie procedury.
DELIMITER $$
create procedure promocja(in procent int,in id int)
begin
update reklama set cena = cena - ((procent/100) * cena) where id_reklamy = id;
end
$$
DELIMITER ;
call promocja(20,7);


Dodawanie funkcji.
delimiter //
create function przychod()
    returns float
begin
    declare zysk float;
    select sum(cena) into @zysk from reklama;
    return @zysk;
end //
select przychod();
  

delimiter //
create function sredni_przychod()
    returns float
begin
    declare zysk float;
    select sum(cena)/count(zlecenie) into @zysk from reklama;
    return @zysk;
end //
select przychod();
select sredni_przychod();
