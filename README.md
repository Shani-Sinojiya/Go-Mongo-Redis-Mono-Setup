# GO Mongo Redis Mono Setup

[![Go Version](https://img.shields.io/badge/Go-1.25.3-blue.svg)](https://golang.org/)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)
[![GitHub Template](https://img.shields.io/badge/GitHub-Template-blue.svg)](https://github.com/your-username/accounts/generate)

A production-ready Go microservice template for account management with built-in authentication, encryption, and database support. Built with Fiber framework, MongoDB, and Redis.

> 🚀 **Use this template**: Click the "Use this template" button above to create your own repository from this template!

---

## 📋 Table of Contents

- [Features](#features)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [API Documentation](#api-documentation)
- [Development](#development)
- [Security](#security)
- [Contributing](#contributing)
- [License](#license)

## ✨ Features

- 🚀 **High Performance**: Built with Fiber (Express-like framework for Go)
- 🔐 **JWT Authentication**: Secure token-based authentication
- 🔒 **AES Encryption**: Built-in AES encryption for sensitive data
- 🗄️ **MongoDB Integration**: NoSQL database support
- ⚡ **Redis Caching**: Fast data caching and session management
- 📱 **Phone Number Validation**: International phone number parsing
- 🛡️ **Security Middleware**: Helmet, CORS, Rate limiting ready
- 📊 **Request Logging**: Structured logging with request tracking
- 🔄 **Auto Recovery**: Panic recovery middleware
- 🗜️ **Response Compression**: Brotli compression support
- 🏷️ **ETag Support**: Efficient caching with ETags

## 🛠 Tech Stack

- **Language**: Go 1.25.3+
- **Web Framework**: [Fiber v2](https://github.com/gofiber/fiber)
- **Database**: MongoDB
- **Cache**: Redis
- **Configuration**: Viper
- **Authentication**: JWT (dgrijalva/jwt-go)
- **Encryption**: AES-256, bcrypt
- **JSON**: goccy/go-json (faster than standard encoding/json)
- **UUID**: google/uuid
- **Phone Numbers**: nyaruka/phonenumbers

## 📁 Project Structure

```
.
├── config/                 # Configuration management
│   └── main.go            # Config initialization with Viper
├── constants/             # Application constants
│   ├── database.go        # Database constants
│   ├── encryption.go      # Encryption constants
│   ├── http.go           # HTTP constants
│   └── server.go         # Server constants
├── databases/            # Database layer
│   ├── init.go          # Database initialization
│   ├── flush.go         # Database cleanup utilities
│   ├── mongodb.go       # MongoDB client
│   ├── redis.go         # Redis client
│   ├── collections/     # MongoDB collection models
│   ├── functions/       # Database functions
│   └── models/          # Data models
├── encryptions/         # Encryption utilities
│   ├── aes.go          # AES encryption/decryption
│   ├── hash.go         # Hash functions
│   ├── id.go           # ID encryption
│   └── password.go     # Password hashing
├── helpers/            # Helper functions
│   ├── jwt.go         # JWT token management
│   ├── objectId.go    # MongoDB ObjectID helpers
│   ├── phone.go       # Phone number utilities
│   └── uuid.go        # UUID generation
├── http/              # HTTP utilities
│   ├── errors.go     # Error responses
│   └── success.go    # Success responses
├── routers/          # HTTP routing
│   └── main.go      # Route initialization
├── .github/          # GitHub configuration
│   ├── workflows/   # CI/CD pipelines
│   └── ISSUE_TEMPLATE/  # Issue templates
├── config.example.yml # Example configuration
├── config.yml         # Your configuration (git-ignored)
├── go.mod            # Go module dependencies
├── main.go          # Application entry point
├── Makefile         # Build automation (20+ commands)
├── Dockerfile       # Container definition
└── docker-compose.yml  # Multi-service setup
```

## 🏗️ Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                         API Gateway (Fiber)                     │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐           │
│  │   Security   │  │   Logging    │  │ Compression  │           │
│  │  Middleware  │  │  Middleware  │  │  Middleware  │           │
│  └──────────────┘  └──────────────┘  └──────────────┘           │
└─────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│                         Routers Layer                           │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐           │
│  │    Users     │  │    Auth      │  │   Accounts   │           │
│  │   Routes     │  │   Routes     │  │   Routes     │           │
│  └──────────────┘  └──────────────┘  └──────────────┘           │
└─────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│                      Business Logic Layer                       │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐           │
│  │  Encryption  │  │   Helpers    │  │  Validation  │           │
│  │   (JWT/AES)  │  │              │  │              │           │
│  └──────────────┘  └──────────────┘  └──────────────┘           │
└─────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│                        Database Layer                           │
│  ┌──────────────────────┐      ┌──────────────────────┐         │
│  │      MongoDB         │      │        Redis         │         │
│  │  (Primary Storage)   │      │  (Cache & Sessions)  │         │
│  └──────────────────────┘      └──────────────────────┘         │
└─────────────────────────────────────────────────────────────────┘
```

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- **Go**: Version 1.25.3 or higher

  ```bash
  go version
  ```

- **MongoDB**: Version 4.4 or higher

  ```bash
  mongod --version
  ```

- **Redis**: Version 6.0 or higher
  ```bash
  redis-server --version
  ```

## 🚀 Installation

### 1. Use This Template

Click the **"Use this template"** button at the top of this repository to create your own copy.

### 2. Clone Your Repository

```bash
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name
```

### 3. Install Dependencies

```bash
go mod download
go mod verify
```

### 4. Set Up Configuration

Copy the example configuration file:

```bash
cp config.example.yml config.yml
```

Edit `config.yml` with your settings (see [Configuration](#configuration) section).

### 5. Start Required Services

**MongoDB:**

```bash
# Using default port 27017
mongod --dbpath /path/to/your/data
```

**Redis:**

```bash
# Using default port 6379
redis-server
```

### 6. Run the Application

```bash
go run main.go
```

The server will start on the port specified in your `config.yml` (default: `:6060`).

## ⚙️ Configuration

Edit `config.yml` to configure your application:

### Server Configuration

```yaml
server:
  port: ":6060" # Server port
  mode: "development" # "development" or "production"
```

### JWT Configuration

```yaml
encryption:
  jwt:
    secret: "your-secret-key-here" # Change this!
    expire: 30 # Token expiry in days
```

> ⚠️ **Important**: Generate a strong secret key for production:
>
> ```bash
> openssl rand -base64 256
> ```

### AES Encryption

```yaml
encryption:
  aes:
    key: "32-character-key-here!!!!!" # Must be 32 chars for AES-256
    ids:
      key: "32-character-key-here!!!!!"
    rounds: 16
    iv: "16-byte-iv-here!" # Must be 16 bytes for AES CBC
```

### Password Hashing

```yaml
encryption:
  password:
    rounds: 16 # bcrypt rounds
    salt: "your-salt"
    secret: "your-secret"
    prefix: "your-prefix"
```

### Database Configuration

**MongoDB:**

```yaml
databases:
  mongodb:
    uri: "mongodb://localhost:27017"
    db: "go-mongo-redis-mono"
```

**Redis:**

```yaml
databases:
  redis:
    host: "localhost"
    port: "6379"
    password: ""
    db: 0
    prefix: "go-mongo-redis-mono:"
```

## 📖 Usage

### Basic Example

```go
package main

import (
    "YOUR_PROJECT_NAME/routers"
    "YOUR_PROJECT_NAME/constants"
)

func main() {
    app := routers.Init()

    // Your routes here
    // app.Get("/", func(c *fiber.Ctx) error {
    //     return c.JSON(fiber.Map{"message": "Hello World"})
    // })

    app.Listen(constants.ServerPort)
}
```

### Adding Routes

Edit `routers/main.go` to add your API routes:

```go
api := app.Group("/api/v1")

// Example route
api.Get("/health", func(c *fiber.Ctx) error {
    return c.JSON(fiber.Map{
        "status": "healthy",
        "timestamp": time.Now(),
    })
})
```

### Using Encryption Helpers

```go
import "YOUR_PROJECT_NAME/encryptions"

// Hash a password
hashedPassword := encryptions.HashPassword("user-password")

// Generate JWT token
token := encryptions.GenerateJWT(userId)

// AES encryption
encrypted := encryptions.AESEncrypt("sensitive-data")
decrypted := encryptions.AESDecrypt(encrypted)
```

### Database Operations

```go
import (
    "YOUR_PROJECT_NAME/databases"
    "context"
)

// MongoDB
mongoClient := databases.GetMongoClient()
collection := mongoClient.Database("go-mongo-redis-mono").Collection("users")

// Redis
redisClient := databases.GetRedisClient()
redisClient.Set(context.Background(), "key", "value", 0)
```

## 📚 API Documentation

### Health Check

```http
GET /health
```

**Response:**

```json
{
  "status": "healthy",
  "timestamp": "2025-11-06T10:30:00Z"
}
```

### Error Responses

All errors follow this format:

```json
{
  "error": true,
  "message": "Error description",
  "code": 400
}
```

### Success Responses

All successful responses follow this format:

```json
{
  "success": true,
  "data": {},
  "message": "Operation successful"
}
```

## 🔧 Development

### Running in Development Mode

```bash
# Set mode in config.yml
server:
  mode: "development"

# Run with live reload (install air first)
go install github.com/cosmtrek/air@latest
air
```

### Building for Production

```bash
# Build binary
go build -o accounts-service

# Run binary
./accounts-service
```

### Running Tests

```bash
# Run all tests
go test ./...

# Run tests with coverage
go test -cover ./...

# Run tests with verbose output
go test -v ./...
```

### Code Formatting

```bash
# Format code
go fmt ./...

# Run linter
golangci-lint run
```

## 🔒 Security

### Best Practices

1. **Never commit `config.yml`** - It contains sensitive data
2. **Use environment variables** for production secrets
3. **Rotate JWT secrets** regularly
4. **Use strong AES keys** (32 characters for AES-256)
5. **Enable HTTPS** in production
6. **Update dependencies** regularly

### Environment Variables

You can override config values with environment variables:

```bash
export SERVER_PORT=":8080"
export JWT_SECRET="your-secret"
export MONGO_URI="mongodb://localhost:27017"
export REDIS_HOST="localhost"
```

### Security Middleware

The template includes these security features:

- **Helmet**: Security headers
- **CORS**: Cross-origin resource sharing
- **Rate Limiting**: (Ready to implement)
- **Request ID**: Track requests across services
- **Recover**: Panic recovery

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Coding Standards

- Follow [Effective Go](https://golang.org/doc/effective_go.html) guidelines
- Write tests for new features
- Update documentation as needed
- Use meaningful commit messages

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Fiber](https://gofiber.io/) - Express-inspired web framework
- [MongoDB](https://www.mongodb.com/) - NoSQL database
- [Redis](https://redis.io/) - In-memory data store
- [Viper](https://github.com/spf13/viper) - Configuration management

## 📞 Support

If you have any questions or need help, please:

- Open an issue on GitHub
- Check existing documentation
- Review closed issues for solutions

## 🗺️ Roadmap

- [ ] Add user registration endpoint
- [ ] Add login/logout endpoints
- [ ] Implement refresh token mechanism
- [ ] Add role-based access control (RBAC)
- [ ] Add email verification
- [ ] Add password reset flow
- [ ] Add API rate limiting
- [ ] Add comprehensive tests
- [ ] Add Docker support
- [ ] Add CI/CD pipeline
- [ ] Add API documentation (Swagger)
- [ ] Add health check endpoints

---

Made with ❤️ by Shani Sinojiya
