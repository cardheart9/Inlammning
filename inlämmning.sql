-- skapar databasen
CREATE DATABASE bokhandel ;

-- använder databasen
USE bokhandel ;

-- skapar kund tabel
CREATE table Kunder (
KundID INT AUTO_INCREMENT PRIMARY KEY, -- primary key = säger att varje rad ska ha unikt nummer och inte tomt medans auto_incriment lägger ny nummer för varje rad
Namn   VARCHAR(100),
Epost VARCHAR(100),
telefon VARCHAR(20)
);

-- skapar bocker tabel
create table Bocker (
ISBN VARCHAR(20) PRIMARY KEY, -- behöver inte auto increment eftersom isbn fixar själv nummer som är unika
titel VARCHAR(255),
forfattare VARCHAR(100),
pris DECIMAL (10,2),
lagerstatus INT
);

-- skapar beställningar tabellen
create table bestallningar  (
Ordernummer INT AUTO_INCREMENT PRIMARY KEY,
Datum DATE,
Totalbelopp DECIMAL(10,2),
KundID INT,
FOREIGN KEY (KundID) REFERENCES Kunder(KundID) -- kundid INT förvarar datan som kommer från kunder tabellen. 
);

-- Skapar tabelen för orderrad
CREATE TABLE Orderrader (
Ordernummer INT,
ISBN VARCHAR(20),
Antal INT,
RadID INT AUTO_INCREMENT PRIMARY KEY,
FOREIGN KEY (Ordernummer) REFERENCES bestallningar (Ordernummer),   -- foreignkey (egen kolumn) references peka på tabel ( peka på kolumn) 
FOREIGN KEY (ISBN) REFERENCES Bocker (ISBN) 					    -- eftersom vi inte vet orderrnummer och hur många (finns inte datan i denna tabellen)  så pekar vi på de stället de finns
                                                                    -- foreign key säger bara till om de finns nåt att hämta och ordernummer inte förvarar datan
);

-- insert 
-- måste vara i ordning för att foreign keys tar data från nån annan så datan visas, om en tabel tar info från nån annan så måste target tabellen va först för att host tabellen ska få visa sin data
-- dom tabellerna som inte har foreign keys i sig behöver inte vara i ordning 

INSERT INTO Kunder (Namn, Epost, Telefon)
	VALUES
		  ("charlie", "charlie22@gmail.com", "0735223482"),
          ("kalle", "kalle22@gmail.com", "0735023482"),
          ("yasmin", "yasmin22@gmail.com", "0735253489");
    

INSERT INTO Bocker (ISBN, titel, forfattare, pris, lagerstatus)
	VALUES
		  ('192837', 'jordenrunt', 'jules verne', 150, 1), -- inga apostråfer på siffror
		  ('125280', 'dune', 'bob saget', 300, 2),
		  ('169216', 'karlmarx', 'engels', 500, 7);
          
INSERT INTO bestallningar (Datum, Totalbelopp, KundID)
    VALUES
		 ('2025-08-18', 150, 1),
         ('2025-08-19', 600, 2),
         ('2025-08-22', 1500, 3);

INSERT INTO Orderrader (Ordernummer, ISBN, Antal)
    VALUES
    (1, '192837', 2),
    (1, '125280', 3),
    (1, '169216', 4);

-- select 
SELECT * FROM Kunder;
