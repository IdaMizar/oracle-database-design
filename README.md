# Oracle Database Design

 **Academic Project — Database Systems**

## Overview

This repository contains a university project focused on the **design and implementation of an Oracle relational database** for a platform that collects and manages commercial offers and promotions from shops and supermarkets.

The project covers the main stages of database design, from requirements analysis and Entity-Relationship modeling to relational design, physical implementation, SQL constraints, security, concurrency and recovery.

> **Academic project:** developed for educational purposes as part of a university Database Systems course.

---

## Project Objective

The goal was to design a database for a platform where:

- customers can register and search for active offers;
- shops and supermarkets can register and publish offers;
- customers can view offers and leave ratings and comments;
- offers can be associated with multiple products;
- products can appear in multiple offers;
- expired offers can be archived;
- users can search offers according to different criteria, including shop, product category, location and hashtags.

The original project considered a first-year workload of approximately:

- **8,000 customers**
- **2,000 shops**
- **20,000 offers**
- **100,000 products**

---

## Database Design

### 1. Requirements Analysis

The project started from the analysis of the functional and data requirements of the platform.

The main information to be managed included:

- customer and shop accounts;
- products and product categories;
- commercial offers;
- product images;
- shop contact information;
- ratings and comments;
- offer usage and visualizations.

The requirements also defined different types of database users, including a **DBA**, customers and shops.

---

### 2. Entity-Relationship Model

The conceptual design identifies the main entities of the system, including:

- `CLIENTI`
- `NEGOZI`
- `PRODOTTI`
- `OFFERTE`

Additional entities were introduced during the transformation of the conceptual model to represent multivalued attributes and relationships:

- `RECAPITI`
- `IMMAGINI`
- `PROMOZIONI`
- `VISUALIZZAZIONI`

The project also addresses the transformation of composite and multivalued attributes and the specialization of users into customers and shops.

---

### 3. Relational Model

The conceptual model was transformed into the following relational schema:

```text
CLIENTI
NEGOZI
RECAPITI
OFFERTE
PRODOTTI
IMMAGINI
PROMOZIONI
VISUALIZZAZIONI
```

A key example is the relationship between products and offers.

An offer can contain multiple products, while the same product can participate in multiple offers. This many-to-many relationship is represented through the `PROMOZIONI` table.

Its composite primary key is:

```text
(CodProdotto, CodOfferte)
```

where both attributes also reference the corresponding product and offer.

---

## Oracle Implementation

The physical implementation was designed for **Oracle Database**.

The project covers:

- relational table creation;
- primary keys;
- foreign keys;
- integrity constraints;
- Oracle sequences;
- Oracle data types;
- storage and tablespace planning;
- database roles and privileges.

The main Oracle data types used include:

```text
CHAR
VARCHAR2
NUMBER
DATE
CLOB
BLOB
```

---

## Integrity Constraints

Several business rules were translated into database constraints.

Examples include:

- ratings must be between **1 and 10**;
- discounts must be between **5% and 95%**;
- an offer's end date cannot precede its start date;
- image dimensions must be greater than zero;
- product prices must be greater than zero;
- hashtags must begin with `#`.

Referential integrity and deletion policies were also defined for dependent entities.

---

## SQL Queries

The project includes queries designed to analyze the database and obtain information such as:

- offers grouped by location;
- offers grouped by product category;
- most sold product;
- most highly rated offer;
- most successful offer;
- most frequently used hashtag;
- offer with the highest discount.

---

## Security

The database design distinguishes different user roles according to their responsibilities.

The main roles include:

```text
sg_dba
sg_negozio
sg_clienti
```

Customers and shops are assigned different permissions according to the operations they are expected to perform on the platform.

---

## Concurrency and Recovery

The project also considers database reliability and concurrent access.

The documented design includes:

- **Strict Two-Phase Locking (2PL)** for concurrency control;
- **REPEATABLE READ** as the selected isolation level;
- recovery strategies for different failure scenarios;
- archival of expired offers through the `STORICO` table.

---

## Repository Structure

```text
oracle-database-design/
│
├── README.md
│
├── docs/
│   └── Progetto BD_Ida_Leonardo.pdf
│
└── sql/
    ├── README.md
    ├── 01_schema.sql
    ├── 02_constraints.sql
    ├── 03_sequences.sql
    └── 04_security.sql
```

### SQL scripts

| File | Description |
|---|---|
| `01_schema.sql` | Database tables and primary keys |
| `02_constraints.sql` | Foreign keys and integrity constraints |
| `03_sequences.sql` | Oracle sequences |
| `04_security.sql` | Database roles and privileges |

---

## How to Use

The SQL scripts are intended for an **Oracle Database** environment.

Recommended execution order:

```text
01_schema.sql
      ↓
02_constraints.sql
      ↓
03_sequences.sql
      ↓
04_security.sql
```

The original project documentation is available in:

```text
docs/Progetto BD_Ida_Leonardo.pdf
```

---

## Academic Context

This project was developed as a **university assignment in Database Systems**.

It demonstrates the application of database design principles to a realistic commercial scenario, including conceptual modeling, relational design, physical database implementation, SQL, security, concurrency and recovery.

---

## Disclaimer

This repository represents an academic database design project and is not intended to represent a production-ready commercial system.
