#!/bin/bash
set -e

rm -f /open-weather/tmp/pids/server.pid

exec "$@"
