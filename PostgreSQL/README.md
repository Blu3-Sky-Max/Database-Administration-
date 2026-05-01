# PostgreSQL Labs

**Author:** Usman O. Olanrewaju (Blu3-Sky)

**Environment:** Fedora / Rocky Linux 9 — PostgreSQL 13/18


**Focus:** Client-server relational database administration using PostgreSQL

---

## Installation

```bash
$ sudo dnf install postgresql postgresql-server
$ sudo postgresql-setup --initdb
$ sudo systemctl enable --now postgresql
$ sudo systemctl status postgresql
```

---

## Accessing PostgreSQL

PostgreSQL on Linux uses **peer authentication** by default — the `postgres`
system user is trusted automatically without a password.

```bash
# Elevate to the postgres system user
sudo -i -u postgres

# Enter the interactive shell
psql
```

The shell prompt reflects the active database:

```
postgres=#     connected to the postgres database
debtors=#      connected to the debtors database
```

---

## Database Workflow

### 1. List databases

```bash
postgres=# \l

                                  List of databases
   Name    |  Owner   | Encoding |   Collate   |    Ctype    | Access privileges
-----------+----------+----------+-------------+-------------+-------------------
 debtors   | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 postgres  | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 template0 | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres
 template1 | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres
```

### 2. Connect to a database

```bash
postgres=# \c debtors
You are now connected to database "debtors" as user "postgres".
debtors=#
```

### 3. List relations (tables and views)

```bash
debtors=# \d

             List of relations
 Schema |      Name      | Type  |  Owner
--------+----------------+-------+----------
 public | DEBTORS        | table | postgres
 public | HIGHER_DEBTORS | view  | postgres
 public | SELLER         | table | postgres
```

### 4. Quit

```bash
debtors=# \q
```

---

## Essential psql Commands

| Command | Description |
|---|---|
| `\l` | List all databases |
| `\c dbname` | Connect to a database |
| `\d` | List all relations (tables, views, indexes) |
| `\dt` | List tables only |
| `\dv` | List views only |
| `\di` | List indexes only |
| `\d tablename` | Describe a table or view |
| `\d+ tablename` | Detailed description with storage info |
| `\t` | Toggle tuples-only mode (data only, no headers) |
| `\q` | Quit psql |
| `\?` | Full help for backslash commands |

---

## Running SQL Files

### From the shell

```bash
# Create a database
postgres@fedora:~$ createdb debtor

# Run a SQL file against it
postgres@fedora:~$ psql debtor < DEBTORS.sql
```

### From inside psql

```bash
debtors=# \i /path/to/DEBTORS.sql
```

### File Permission Note

The `postgres` user cannot read files inside `/home/bsky/` by default.
Two ways to fix this:

```bash
# Option 1 — allow postgres to traverse the directory
chmod o+x /home/bsky/
chmod o+r /home/bsky/yourfile.sql

# Option 2 — copy the file to /tmp (world-readable, cleared every 10 days)
cp yourfile.sql /tmp/
psql debtor < /tmp/yourfile.sql
```

---

## Clean Reset Pattern

Place this at the top of every SQL file to avoid duplicate relation errors
when re-running scripts:

```sql
DROP SCHEMA public CASCADE;
CREATE SCHEMA public;
```

This nukes all tables, views, domains, and types in the database and starts
completely fresh. No need to manually drop each object.

---

## Labs

### Lab 01 — Seller-Debtor Credit System (`DEBTORS.sql`)

A credit tracking system modelling sellers extending credit to debtors.
Designed and built from scratch on Rocky Linux 9 / Fedora.

**Concepts covered:**

- `CREATE DOMAIN` — user-defined types (PostgreSQL equivalent of C.J. Date's `CREATE TYPE`)
- `PRIMARY KEY` and `FOREIGN KEY` constraints
- Parent-child table relationship with enforced referential integrity
- `JOIN` across tables via foreign key
- `CREATE VIEW` to expose a filtered subset of data

**Schema:**

```
SELLER  ( SEL_NAME PK, DATE, AGE, SHOP )
         
        
DEBTORS ( DEB_NAME PK, AMOUNT, PRODUCT_PURCHASED, SEL_NAME FK )
```

**Sample output — full join:**

```
 SEL_NAME | DATE       | AGE | SHOP      | DEB_NAME | AMOUNT  | PRODUCT_PURCHASED
----------+------------+-----+-----------+----------+---------+------------------
 DAVID    | 2021-01-01 |  34 | CAIRO     | USMAN    | 3245.20 | TEA CUP
 IBRAHIM  | 2026-05-01 |  42 | NEW CAIRO | JHON     |  145.20 | NIKE SHOE
 DAVID    | 2021-01-01 |  34 | CAIRO     | JAMES    |   45.20 | PUMPKIN
 DAVID    | 2021-01-01 |  34 | CAIRO     | UFUK     | 1245.20 | BIKE
 DAVID    | 2021-01-01 |  34 | CAIRO     | FARUK    | 3245.30 | JET
(5 rows)
```

**View — `HIGHER_DEBTORS`:**

Exposes debtors with an outstanding balance above 500, joined with their
seller's shop name.

```sql
SELECT * FROM "HIGHER_DEBTORS";
```

```
 DEB_NAME | AMOUNT  | SHOP
----------+---------+-------
 USMAN    | 3245.20 | CAIRO
 UFUK     | 1245.20 | CAIRO
 FARUK    | 3245.30 | CAIRO
(3 rows)
```

**Run it:**

```bash
$ createdb debtor
$ psql debtor < DEBTORS.sql
```

**Key rules:**

- Foreign key always lives in the **child** table pointing up to the **parent**
- Parent table must be created **before** the child table
- Parent rows must be inserted **before** child rows
- PostgreSQL lowercases all identifiers unless wrapped in double quotes
- Double-quoted identifiers are case-sensitive — stay consistent throughout the file

---

## System Databases

PostgreSQL creates these automatically on initialization. Do not drop them.

| Database | Purpose |
|---|---|
| `postgres` | Default database for the postgres admin user |
| `template1` | Blueprint — every new database is cloned from this |
| `template0` | Clean untouched backup of template1 — never modify |

---

## Notes

- SQLite dot commands (`.headers on`, `.mode column`) are **not valid** in PostgreSQL
- `/tmp` is cleared automatically every 10 days — store permanent SQL files in home directory
- `DROP SCHEMA public CASCADE` drops all objects including custom domains and types
- PostgreSQL ships with `ecpg` for embedded SQL in C — the precompiler for `EXEC SQL` syntax
