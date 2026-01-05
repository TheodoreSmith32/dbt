# dbt Playground 🚀

This repository is a **playground for experimenting with dbt** using different execution paths and adapters.

The goal is to understand how dbt behaves when:
- Running **directly against PostgreSQL**
- Running **through Trino as a query engine** with PostgreSQL as the underlying data source

---

## 🔧 Architecture Overview

This playground covers **two dbt execution flows**:

### 1. dbt → Trino → PostgreSQL

- dbt uses the **Trino adapter**
- Trino acts as a **distributed SQL query engine**
- PostgreSQL is accessed via Trino catalog
- Suitable for:
  - Query federation
  - Future multi-source analytics (Hive, Iceberg, etc.)
  - Performance testing via Trino

---

### 2. dbt → PostgreSQL


- dbt uses the **PostgreSQL adapter**
- Direct connection to PostgreSQL
- Suitable for:
  - Simple data transformations
  - Local development
  - Baseline performance comparison

---

## 🔌 dbt Adapters (Plugins)

This playground uses **two dbt adapters**:

1. dbt-trino
- Adapter: `dbt-trino`
- Used for:
  - Connecting dbt to Trino
  - Executing models via Trino catalogs
- Example use case:
  ```sql
  select * from postgres.public.users


2. dbt-postgres

- Adapter: dbt-postgres

- Used for:

Direct PostgreSQL transformations

Common for:

Data marts

Lightweight analytics

Local dbt experimentation


⚙️ Profiles Configuration

This project requires multiple outputs in profiles.yml to support both adapters.

Example:

trino_dev → Trino connection

postgres_dev → PostgreSQL connection

You can switch targets using:

dbt run --target trino_dev
dbt run --target postgres_dev


📝 Notes

This repository is intended for learning and experimentation

Not optimized for production usage

Configuration values (host, port, credentials) should be managed securely



📚 References

https://docs.getdbt.com/

https://trino.io/docs/

https://github.com/dbt-labs/dbt-core

https://github.com/starburstdata/dbt-trino
