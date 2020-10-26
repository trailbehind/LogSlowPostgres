# LogSlowPostgres
Docker container that runs a loop logging slow postgres queries.

## Configuration
All configuration is via environment variables.
* `PGHOST` - host to connect to. Required.
* `SLOW_QUERY_LIMIT` - minimum length query to log. Defaults to "5 minutes"
* `SLEEP_INTERVAL` - interval in seconds to sleep between logging. Defaults to 300(5 minutes).

All other [standard postgres environment variables](https://www.postgresql.org/docs/9.1/libpq-envars.html) are recongized.
