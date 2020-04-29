# cloudsql-postgresql-tooling

Scripts with the goal to enable easy usage of some PostgreSQL operations.

## INIT database
Execute
```bash
./init-db.sh
```

## Creating Schemas and Tables in PostgreSQL
Execute
```bash
./connect-db.sh
```
Provide your password when prompted, then execute:
```bash
CREATE SCHEMA MY_SCHEMA;
CREATE TABLE MY_SCHEMA.MY_TABLE (name INT, address TEXT);
exit
```

## Clean up PostgreSQL Schemas and Tables
```bash
./cleanup-db.sh
```

## Delete the PostgreSQL database
```bash
./delete-db.sh
```

