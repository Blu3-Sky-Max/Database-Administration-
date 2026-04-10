# SQLite3 Labs

Practical SQLite3 exercises covering table creation, data insertion, schema modification, and querying — run entirely from the terminal.

---

## Requirements

- `sqlite3` installed on your system

```bash
# Fedora/RHEL
sudo dnf install sqlite

# Debian/Ubuntu
sudo apt install sqlite3
```

---

## Files

| File | Description |
|------|-------------|
| `Student_database.sql` | Student records table with 15 columns — covers INSERT, UPDATE, and SELECT |
| `company_database.sql` | Instructor table — covers ALTER TABLE and conditional UPDATE |

---

## Usage

Load a `.sql` file into SQLite3 using input `Redirection`:

```bash
sqlite3 <database_name>.db < <sql_file>.sql
```

### Student database

```bash
$ sqlite3 Student.db < Student_database.sql
```

Expected output — all student records:

```
id  name   height  location  school                   date_of_birth  enrollment_status  major
--  -----  ------  --------  -----------------------  -------------  -----------------  ------------------
1   usman  183     istanbul  Boston University         1992-05-15                        Computer Science
2   faruk  140     cairo     United state university   1992-11-22                        History
3   bokky  120     Nigeria   bosun university          2000-01-12                        political science
4   martin 193     Istanbul  Altinbas                  2005-07-08                        computer engineering
5   Beyza  23      istanbul  Altinbas university       1996-02-21                        computer engineering
6   john           Egypt                                                                 Computer science
```

## What each file demonstrates

### `Student_database.sql`

- `DROP TABLE IF EXISTS` — safe re-run without errors
- `.headers on` / `.mode columns` — readable terminal output
- `CREATE TABLE` with mixed types: `INTEGER`, `TEXT`, `DATE`, `NUMERIC`
- `INTEGER PRIMARY KEY` — auto-increment ID
- `INSERT` with partial columns (nullable fields left out)
- `UPDATE ... WHERE id = ?` — targeted row modification
- `SELECT *` — full table dump

### `company_database.sql`

- `CREATE TABLE` with `char`, `varchar`, `numeric` types
- `INSERT` with explicit column list
- `ALTER TABLE ... ADD COLUMN` — schema modification after creation
- `UPDATE ... WHERE` — conditional row update by ID and by name
- `SELECT` specific columns with a `WHERE` filter

---

## Interactive mode

To explore a database interactively after loading it:

```bash
sqlite3 Student.db
```

Then inside the SQLite shell:

```sql
.headers on
.mode columns
SELECT * FROM Student;
SELECT name, major, gpa FROM Student WHERE gpa > 3.5;
.quit
```
