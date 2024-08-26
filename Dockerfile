# Stage 1: Build the Go binary
FROM golang:1.20 AS builder

ENV CGO_ENABLED=0 
# Set the working directory inside the container
WORKDIR /app

# Copy the entire project into the container
COPY . .

# Build the Go application
RUN go mod tidy && go build -o go-docker

# Stage 2: Create the final image
FROM alpine:latest

# Set the working directory inside the container
WORKDIR /root/

# Copy the binary from the builder stage
COPY --from=builder /app/go-docker .

# Expose the port the application runs on
EXPOSE 8080

# Command to run the binary
CMD ["./go-docker"]

