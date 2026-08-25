-- 01_schema.sql
-- Reconstructed from the original university project PDF.
-- This is a GitHub-ready reconstruction, not the original lost SQL script.
-- Target DBMS: Oracle Database

-- Base entities
CREATE TABLE CLIENTI (
    Username   VARCHAR2(20) PRIMARY KEY,
    Password   VARCHAR2(20),
    Nome       VARCHAR2(15),
    Cognome    VARCHAR2(15),
    Email      VARCHAR2(30),
    Foto       BLOB
);

CREATE TABLE NEGOZI (
    Username      VARCHAR2(20) PRIMARY KEY,
    Password      VARCHAR2(20),
    Nome          VARCHAR2(15),
    Tipologia     VARCHAR2(30),
    Descrizione   CLOB,
    IndVia        VARCHAR2(30),
    IndCap        NUMBER(5),
    IndCittà      VARCHAR2(30),
    Località      VARCHAR2(30),
    Catena        CHAR(2),
    PIva          NUMBER(11),
    FAX           VARCHAR2(30),
    Latitudine    VARCHAR2(12),
    Longitudine   VARCHAR2(12)
);

CREATE TABLE PRODOTTI (
    Codice          VARCHAR2(7) PRIMARY KEY,
    Nome            VARCHAR2(15),
    Descrizione     CLOB,
    Categoria       VARCHAR2(20),
    Sottocategoria  VARCHAR2(20),
    Prezzo          NUMBER(8)
);

-- A store may have multiple telephone contacts.
CREATE TABLE RECAPITI (
    Numero          NUMBER(10) PRIMARY KEY,
    UsernameNegozio VARCHAR2(20)
);

CREATE TABLE OFFERTE (
    Codice             VARCHAR2(7) PRIMARY KEY,
    UsernameNegozio    VARCHAR2(20),
    DataInizio         DATE,
    DataFine           DATE,
    PercentualeSconto  NUMBER(3),
    Descrizione        VARCHAR2(150),
    Hashtag            VARCHAR2(20)
);

-- A product may appear in multiple offers and an offer may contain
-- multiple products.
CREATE TABLE PROMOZIONI (
    CodProdotto    VARCHAR2(7),
    CodOfferte     VARCHAR2(7),
    Stato          VARCHAR2(3),
    PrezzoScontato NUMBER(8),
    CONSTRAINT PK_PROMOZIONI PRIMARY KEY (CodProdotto, CodOfferte)
);

CREATE TABLE IMMAGINI (
    Codice       VARCHAR2(7) PRIMARY KEY,
    Dimensione   NUMBER(4),
    Foto         BLOB,
    CodProdotto  VARCHAR2(7)
);

-- A client can interact with an offer; the original project models
-- this relationship with a composite key.
CREATE TABLE VISUALIZZAZIONI (
    UsernameCliente VARCHAR2(20),
    CodOfferte      VARCHAR2(7),
    Data            DATE,
    Voto            NUMBER(2),
    Commento        CLOB,
    CONSTRAINT PK_VISUALIZZAZIONI PRIMARY KEY (UsernameCliente, CodOfferte)
);

-- Archive table added during the physical design phase.
CREATE TABLE STORICO (
    Codice       VARCHAR2(20),
    NomeProdotto VARCHAR2(15),
    NomeNegozio  VARCHAR2(15),
    DataInizio   DATE,
    DataFine     DATE,
    Voto         NUMBER(2)
);
