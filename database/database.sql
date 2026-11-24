CREATE DATABASE IF NOT EXISTS 24_nov_devdb;
USE 24_nov_devdb;

CREATE TABLE proprietaires (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    telephone VARCHAR(15)
);

CREATE TABLE animal (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    espece VARCHAR(50) NOT NULL,
    proprietaire_id INT,
    FOREIGN KEY (proprietaire_id) REFERENCES proprietaires (id)
);

---donnees
INSERT INTO
    proprietaires (nom, telephone)
VALUES ('huhu', '0123456789'),
    ('huhu7', '0987654321');

INSERT INTO
    animal (nom, espece, proprietaire_id)
VALUES ('Fido', 'Chien', 1),
    ('Whiskers', 'Chat', 2);

---changement table
CREATE TABLE proprietaire_animal (
    id INT PRIMARY KEY AUTO_INCREMENT,
    proprietaire_id INT,
    animal_id INT,
    date_debut DATE NOT NULL,
    date_fin DATE DEFAULT NULL,
    FOREIGN KEY (proprietaire_id) REFERENCES proprietaires (id),
    FOREIGN KEY (animal_id) REFERENCES animal (id)
);

--migration des donnees de la table animal vers la table proprietaire_animal
INSERT INTO
    proprietaire_animal (
        proprietaire_id,
        animal_id,
        date_debut
    )
SELECT proprietaire_id, id, NOW()
FROM animal;

ALTER TABLE animal DROP FOREIGN KEY animal_ibfk_1;

ALTER TABLE animal DROP COLUMN proprietaire_id;

---creation table race
CREATE TABLE race (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    poids_moyen DECIMAL(5, 2) NOT NULL
);

insert INTO
    race (nom, poids_moyen)
VALUES ('A changer', 66.00),
    ('Siamois', 4.50),
    ('Labrador', 30.00),
    ('Persan', 4.00),
    ('Beagle', 10.00);

ALTER TABLE animal ADD COLUMN race_id INT;

update animal
SET race_id = (SELECT id FROM race WHERE nom = 'A changer')
WHERE race_id IS NULL;

ALTER TABLE animal ADD FOREIGN KEY (race_id) REFERENCES race (id);

--aveo manao uptade race amle animal