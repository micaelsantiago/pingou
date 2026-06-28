#!/bin/bash
set -e

if [ $# -gt 0 ]; then
  exec "$@"
fi

php artisan octane:start --server=roadrunner --host=0.0.0.0 --port=8000 &
OCTANE_PID=$!

while true; do
  inotifywait -r -e modify,create,delete,move \
    --exclude '(\.git/|vendor/|node_modules/|storage/|bootstrap/cache/)' \
    -q app/ config/ routes/ database/ 2>/dev/null
  php artisan octane:reload --no-interaction 2>/dev/null || true
done &

trap "kill $OCTANE_PID $WATCH_PID 2>/dev/null" EXIT
wait $OCTANE_PID
