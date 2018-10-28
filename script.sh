#!/bin/sh

UPPER_NAME=$(echo $KUBERNETES_SERVICE_NAME | tr 'a-z\-' 'A-Z_')

eval "IP=\$${UPPER_NAME}_SERVICE_HOST"
eval "PORT=\$${UPPER_NAME}_SERVICE_PORT"

URL="$KUBERNETES_SERVICE_PROTOCOL$IP:$PORT$PATHNAME"

status=$(curl -k -s -o /dev/null -w "%{http_code}" -X POST -d '' -u $USER: $URL)

if [ "$status" -ge 200 -a "$status" -le 299 ]; then
    echo "Success!"
else
    >&2 echo "Error, got status $status."
    exit 1
fi
