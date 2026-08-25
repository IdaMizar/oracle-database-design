-- 03_sequences.sql
-- The original project states that sequences were used to generate
-- primary-key values for tables with coded identifiers.
-- The PDF does not preserve the exact original sequence definitions,
-- so the following names are a clean reconstruction.

CREATE SEQUENCE SEQ_PRODOTTI
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE SEQ_OFFERTE
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE SEQ_IMMAGINI
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE SEQ_RECAPITI
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
