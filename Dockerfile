# Task build stage.
FROM golang AS task-builder
ARG TASK_VERSION=main
WORKDIR /build
RUN git clone --depth 1 --branch ${TASK_VERSION} https://github.com/go-task/task.git . && \
    CGO_ENABLED=0 go build -ldflags="-w -s" -o task ./cmd/task

# Final stage, deployment as scratch image.
FROM scratch
COPY --from=task-builder /build/task /task
ENTRYPOINT ["/task"]