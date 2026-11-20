<div align="center">
<img src="assets/brand-logo.svg" alt="Arya Fatthurahman" width="120" />
</div>

# InterSystems IRIS Lab

<sub>Run InterSystems IRIS Community Edition in Docker, connect over JDBC or the Management Portal, and practice SQL.</sub>

<p>
  <img src="https://img.shields.io/badge/Database-InterSystems%20IRIS-E4002B?style=flat-square" alt="Database: InterSystems IRIS" />
  <img src="https://img.shields.io/badge/Category-Multi--model%20%28SQL%20%2B%20object%20%2B%20document%29-6366F1?style=flat-square" alt="Category: Multi-model (SQL + object + document)" />
  <img src="https://img.shields.io/badge/Runs%20in-Docker-2496ED?style=flat-square&logo=docker&logoColor=white" alt="Runs in Docker" />
  <img src="https://img.shields.io/badge/License-MIT-22C55E?style=flat-square" alt="License: MIT" />
  <a href="https://github.com/devarent/intersystems-iris-lab/actions/workflows/compose-check.yml"><img src="https://github.com/devarent/intersystems-iris-lab/actions/workflows/compose-check.yml/badge.svg" alt="compose-check" /></a>
</p>

## What this lab is

InterSystems IRIS is a multi-model data platform used in healthcare and financial systems. This lab starts the Community Edition, shows the Management Portal, and gives you a SQL schema plus the JDBC settings that DBeaver and Java applications use.

## Quickstart

```bash
docker compose up -d
open http://localhost:52773/csp/sys/UtilHome.csp   # _SYSTEM / SYS
# System Explorer > SQL, then run examples/01_schema.sql and examples/02_queries.sql
docker compose exec iris iris session iris   # ObjectScript terminal
```

## Connection details

| Field | Value |
| --- | --- |
| Host | `localhost` |
| SuperServer port | `1972` |
| Management Portal | `http://localhost:52773/csp/sys/UtilHome.csp` |
| Namespace | `USER` |
| User | `_SYSTEM` |
| Password | `SYS` |
| JDBC URL | `jdbc:IRIS://localhost:1972/USER` |
| JDBC driver | `com.intersystems.jdbc.IRISDriver` |

## Examples

| File | What it shows |
| --- | --- |
| [`docker-compose.yml`](docker-compose.yml) | Engine, ports, and persistent volume. |
| [`.github/workflows/compose-check.yml`](.github/workflows/compose-check.yml) | Validates the Compose file on every push. |
| [`examples/01_schema.sql`](examples/01_schema.sql) | SQL schema in the USER namespace. |
| [`examples/02_queries.sql`](examples/02_queries.sql) | Seed data, a join, and a window function. |

## Exercises

1. Connect DBeaver with `jdbc:IRIS://localhost:1972/USER` and run the schema.
2. Create a class in ObjectScript that persists an object and inspect the generated SQL table.
3. Use `%SQL.Statement` in the IRIS terminal to run a parameterized query.
4. Change the `_SYSTEM` password in the Management Portal and update your connection.

## Notes and limits

- The Community Edition is free for development; review InterSystems licensing for other uses.
- Default credentials are `_SYSTEM` / `SYS`. Change them immediately if the port is exposed.
- The JDBC driver is not bundled with this repo; download it from InterSystems or use the DBeaver driver.
- The image is published for linux/amd64. Apple Silicon users need emulation.

## Run it from anywhere

This lab publishes its ports on `127.0.0.1` only. To use it from another country, do **not** open the database port to the internet. Pick one:

- **VPS + private tunnel:** run the lab on a small Ubuntu VPS, keep the port closed, and connect through WireGuard or `ssh -L`.
- **Managed service:** use a managed free tier for this engine and point the same examples at its connection string.
- **HTTP UI only:** if the engine has a web UI, put it behind Caddy with TLS and basic auth.

The shared checklist, provider map, and commands are in **[REMOTE-ACCESS.md](https://github.com/devarent/database-labs/blob/main/REMOTE-ACCESS.md)**.

## Cleanup

```bash
docker compose down -v
```

`-v` also removes the named volume, so the next start is a clean slate.

## References

- [IRIS documentation](https://docs.intersystems.com/irislatest/csp/docbook/DocBook.UI.Page.cls)
- [IRIS Community image](https://hub.docker.com/r/intersystemsdc/iris-community)
- [IRIS JDBC driver](https://docs.intersystems.com/irislatest/csp/docbook/DocBook.UI.Page.cls?KEY=BGJD)

---

<sub>Part of the <a href="https://github.com/devarent/database-labs">database-labs</a> collection: 26 database engines, one index.</sub>

## License

MIT (c) 2026 Arya Fatthurahman. See [LICENSE](LICENSE).
