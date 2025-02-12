# **SQL Befehle**

## **Tabelle Erstellen**

```sql
CREATE TABLE Teilnehmer (
    TeilnehmerID INT PRIMARY KEY AUTO_INCREMENT,
    Vorname VARCHAR(50) NOT NULL,
    Nachname VARCHAR(50) NOT NULL,
    Geburtsdatum DATE,
    Email VARCHAR(100) UNIQUE,
    Registrierungsdatum TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

Erstellt die Tabelle Teilnehmer mit Feldern für **ID**, **Name**, **Geburtsdatum**, **Email** und **Registrierungsdatum**.

| TeilnehmerID | Vorname | Nachname | Geburtsdatum | Email                          | Registrierungsdatum       |
|--------------|---------|----------|--------------|--------------------------------|---------------------------|
| INT          | VARCHAR(50) | VARCHAR(50) | DATE         | VARCHAR(100) (UNIQUE)         | TIMESTAMP (DEFAULT CURRENT_TIMESTAMP) |

---

## **Relationen Bauen**

```sql
CREATE TABLE Adresse (
    id INT PRIMARY KEY AUTO_INCREMENT,
    Stadt VARCHAR(100) NOT NULL,
    Vorwahl VARCHAR(10) NOT NULL,
    Straße VARCHAR(150) NOT NULL,
    TeilnehmerID INT,
    FOREIGN KEY (TeilnehmerID) REFERENCES Teilnehmer(TeilnehmerID)
);
```

Erstellt die Tabelle Adresse mit Feldern für **ID**, **Stadt**, **Vorwahl**, **Straße** und eine **TeilnehmerID**, die auf die Teilnehmer-Tabelle verweist.

| id   | Stadt   | Vorwahl | Straße    | TeilnehmerID |
|------|---------|---------|-----------|--------------|
| INT  | VARCHAR(100) | VARCHAR(10) | VARCHAR(150) | INT|

## **Neue Spalte Einfügen**

```sql
ALTER TABLE Adresse
ADD COLUMN Hausnummer VARCHAR(10) NOT NULL;
```

Fügt der Adresse-Tabelle eine **neue Spalte** Hausnummer hinzu, die einen Wert vom Typ VARCHAR(10) erwartet und nicht leer sein darf.

| id   | Stadt   | Vorwahl | Straße    | TeilnehmerID | Hausnummer  |
|------|---------|---------|-----------|--------------|-------------|
| INT  | VARCHAR(100) | VARCHAR(10) | VARCHAR(150) | INT          | VARCHAR(10) |

---

## **Add Teilnehmer**

```sql
INSERT INTO Teilnehmer (Vorname, Nachname, Geburtsdatum, Email)
VALUES
    ('Max', 'Mustermann', '1990-05-15', 'max.mustermann@example.com'),
    ('Anna', 'Schmidt', '1985-08-22', 'anna.schmidt@example.com'),
    ('Tom', 'Müller', '1995-03-10', 'tom.mueller@example.com'),
    ('Lisa', 'Fischer', '1992-07-30', 'lisa.fischer@example.com'),
    ('Paul', 'Wagner', '1988-11-12', 'paul.wagner@example.com'),
    ('Julia', 'Becker', '1994-02-25', 'julia.becker@example.com'),
    ('Felix', 'Hoffmann', '1991-09-18', 'felix.hoffmann@example.com'),
    ('Sarah', 'Schulz', '1987-04-05', 'sarah.schulz@example.com'),
    ('David', 'Koch', '1993-12-20', 'david.koch@example.com'),
    ('Laura', 'Bauer', '1996-06-08', 'laura.bauer@example.com');
```

Fügt zehn neue Teilnehmer mit Vornamen, Nachnamen, Geburtsdaten und E-Mail-Adressen in die Teilnehmer-Tabelle ein.

| TeilnehmerID | Vorname      | Nachname    | Geburtsdatum | Email                          | Registrierungsdatum       |
|--------------|--------------|-------------|--------------|--------------------------------|---------------------------|
| 1            | Max          | Mustermann  | 1990-05-15   | <max.mustermann@example.com>     | (automatisch gesetzt)     |
| 2            | Anna         | Schmidt     | 1985-08-22   | <anna.schmidt@example.com>       | (automatisch gesetzt)     |
| 3            | Tom          | Müller      | 1995-03-10   | <tom.mueller@example.com>        | (automatisch gesetzt)     |
| 4            | Lisa         | Fischer     | 1992-07-30   | <lisa.fischer@example.com>       | (automatisch gesetzt)     |
| 5            | Paul         | Wagner      | 1988-11-12   | <paul.wagner@example.com>        | (automatisch gesetzt)     |
| 6            | Julia        | Becker      | 1994-02-25   | <julia.becker@example.com>       | (automatisch gesetzt)     |
| 7            | Felix        | Hoffmann    | 1991-09-18   | <felix.hoffmann@example.com>     | (automatisch gesetzt)     |
| 8            | Sarah        | Schulz      | 1987-04-05   | <sarah.schulz@example.com>       | (automatisch gesetzt)     |
| 9            | David        | Koch        | 1993-12-20   | <david.koch@example.com>         | (automatisch gesetzt)     |
| 10           | Laura        | Bauer       | 1996-06-08   | <laura.bauer@example.com>        | (automatisch gesetzt)     |

---

## **Add Adresse**

```sql
INSERT INTO Adresse (Stadt, Vorwahl, Straße, Hausnummer, TeilnehmerID)
VALUES
    ('Berlin', '030', 'Hauptstraße', '15', 1),
    ('Berlin', '089', 'Nebenstraße', '22A', 2),
    ('Berlin', '040', 'Bahnhofstraße', '5', 3),
    ('Frankfurt', '0221', 'Rathausstraße', '10', 4),
    ('Frankfurt', '069', 'Parkstraße', '8B', 5),
    ('Frankfurt', '0711', 'Lindenstraße', '3', 6),
    ('Berlin', '0211', 'Friedrichstraße', '20', 7),
    ('Bremen', '0341', 'Goethestraße', '12', 8),
    ('Bremen', '0351', 'Altstadtstraße', '4', 9),
    ('Bremen', '0421', 'Weserstraße', '7', 10);
```

Fügt zehn neue Adressen mit Stadt, Vorwahl, Straße, Hausnummer und der TeilnehmerID in die Adresse-Tabelle ein, wobei jede Adresse einem Teilnehmer zugeordnet wird.

| id   | Stadt    | Vorwahl | Straße         | Hausnummer | TeilnehmerID |
|------|----------|---------|----------------|------------|--------------|
| 1    | Berlin   | 030     | Hauptstraße    | 15         | 1            |
| 2    | Berlin  | 089     | Nebenstraße    | 22A        | 2            |
| 3    | Berlin  | 040     | Bahnhofstraße  | 5          | 3            |
| 4    | Frankfurt| 0221    | Rathausstraße  | 10         | 4            |
| 5    | Frankfurt| 069     | Parkstraße     | 8B         | 5            |
| 6    | Frankfurt| 0711    | Lindenstraße   | 3          | 6            |
| 7    | Berlin  | 0211    | Friedrichstraße| 20         | 7            |
| 8    | Bremen   | 0341    | Goethestraße   | 12         | 8            |
| 9    | Bremen   | 0351    | Altstadtstraße | 4          | 9            |
| 10   | Bremen   | 0421    | Weserstraße    | 7          | 10           |

---

## Select all

```sql
SELECT * FROM Teilnehmer;
```

Gibt **alle** Spalten und Zeilen aus der Teilnehmer-Tabelle zurück

| TeilnehmerID | Vorname | Nachname | Geburtsdatum | Email                          | Registrierungsdatum       |
|--------------|---------|----------|--------------|--------------------------------|---------------------------|
| 1            | Max     | Mustermann| 1990-05-15   | <max.mustermann@example.com>     | (automatisch gesetzt)     |
| 2            | Anna    | Schmidt  | 1985-08-22   | <anna.schmidt@example.com>       | (automatisch gesetzt)     |
| 3            | Tom     | Müller   | 1995-03-10   | <tom.mueller@example.com>        | (automatisch gesetzt)     |
| 4            | Lisa    | Fischer  | 1992-07-30   | <lisa.fischer@example.com>       | (automatisch gesetzt)     |
| 5            | Paul    | Wagner   | 1988-11-12   | <paul.wagner@example.com>        | (automatisch gesetzt)     |
| 6            | Julia   | Becker   | 1994-02-25   | <julia.becker@example.com>       | (automatisch gesetzt)     |
| 7            | Felix   | Hoffmann | 1991-09-18   | <felix.hoffmann@example.com>     | (automatisch gesetzt)     |
| 8            | Sarah   | Schulz   | 1987-04-05   | <sarah.schulz@example.com>       | (automatisch gesetzt)     |
| 9            | David   | Koch     | 1993-12-20   | <david.koch@example.com>         | (automatisch gesetzt)     |
| 10           | Laura   | Bauer    | 1996-06-08   | <laura.bauer@example.com>        | (automatisch gesetzt)     |

---

## **Select bestimmte Spalten**

```sql
SELECT Email FROM Teilnehmer;
```

Gibt nur die Email-Spalte aus der Teilnehmer-Tabelle zurück.

| Email                          |
|--------------------------------|
| <max.mustermann@example.com>     |
| <anna.schmidt@example.com>       |
| <tom.mueller@example.com>        |
| <lisa.fischer@example.com>       |
| <paul.wagner@example.com>        |
| <julia.becker@example.com>       |
| <felix.hoffmann@example.com>     |
| <sarah.schulz@example.com>       |
| <david.koch@example.com>         |
| <laura.bauer@example.com>        |

```sql
SELECT Hausnummer FROM Adresse;
```

Gibt nur die Hausnummer-Spalte aus der Adresse-Tabelle zurück.

| Hausnummer |
|------------|
| 15         |
| 22A        |
| 5          |
| 10         |
| 8B         |
| 3          |
| 20         |
| 12         |
| 4          |
| 7          |

```sql
SELECT TeilnehmerID, Straße FROM Adresse;
```

Gibt die TeilnehmerID und Straße-Spalten aus der Adresse-Tabelle zurück.

| TeilnehmerID | Straße         |
|--------------|----------------|
| 1            | Hauptstraße    |
| 2            | Nebenstraße    |
| 3            | Bahnhofstraße  |
| 4            | Rathausstraße  |
| 5            | Parkstraße     |
| 6            | Lindenstraße   |
| 7            | Friedrichstraße|
| 8            | Goethestraße   |
| 9            | Altstadtstraße |
| 10           | Weserstraße    |

---

## Select Distinct

```sql
SELECT DISTINCT Stadt FROM Adresse;
```

Gibt die **einzigartigen** Werte (keine Duplikate) der Stadt-Spalte aus der Adresse-Tabelle zurück.

| Stadt      |
|------------|
| Berlin     |
| Frankfurt  |
| Bremen     |

---

## **Select where (select mit Voraussetzungen)**

```sql
SELECT Vorname, Nachname, Geburtsdatum, Email
FROM Teilnehmer
WHERE Email = 'max.mustermann@example.com';
```

Gibt die Vorname, Nachname, Geburtsdatum und Email des Teilnehmers mit der Email-Adresse '<max.mustermann@example.com>' aus der Teilnehmer-Tabelle zurück.

| Vorname | Nachname | Geburtsdatum | Email                        |
|---------|----------|--------------|------------------------------|
| Max     | Mustermann | 1990-05-15 | <max.mustermann@example.com>   |

```sql
SELECT Vorname, Nachname, Registrierungsdatum
FROM Teilnehmer
WHERE Geburtsdatum > '1990-01-01';
```

Gibt die Vorname, Nachname und Registrierungsdatum der Teilnehmer zurück, deren Geburtsdatum nach dem 01.01.1990 liegt.

| Vorname | Nachname  | Registrierungsdatum |
|---------|-----------|---------------------|
| Anna    | Schmidt   | (automatisch gesetzt)|
| Lisa    | Fischer   | (automatisch gesetzt)|
| Julia   | Becker    | (automatisch gesetzt)|
| Felix   | Hoffmann  | (automatisch gesetzt)|
| David   | Koch      | (automatisch gesetzt)|
| Laura   | Bauer     | (automatisch gesetzt)|

```sql
SELECT Straße, Hausnummer, Vorwahl
FROM Adresse
WHERE Stadt = 'Berlin';
```

Gibt die Straße, Hausnummer und Vorwahl der Teilnehmer aus der Adresse-Tabelle zurück, bei denen die Stadt 'Berlin' ist.

| Straße         | Hausnummer | Vorwahl |
|----------------|------------|---------|
| Hauptstraße    | 15         | 030     |
| Nebenstraße    | 22A        | 089     |
| Bahnhofstraße  | 5          | 040     |
| Friedrichstraße| 3          | 0711    |

---

## **Neue teinehmer Einfügen**

```sql
INSERT INTO Teilnehmer (Vorname, Nachname, Geburtsdatum, Email)
VALUES ('Michael', 'Weber', '1998-12-05', 'michael.weber@example.com');
```

| TeilnehmerID | Vorname  | Nachname  | Geburtsdatum | Email                      |
|-------------|----------|-----------|--------------|----------------------------|
| 1           | Max      | Mustermann| 1990-05-15   | <max.mustermann@example.com> |
| 2           | Anna     | Schmidt   | 1985-08-22   | <anna.schmidt@example.com>   |
| 3           | Tom      | Müller    | 1995-03-10   | <tom.mueller@example.com>    |
| 4           | Lisa     | Fischer   | 1992-07-30   | <lisa.fischer@example.com>   |
| 5           | Paul     | Wagner    | 1988-11-12   | <paul.wagner@example.com>    |
| 6           | Julia    | Becker    | 1994-02-25   | <julia.becker@example.com>   |
| 7           | Felix    | Hoffmann  | 1991-09-18   | <felix.hoffmann@example.com> |
| 8           | Sarah    | Schulz    | 1987-04-05   | <sarah.schulz@example.com>   |
| 9           | David    | Koch      | 1993-12-20   | <david.koch@example.com>     |
| 10          | Laura    | Bauer     | 1996-06-08   | <laura.bauer@example.com>    |
| 11          | Michael  | Weber     | 1998-12-05   | <michael.weber@example.com>  |

---

## **INNER JOIN**

```sql
SELECT Teilnehmer.Vorname, Teilnehmer.Nachname, Adresse.Straße
FROM Teilnehmer
INNER JOIN Adresse ON Teilnehmer.TeilnehmerID = Adresse.TeilnehmerID;
```

Gibt die Vornamen, Nachnamen und Straßennamen aller Teilnehmer zurück, die eine Adresse haben. **Teilnehmer ohne Adresse werden ausgeschlossen**.

| Vorname  | Nachname  | Straße          |
|----------|----------|----------------|
| Max      | Mustermann | Hauptstraße    |
| Anna     | Schmidt    | Nebenstraße    |
| Tom      | Müller     | Bahnhofstraße  |
| Lisa     | Fischer    | Rathausstraße  |
| Paul     | Wagner     | Parkstraße     |
| Julia    | Becker     | Lindenstraße   |
| Felix    | Hoffmann   | Friedrichstraße|
| Sarah    | Schulz     | Goethestraße   |
| David    | Koch       | Altstadtstraße |
| Laura    | Bauer      | Weserstraße    |

---

## **LEFT JOIN**

```sql
SELECT Teilnehmer.Vorname, Teilnehmer.Nachname, Adresse.Straße
FROM Teilnehmer
LEFT JOIN Adresse ON Teilnehmer.TeilnehmerID = Adresse.TeilnehmerID;
```

Gibt die Vornamen, Nachnamen und Straßennamen aller Teilnehmer zurück. **Teilnehmer ohne Adresse werden ebenfalls angezeigt**, aber mit NULL für die Straße.

| Vorname  | Nachname  | Straße          |
|----------|----------|----------------|
| Max      | Mustermann | Hauptstraße    |
| Anna     | Schmidt    | Nebenstraße    |
| Tom      | Müller     | Bahnhofstraße  |
| Lisa     | Fischer    | Rathausstraße  |
| Paul     | Wagner     | Parkstraße     |
| Julia    | Becker     | Lindenstraße   |
| Felix    | Hoffmann   | Friedrichstraße|
| Sarah    | Schulz     | Goethestraße   |
| David    | Koch       | Altstadtstraße |
| Laura    | Bauer      | Weserstraße    |
| **Michael**  | **Weber**      | **NULL**  |

### **Wichtiger Hinweis**: Beim INNER JOIN werden nur die Teilnehmer angezeigt, die eine Adresse in der Adress-Tabelle haben. Beim LEFT JOIN hingegen werden alle Teilnehmer angezeigt, unabhängig davon, ob sie eine Adresse haben oder nicht

---

## **Alias**

```sql
SELECT Vorname AS Teilnehmer_Vornamen
FROM Teilnehmer;
```

Dieser SQL-Befehl gibt die Vornamen der Teilnehmer aus der Teilnehmer-Tabelle zurück und **benennt** die Spalte in Teilnehmer_Vornamen **um**.

| Teilnehmer_Vornamen |
|---------------------|
| Max                 |
| Anna                |
| Tom                 |
| Lisa                |
| Paul                |
| Julia               |
| Felix               |
| Sarah               |
| David               |
| Laura               |
| Michael             |

---

## **add noten zur Teilnehmern Tabelle**

```sql
ALTER TABLE Teilnehmer
ADD COLUMN Note INT CHECK (Note >= 0 AND Note <= 100);
```

Dieser SQL-Befehl fügt eine neue Spalte namens Note zur Teilnehmer-Tabelle hinzu. Die Note-Spalte ist vom Datentyp INT und akzeptiert nur Werte im Bereich von 0 bis 100.

---

## **Add Noten jeweils Teilnehmer**

```sql
UPDATE Teilnehmer
SET Note = 
  CASE 
    WHEN TeilnehmerID = 1 THEN 85
    WHEN TeilnehmerID = 2 THEN 40
    WHEN TeilnehmerID = 3 THEN 48
    WHEN TeilnehmerID = 4 THEN 92
    WHEN TeilnehmerID = 5 THEN 85
    WHEN TeilnehmerID = 6 THEN 20
    WHEN TeilnehmerID = 7 THEN 78
    WHEN TeilnehmerID = 8 THEN 62
    WHEN TeilnehmerID = 9 THEN 58
    WHEN TeilnehmerID = 10 THEN 22
    WHEN TeilnehmerID = 11 THEN 48
  END;
```

Dieser SQL-Befehl aktualisiert die Note-Spalte für jeden Teilnehmer basierend auf der TeilnehmerID. Jede TeilnehmerID erhält eine spezifische Note.

| TeilnehmerID | Vorname  | Nachname  | Geburtsdatum | Email                        | Registrierungsdatum | Note |
|--------------|----------|-----------|--------------|------------------------------|---------------------|------|
| 1            | Max      | Mustermann| 1990-05-15   | <max.mustermann@example.com>    | 2021-01-01          | 85   |
| 2            | Anna     | Schmidt   | 1985-08-22   | <anna.schmidt@example.com>      | 2021-02-01          | 40   |
| 3            | Tom      | Müller    | 1995-03-10   | <tom.mueller@example.com>       | 2021-03-01          | 48   |
| 4            | Lisa     | Fischer   | 1992-07-30   | <lisa.fischer@example.com>      | 2021-04-01          | 92   |
| 5            | Paul     | Wagner    | 1988-11-12   | <paul.wagner@example.com>       | 2021-05-01          | 85   |
| 6            | Julia    | Becker    | 1994-02-25   | <julia.becker@example.com>      | 2021-06-01          | 20   |
| 7            | Felix    | Hoffmann  | 1991-09-18   | <felix.hoffmann@example.com>    | 2021-07-01          | 78   |
| 8            | Sarah    | Schulz    | 1987-04-05   | <sarah.schulz@example.com>      | 2021-08-01          | 62   |
| 9            | David    | Koch      | 1993-12-20   | <david.koch@example.com>        | 2021-09-01          | 58   |
| 10           | Laura    | Bauer     | 1996-06-08   | <laura.bauer@example.com>       | 2021-10-01          | 22   |
| 10           | Michael    | Weber     | 1998-12-05   | <michael.bauer@example.com>       | 2021-10-01          | 48   |

---

## **Group by**

```sql
SELECT Stadt, COUNT(*) AS Anzahl_Teilnehmer
FROM Adresse
GROUP BY Stadt;
```

Dieser SQL-Befehl zählt die Anzahl der Teilnehmer pro Stadt und gruppiert das Ergebnis nach Stadt.
**Erklärung:**
COUNT(*) zählt die Anzahl der Zeilen (Teilnehmer) in jeder Stadt.
GROUP BY Stadt gruppiert die Teilnehmer nach der Stadt.

| Stadt     | Anzahl_Teilnehmer |
|-----------|-------------------|
| Berlin    | 4                 |
| Frankfurt | 3                 |
| Bremen    | 3                 |

```sql
SELECT a.Stadt, COUNT(t.TeilnehmerID) AS Anzahl_Bestandene_Teilnehmer
FROM Teilnehmer AS t
INNER JOIN Adresse AS a ON t.TeilnehmerID = a.TeilnehmerID
WHERE t.Note >= 50
GROUP BY a.Stadt;
```

Dieser SQL-Befehl zählt die Anzahl der bestandenen Teilnehmer (Note ≥ 50) pro Stadt und verwendet einen INNER JOIN, um nur Teilnehmer anzuzeigen, die eine zugehörige Adresse haben.

| Stadt     | Anzahl_Bestandene_Teilnehmer |
|-----------|------------------------------|
| Berlin    | 2                            |
| Frankfurt | 2                            |
| Bremen    | 2                            |

---

## **Order By**

```sql
SELECT t.Vorname, t.Nachname, t.Note
FROM Teilnehmer AS t
ORDER BY t.Note ASC;
```

Dieser SQL-Befehl gibt die Vorname, Nachname und Note der Teilnehmer aus, sortiert nach der **Note** in **aufsteigender** Reihenfolge.

| Vorname | Nachname | Note |
|---------|----------|------|
| Julia   | Becker   | 20   |
| Tom     | Müller   | 40   |
| David   | Koch     | 48   |
| Michael | Weber    | 48   |
| Laura   | Bauer    | 58   |
| Felix   | Hoffmann | 62   |
| Sarah   | Schulz   | 78   |
| Max     | Mustermann | 85 |
| Paul    | Wagner   | 85   |
| Lisa    | Fischer  | 92   |

```sql
SELECT t.Vorname, t.Nachname, t.Note
FROM Teilnehmer AS t
ORDER BY t.Nachname DESC, t.Vorname DESC;
```

Dieser SQL-Befehl gibt die Vorname, Nachname und Note der Teilnehmer aus, sortiert nach **Nachname und Vorname** in **absteigender** Reihenfolge.

| Vorname | Nachname | Note |
|---------|----------|------|
| Michael | Weber    | 48   |
| Paul    | Wagner   | 85   |
| Sarah   | Schulz   | 78   |
| Anna    | Schmidt  | 40   |
| Max     | Mustermann | 85 |
| Tom     | Müller   | 40   |
| David   | Koch     | 48   |
| Felix   | Hoffmann | 62   |
| Lisa    | Fischer  | 92   |
| Julia   | Becker   | 20   |
| Laura   | Bauer    | 58   |

---

## **Funktionen**

```sql
SELECT AVG(Note) AS Durchschnittsnote
FROM Teilnehmer;
```

Dieser SQL-Befehl berechnet den **Durchschnitt** der Noten aller Teilnehmer.

| Durchschnittsnote |
|-------------------|
| 58             |

```sql
SELECT COUNT(TeilnehmerID) AS Anzahl_Teilnehmer
FROM Teilnehmer ;
```

Dieser SQL-Befehl zählt die **Anzahl** der Teilnehmer in der Teilnehmer-Tabelle.

| Anzahl_Teilnehmer |
|-------------------|
| 11                |

```sql
SELECT SUM(Note) AS Gesamtnote
FROM Teilnehmer ;
```

Dieser SQL-Befehl berechnet die **Summe** aller Noten der Teilnehmer in der Teilnehmer-Tabelle und gibt das Ergebnis als Gesamtnote zurück.

| Gesamtnote |
|------------|
| 638        |

```sql
SELECT MAX(Note) AS HöchsteNote
FROM Teilnehmer ;
```

Dieser SQL-Befehl gibt die **höchste** Note der Teilnehmer in der Teilnehmer-Tabelle zurück und benennt das Ergebnis als HöchsteNote.

| HöchsteNote |
|-------------|
| 92          |

```sql
SELECT MIN(Note) AS **NiedrigsteNote**
FROM Teilnehmer ;
```

Dieser SQL-Befehl gibt die niedrigste Note der Teilnehmer in der Teilnehmer-Tabelle zurück und benennt das Ergebnis als NiedrigsteNote.

| NiedrigsteNote |
|----------------|
| 20             |

```sql
SELECT FIRST(t.Note) AS ErsteNote, LAST(t.Note) AS LetzteNote
FROM Teilnehmer AS t;
```

Dieser SQL-Befehl gibt die **erste** und die **letzte** Note aus der Teilnehmer-Tabelle zurück.

| ErsteNote | LetzteNote |
|-----------|------------|
| 85        | 48         |

```sql
SELECT DATE(Registrierungsdatum) AS Registrierungsdatum_ohne_Zeit
FROM Teilnehmer ;
```

Dieser SQL-Befehl gibt das Registrierungsdatum der Teilnehmer ohne die Zeitangabe zurück. Die Zeit wird entfernt, und es wird nur das Datum (Jahr, Monat, Tag) angezeigt.

| Registrierungsdatum_ohne_Zeit |
|-------------------------------|
| 2023-05-01                    |
| 2022-11-15                    |
| 2021-03-22                    |
| 2020-07-30                    |
| 2021-12-15                    |
| 2022-02-25                    |
| 2021-09-18                    |
| 2020-04-05                    |
| 2021-12-20                    |
| 2021-06-08                    |

```sql
SELECT DAY(Geburtsdatum) AS Tag
FROM Teilnehmer ;
```

Der Befehl extrahiert den **Tag** des Geburtsdatums jedes Teilnehmers und gibt ihn in einer neuen Spalte mit dem Namen "Tag" zurück.

| Tag  |
|------|
| 15   |
| 22   |
| 10   |
| 30   |
| 12   |
| 25   |
| 18   |
| 05   |
| 20   |
| 08   |
| 05   |

```sql
SELECT MONTH(Geburtsdatum) AS Monat
FROM Teilnehmer ;
```

es extrahiert den **Monat** des Geburtsdatums jedes Teilnehmers und gibt ihn in einer neuen Spalte mit dem Namen "Monat" zurück.

| Monat |
|-------|
| 5     |
| 8     |
| 3     |
| 7     |
| 11    |
| 2     |
| 9     |
| 4     |
| 12    |
| 6     |
| 12    |

```sql
SELECT YEAR(Geburtsdatum) AS Jahr
FROM Teilnehmer ;
```

es extrahiert den **Jahr** des Geburtsdatums jedes Teilnehmers und gibt ihn in einer neuen Spalte mit dem Namen "Jahr" zurück.

| Jahr |
|------|
| 1990 |
| 1985 |
| 1995 |
| 1992 |
| 1988 |
| 1994 |
| 1991 |
| 1987 |
| 1993 |
| 1996 |
| 1998 |

```sql
SELECT CURDATE() AS Heute;
```

gibt das **aktuelle Datum** zurück

| Heute      |
|------------|
| 2025-02-12 |

```sql
SELECT WEEKDAY(Geburtsdatum) AS Wochentag
FROM Teilnehmer ;
```

es gibt den Wochentag (als Zahl) für jedes Geburtsdatum der Teilnehmer zurück, wobei 0 für Montag, 1 für Dienstag, und so weiter bis 6 für Sonntag steht.

| Wochentag |
|-----------|
| 0         |
| 1         |
| 3         |
| 5         |
| 2         |
| 5         |
| 6         |
| 0         |
| 0         |
| 2         |
| 6         |

```sql
SELECT DAYNAME(Geburtsdatum) AS Wochentag_Name
FROM Teilnehmer ;
```

 es gibt den Namen des Wochentages (z.B. Montag, Dienstag, ...) für jedes Geburtsdatum der Teilnehmer zurück.

| Wochentag_Name |
|----------------|
| Monday         |
| Tuesday        |
| Sunday         |
| Friday         |
| Wednesday      |
| Friday         |
| Saturday       |
| Monday         |
| Monday         |
| Wednesday      |
| Saturday       |

---

## **Operatoren**

```sql
SELECT Vorname, Nachname
FROM Teilnehmer
WHERE Geburtsdatum > '1990-01-01' AND Note >= 50;
```

gibt die Vornamen und Nachnamen der Teilnehmer zurück, deren Geburtsdatum nach dem 1. Januar 1990 liegt und deren Note mindestens 50 beträgt.

| Vorname | Nachname  |
|---------|-----------|
| Max     | Mustermann|
| Lisa    | Fischer   |
| Felix   | Hoffmann  |
| David   | Koch      |

```sql
SELECT t.Vorname, t.Nachname
FROM Teilnehmer AS t
INNER JOIN Adresse AS a ON t.TeilnehmerID = a.TeilnehmerID
WHERE t.Note < 50 OR a.Stadt = 'Frankfurt';
```

Diese Abfrage gibt alle Teilnehmer Vor und Nachnamen mit einer Note unter 50 oder mit der Stadt 'Frankfurt' in der Adresse zurück

| Vorname  | Nachname  |
|----------|-----------|
| Anna     | Schmidt   |
| Tom      | Müller    |
| Lisa     | Fischer   |
| Paul     | Wagner    |
| Julia    | Becker    |
| Laura    | Bauer     |

```sql
SELECT t.Vorname, t.Nachname
FROM Teilnehmer AS t
INNER JOIN Adresse AS a ON t.TeilnehmerID = a.TeilnehmerID
WHERE a.Stadt != 'Frankfurt';
```

Dieser SQL-Befehl gibt die Vornamen und Nachnamen der Teilnehmer zurück, deren Stadt nicht 'Frankfurt' ist

| Vorname  | Nachname   |
|----------|------------|
| Max      | Mustermann |
| Anna      | Schmidt |
| Tom      | Müller     |
| Julia    | Becker     |
| Felix    | Hoffmann   |
| Sarah    | Schulz     |
| David    | Koch       |
| Laura    | Bauer      |

```sql
SELECT t.Vorname, t.Nachname
FROM Teilnehmer AS t
INNER JOIN Adresse AS a ON t.TeilnehmerID = a.TeilnehmerID
WHERE (t.Note >= 50 AND a.Stadt = 'Berlin') OR (t.Note < 50 AND a.Stadt = 'Frankfurt');
```

Es zeigt die Teilnehmer, die entweder eine Note von 50 oder mehr in Berlin haben oder eine Note von weniger als 50 in Frankfurt.

| Vorname | Nachname |
|---------|----------|
| Max     | Mustermann |
| Felix     | Hoffmann |
| Julia    | Becker    |

---

## **Like**

```sql
SELECT Vorname, Nachname
FROM Teilnehmer
WHERE Vorname LIKE 'A%';
```

Es sucht alle Teilnehmer, deren Vorname mit dem Buchstaben "A" **beginnt**.

| Vorname | Nachname  |
|---------|-----------|
| Anna    | Schmidt   |

```sql
SELECT Vorname, Nachname
FROM Teilnehmer
WHERE Vorname LIKE 'A_';
```

Es sucht nach Teilnehmern, deren Vorname mit dem Buchstaben "A" **beginnt** und **nur** ein weiteres Zeichen danach enthält.

| Vorname | Nachname  |
|---------|-----------|

```sql
SELECT Vorname, Nachname
FROM Teilnehmer
WHERE Vorname LIKE '%a%';
```

sucht nach Vornamen, die den Buchstaben "a" an **beliebiger** Stelle enthalten.

| Vorname  | Nachname  |
|----------|-----------|
| Max      | Mustermann|
| Anna     | Schmidt   |
| Lisa     | Fischer   |
| Paul     | Wagner    |
| Julia    | Becker    |
| Sarah    | Schulz    |
| David    | Koch      |
| Laura    | Bauer     |
| Michael  | Weber     |

```sql
SELECT Vorname, Nachname
FROM Teilnehmer
WHERE Vorname LIKE '_a%';
```

sucht nach Vornamen, bei denen der **zweite Buchstabe** ein "a" ist.

| Vorname | Nachname  |
|---------|-----------|
| Max     | Mustermann|
| Paul     | Wagner    |
| Sarah   | Schulz    |
| David    | Koch      |
| Laura    | Bauer     |

---

## **Tabelle Löschen**

```sql
DROP TABLE Teilnehmer;
```

Wenn wir die Tabelle **Teilnehmer** löschen, wird die Tabelle **Adresse** auch **automatisch** **gelöscht**, weil die Relation zwischen den beiden eine **Komposition** ist. Falls wir die Relation jedoch als **Aggregation** gestalten möchten, sollte die Erstellung der Tabelle Adresse wie folgt aussehen:

```sql
CREATE TABLE Adresse (
    id INT PRIMARY KEY AUTO_INCREMENT,
    Stadt VARCHAR(100) NOT NULL,
    Vorwahl VARCHAR(10) NOT NULL,
    Straße VARCHAR(150) NOT NULL,
    TeilnehmerID INT,
    FOREIGN KEY (TeilnehmerID) REFERENCES Teilnehmer(TeilnehmerID) ON DELETE CASCADE
);
````