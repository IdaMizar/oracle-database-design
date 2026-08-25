-- 04_security.sql
-- Reconstructed from the documented security requirements.
-- Exact usernames/passwords from the original implementation are not
-- available in the PDF, so no credentials are hard-coded here.

-- Example roles:
CREATE ROLE sg_negozio;
CREATE ROLE sg_clienti;

-- The original project specifies that:
-- * sg_negozio can insert, modify and delete its offers.
-- * sg_clienti can consult/search offers and use them.
--
-- The exact GRANT statements should be adapted to the application
-- architecture and Oracle account used to deploy the database.

GRANT SELECT ON OFFERTE TO sg_clienti;
GRANT SELECT ON PRODOTTI TO sg_clienti;
GRANT SELECT ON PROMOZIONI TO sg_clienti;
GRANT SELECT ON NEGOZI TO sg_clienti;

GRANT SELECT, INSERT, UPDATE, DELETE ON OFFERTE TO sg_negozio;
GRANT SELECT ON PRODOTTI TO sg_negozio;
GRANT SELECT ON PROMOZIONI TO sg_negozio;
