-- Skapar databas för bokhandel
CREATE DATABASE bokhandel;
USE bokhandel; -- Använder databasen för bokhandel

 -- Skapa Bocker-tabellen
CREATE TABLE Bocker (
    BokID INT AUTO_INCREMENT PRIMARY KEY, -- unikt id för varje bok
    Titel VARCHAR(100) NOT NULL,          -- bokens titel
    ISBN VARCHAR(50) NOT NULL UNIQUE,     -- unikt nummer för boken
    Forfattare VARCHAR(100) NOT NULL,     -- vem som skrivit boken
    Genre VARCHAR(50) NOT NULL,           -- vilken kategori boken tillhör
    Pris DECIMAL(10,2) NOT NULL CHECK (Pris > 0), -- priset på boken
    Lagerstatus INT NOT NULL              -- hur många böcker som finns i lager
);

 -- Skapa Kunder-tabellen
CREATE TABLE Kunder (
    KundID INT AUTO_INCREMENT PRIMARY KEY, -- unikt id för varje kund
    Namn VARCHAR(100) NOT NULL,            -- kundens namn
    Email VARCHAR(255) NOT NULL UNIQUE,    -- kundens e-postadress
    Telefon VARCHAR(20) NOT NULL,          -- telefonnummer
    Adress VARCHAR(255) NOT NULL,          -- kundens adress
    Registeringsdatum TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- när kunden skapades
);

 -- Skapa Beställningar-tabellen
CREATE TABLE Bestallningar (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,   -- id för beställningen
    Ordernummer INT NOT NULL UNIQUE,          -- synligt ordernummer
    KundID INT NOT NULL,                      -- vilken kund som gjort beställningen
    Datum TIMESTAMP DEFAULT CURRENT_TIMESTAMP,-- när beställningen lades
    Totalbelopp DECIMAL(10,2),                -- totala priset på ordern
    FOREIGN KEY (KundID) REFERENCES Kunder(KundID) -- koppling till kunder
);

 -- Skapa Orderrader-tabellen
CREATE TABLE Orderrader (
    OrderradID INT AUTO_INCREMENT PRIMARY KEY, -- id för orderraden
    OrderID INT NOT NULL,                      -- koppling till beställning
    BokID INT NOT NULL,                        -- vilken bok som beställts
    Antal INT NOT NULL CHECK (Antal > 0),      -- antal böcker
    Pris DECIMAL(10,2) NOT NULL,               -- pris på boken i ordern
    FOREIGN KEY (OrderID) REFERENCES Bestallningar(OrderID), -- kopplar till beställningar
    FOREIGN KEY (BokID) REFERENCES Bocker(BokID)             -- kopplar till böcker
);

 -- Lägger in böcker i Bocker-tabellen
INSERT INTO Bocker (Titel, ISBN, Forfattare, Genre, Pris, Lagerstatus) VALUES
    ('Sagan om ringen', '9789876543001', 'Astrid Varve', 'Sci-Fi', 159.00, 6),
    ('Dune',            '9789876543002', 'Rune Tallberg', 'Teknik', 199.00, 3),
    ('Harry potter',          '9789876543003', 'Ella Sjögren', 'Drama', 129.00, 10);

 -- Lägger in kunder i Kunder-tabellen
INSERT INTO Kunder (Namn, Email, Telefon, Adress) VALUES
    ('Johan Frost',   'johan.frost@example.com',   '0708123456', 'Frostvägen 12'),
    ('Sara Lundqvist','sara.lund@example.com',     '0739988776', 'Björkallén 8'),
    ('Leo Nilsson',   'leo.nilsson@example.com',   '0765544332', 'Sjöglimt 3');

 -- Lägger in beställningar i Beställningar-tabellen
INSERT INTO Bestallningar (Ordernummer, KundID, Totalbelopp) VALUES
    (501, 1, 159.00),    -- order av kund 1
    (502, 2, 199.00),    -- order av kund 2
    (503, 3, 258.00);    -- order av kund 3

 -- Lägger in orderrader i Orderrader-tabellen
INSERT INTO Orderrader (OrderID, BokID, Antal, Pris) VALUES
    (1, 1, 1, 159.00),   -- kopplar bok 1 till order 1
    (2, 2, 1, 199.00),   -- kopplar bok 2 till order 2
    (3, 3, 2, 129.00);   -- kopplar bok 3 till order 3

 -- SELECT visar innehållet i tabellerna
SELECT * FROM Kunder;             -- visar kunder
SELECT * FROM Bocker;             -- visar böcker
SELECT * FROM Bestallningar;      -- visar beställningar
SELECT * FROM Orderrader;         -- visar orderrader

SELECT * FROM Kunder WHERE Namn = 'Sara Lundqvist';  -- specifik kund
SELECT * FROM Bocker WHERE Pris > 150;               -- böcker dyrare än 150
SELECT * FROM Bocker ORDER BY Pris DESC;             -- sorterar efter dyrast
SELECT OrderID FROM Orderrader WHERE Antal > 1;      -- orders med mer än 1 bok
SELECT * FROM Bestallningar WHERE Totalbelopp > 150; -- beställningar dyrare än 150