FROM alpine:3.8

ENV KUBERNETES_SERVICE_PROTOCOL http

RUN apk add --no-cache curl

COPY script.sh /bin/script.sh

RUN chmod +x /bin/script.sh

CMD /bin/script.sh
