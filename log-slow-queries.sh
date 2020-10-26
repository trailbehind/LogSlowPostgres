#!/bin/bash
set -ex -o pipefail

# Make neccesary config is setup
if [ -z "$PGHOST"]; then echo "PGHOST not defined"; exit -1; fi
export PGUSER=${PGUSER:-postgres}

while true
do
    psql -c "
        SELECT pid, NOW() - pg_stat_activity.query_start AS duration, query, state
        FROM pg_stat_activity
        WHERE (NOW() - pg_stat_activity.query_start) > interval '${SLOW_QUERY_LIMIT:-5 minutes}' AND state = 'active';
    "
    sleep ${INTEVAL:-300}
done
