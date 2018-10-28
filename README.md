# curl-job

Runs a curl command configured by some environment variables. Used to trigger
scheduled tasks by POSTing to an HTTP(S) server in a kubernetes cluster (put it
in a `CronJob`).

## environment variables

| name | default | decription |
| ---- | ------- | ---------- |
| KUBERNETES_SERVICE_NAME | N/A | The service name for curl to make requests to. |
| KUBERNETES_SERVICE_PROTOCOL | `http` | The protocol to use for requests. |
| PATHNAME | `/` | Path of the endpoint to POST to. |
| USER | `placeholder-token` | A token to send as a basic auth user. |

The script uses the `KUBERNETES_SERVICE_NAME` environment variable to determine
the IP and port of the service to send requests to without needing to use DNS
for resolution. The assumption is that this script will run as a `CronJob` in
the same cluster as the service it makes requests to.
