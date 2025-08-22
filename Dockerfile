# Build stage
FROM golang:1.20-alpine AS build
WORKDIR /src

# Copy sources
COPY . .

# Build binary
RUN apk add --no-cache git && \
    go build -o /server main.go

# Final minimal image
FROM alpine:3.18
RUN apk add --no-cache ca-certificates
COPY --from=build /server /server
EXPOSE 8080
USER 1000:1000
ENTRYPOINT ["/server"]
