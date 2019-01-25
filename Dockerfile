FROM golang:1.11 AS builder

WORKDIR $GOPATH/src/github.com/drone-swarm-update

COPY . .

RUN go build -o /bin/swarm-update cmd/swarm-update/main.go

FROM docker:18.03.0-ce-dind
COPY --from=builder /bin/swarm-update /bin/swarm-update

ENTRYPOINT ["/bin/swarm-update"]
