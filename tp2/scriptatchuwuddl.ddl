-- Généré par Oracle SQL Developer Data Modeler 20.4.0.374.0801
--   à :        2022-05-02 21:15:52 EDT
--   site :      Oracle Database 11g
--   type :      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE adresse (
    id_adresse                  NUMBER NOT NULL,
    rue                         VARCHAR2(25 CHAR) NOT NULL,
    code_civique                NUMBER NOT NULL,
    apt_suite                   VARCHAR2 (30 CHAR)
    ,
    ville_etc                   VARCHAR2(55 CHAR) NOT NULL,
    province                    VARCHAR2(25 CHAR) NOT NULL, 
     NOT NULL,
    utilisateur_id_utilisateur  NUMBER NOT NULL
);

CREATE UNIQUE INDEX adresse__idx ON
    adresse (
        utilisateur_id_utilisateur
    ASC );

ALTER TABLE adresse ADD CONSTRAINT adresse_pk PRIMARY KEY ( id_adresse );

CREATE TABLE captureur (
    id_captureur        NUMBER NOT NULL,
    date_banni          DATE,
    date_certification  DATE NOT NULL
);

ALTER TABLE captureur ADD CONSTRAINT captureur_pk PRIMARY KEY ( id_captureur );

CREATE TABLE produit (
    id_produit                  NUMBER NOT NULL,
    desc_produit                VARCHAR2(200 CHAR) NOT NULL,
    titre_produit               VARCHAR2(60 CHAR) NOT NULL,
    date_debut                  DATE,
    date_vente                  DATE,
    id_utilisateur              NUMBER NOT NULL,
    id_captureur                NUMBER NOT NULL,
    prix_actuel                 NUMBER NOT NULL,
    utilisateur_id_utilisateur  NUMBER NOT NULL,
    captureur_id_captureur      NUMBER NOT NULL
);

CREATE UNIQUE INDEX produit__idx ON
    produit (
        captureur_id_captureur
    ASC );

ALTER TABLE produit ADD CONSTRAINT produit_pk PRIMARY KEY ( id_produit );

CREATE TABLE utilisateur (
    id_utilisateur  NUMBER NOT NULL,
    id_adresse      NUMBER,
    date_banni      DATE,
    mdpasse         VARCHAR2(35 CHAR) NOT NULL,
    email           VARCHAR2(100 CHAR) NOT NULL
);

ALTER TABLE utilisateur ADD CONSTRAINT utilisateur_pk PRIMARY KEY ( id_utilisateur );

ALTER TABLE adresse
    ADD CONSTRAINT adresse_utilisateur_fk FOREIGN KEY ( utilisateur_id_utilisateur )
        REFERENCES utilisateur ( id_utilisateur );

ALTER TABLE produit
    ADD CONSTRAINT produit_captureur_fk FOREIGN KEY ( captureur_id_captureur )
        REFERENCES captureur ( id_captureur );

ALTER TABLE produit
    ADD CONSTRAINT produit_utilisateur_fk FOREIGN KEY ( utilisateur_id_utilisateur )
        REFERENCES utilisateur ( id_utilisateur );

INSERT INTO Captureur (date_certification, id_captureur) 
    VALUES ('20220501 21:33:00 PM', 1);
    
ALTER TABLE 
    ADD CONSTRAINT dflt_captureur_date_certification
    DEFAULT CURRENT_DATE;
    
ALTER TABLE produit 
    ADD visible_public VARCHAR (6 CHAR) NOT NULL;
    
ALTER TABLE produit
    ADD CONSTRAINT ck_produit_visible_public 
    CHECK (visible_public ='public' OR visible_public = 'prive')
    ADD CONSTRAINT dflt_produit_visible_public
    DEFAULT 'prive';

ALTER TABLE adresse
ADD code_postal VARCHAR (6 CHAR) NOT NULL;

INSERT INTO utilisateur (id_utilisateur, mdpasse, email)  
    VALUES (1, 'P4$$W0RD', 'littlelemoncutie@gmail.com');
    
INSERT INTO adresse (id_adresse, rue, code_civique, Ville_etc, province, id_utilisateur)
    VALUES (1, 'Letondal', 2567, 'Laval', 'Québec', 1);
    
UPDATE utilisateur
    SET id_adresse = 1
    WHERE id_utilisateur = 1;

INSERT INTO produit (id_produit, desc_produit, titre_produit, id_captureur, visible_public) 
    VALUES (1,'Un bel éternuement bien humide de Taylor Swift, plein de sa COVID. Encore neuf !',
            'Covid de Taylor Swift', 1, 'prive');

-- Rapport récapitulatif d'Oracle SQL Developer Data Modeler : 
-- 
-- CREATE TABLE                             4
-- CREATE INDEX                             2
-- ALTER TABLE                              7
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   2
-- WARNINGS                                 0
