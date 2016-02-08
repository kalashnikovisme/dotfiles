# ansible-postgresql

An Ansible role for installing PostgreSQL.

## Role Variables

- `postgresql_version` - PostgreSQL version (default: `9.4`)
- `postgresql_package_version` - PostgreSQL package version (default: `"9.4.*-2.pgdg14.04+1`
- `postgresql_listen_addresses` - Address for PostgreSQL to bind to (default: `localhost`)
- `postgresql_port` - Port for PostgreSQL to bind to (default: `5432`)
- `postgresql_data_directory` - Default data directory (default: `/var/lib/postgresql/{{ postgresql_version }}/main`)
- `postgresql_max_connections` - Maximum number of connections (default: `100`)
- `postgresql_shared_buffers` - Memory for shared buffers (default: `128MB`)
- `postgresql_work_mem` - Memory for worker processes (default: `4MB`)
- `postgresql_log_autovacuum_min_duration` - Minimum duration for logging long automatic vacuuming (default: `-1`)
- `postgresql_log_min_duration_statement` - Minimum duration for logging long queries (default: `-1`)
- `postgresql_hba_mapping:` - A mapping of PostgreSQL host-based authentication rules

## Example Playbook

See the [examples](./examples/) directory.
