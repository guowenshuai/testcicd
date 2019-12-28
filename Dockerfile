FROM  golang:1.13-alpine AS builder
WORKDIR /app
COPY . ./
RUN CGO_ENABLED=0 GOOS=linux  go build -mod=vendor -o app main.go


FROM alpine:latest
#RUN apk --no-cache add ca-certificates
WORKDIR /app

COPY --from=builder /app/app .

EXPOSE 8080

CMD ["./app"]