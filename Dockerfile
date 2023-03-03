FROM alpine:latest
ENTRYPOINT ["/bin/sh", "-c", "while true; do sleep 10; done"]