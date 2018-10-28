#!/bin/sh

eval "IP=\$${KUBERNETES_SERVICE_NAME}_SERVICE_HOST"
eval "PORT=\$${KUBERNETES_SERVICE_NAME}_SERVICE_PORT"

URL="$KUBERNETES_SERVICE_PROTOCOL$IP$PORT$PATHNAME"

status=$(curl -k -s -o /dev/null -w "%{http_code}" -X POST -d '' -u $USER: $URL)

if [ "$status" -ge 200 -a "$status" -le 299 ]; then
    echo "Success!"
else
    >&2 echo "Error, got status $status."
fi
