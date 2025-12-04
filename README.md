# Inlammning

Bokhandel Uppgift

Detta är min inlämning för uppgiften om att skapa en databas för en liten bokhandel.  
Databasen ska hantera böcker, kunder, beställningar och orderrader.

Här är en kort förklaring av vad min databas innehåller:

Bocker – lagrar information om varje bok (titel, ISBN, författare, genre, pris och lagerstatus).

Kunder – här finns kundernas namn, e-post, telefonnummer och adress.

Bestallningar – varje beställning kopplas till en kund och har ordernummer, datum och totalbelopp.

Orderrader – visar vilka böcker som ingår i en beställning och hur många exemplar som köpts.

Relationerna är:
 En kund kan ha flera beställningar.  
 En beställning kan ha flera orderrader.  
 Varje orderrad kopplas till en bok.  

ER-diagram

Här är ER-diagrammet som visar hur tabellerna är kopplade:

![ER-diagram](images/er-diagram.png)


I SQL-filen finns:
- skapandet av databas  
- tabeller  
- foreign keys  
- testdata (INSERT)  
- exempel på SELECT-frågor  
