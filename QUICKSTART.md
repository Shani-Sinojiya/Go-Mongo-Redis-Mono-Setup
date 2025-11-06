# Quick Start Guide

Get up and running with WorkFlecks Accounts Service in 5 minutes!

## Prerequisites Check

Make sure you have these installed:

```bash
# Check Go version (need 1.25.3+)
go version

# Check if MongoDB is available
mongod --version

# Check if Redis is available
redis-server --version

# Check if make is available (optional but recommended)
make --version
```

## Option 1: Quick Start with Make (Recommended)

```bash
# 1. Clone from template
# (Use GitHub's "Use this template" button, then clone your repo)
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name

# 2. Setup everything automatically
make setup

# 3. Edit config.yml with your settings
nano config.yml  # or use your favorite editor

# 4. Start MongoDB and Redis (with Docker)
make services-start

# 5. Run the application
make run
```

## Option 2: Docker Compose (Easiest)

```bash
# 1. Clone from template
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name

# 2. Copy configuration
cp config.example.yml config.yml

# 3. Edit config.yml if needed
nano config.yml

# 4. Start everything with Docker
docker-compose up -d

# 5. View logs
docker-compose logs -f
```

## Option 3: Manual Setup

### Step 1: Clone and Setup

```bash
# Clone from template
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name

# Copy configuration
cp config.example.yml config.yml

# Install dependencies
go mod download
```

### Step 2: Configure

Edit `config.yml`:

```yaml
server:
  port: ":6060"
  mode: "development"

encryption:
  jwt:
    secret: "CHANGE-THIS-TO-A-STRONG-SECRET" # Important!
    expire: 30

databases:
  mongodb:
    uri: "mongodb://localhost:27017"
    db: "workflecks"

  redis:
    host: "localhost"
    port: "6379"
    password: ""
    db: 0
```

### Step 3: Start Services

**MongoDB:**

```bash
# Option A: System service
sudo systemctl start mongodb

# Option B: Docker
docker run -d --name mongo -p 27017:27017 mongo:latest

# Option C: Direct
mongod --dbpath /path/to/your/data
```

**Redis:**

```bash
# Option A: System service
sudo systemctl start redis

# Option B: Docker
docker run -d --name redis -p 6379:6379 redis:latest

# Option C: Direct
redis-server
```

### Step 4: Run

```bash
go run main.go
```

## Verify Installation

Open another terminal and test:

```bash
# Test if server is running
curl http://localhost:6060/

# Should see a 404 response (expected, no routes yet)
```

## Next Steps

### 1. Add Your First Route

Edit `routers/main.go`:

```go
func Init() *fiber.App {
    // ... existing code ...

    // Add this before the 404 handler:
    app.Get("/health", func(c *fiber.Ctx) error {
        return c.JSON(fiber.Map{
            "status": "healthy",
            "timestamp": time.Now(),
        })
    })

    // ... rest of code ...
}
```

Test it:

```bash
curl http://localhost:6060/health
```

### 2. Add Your First API Endpoint

Create `routers/users.go`:

```go
package routers

import (
    "github.com/gofiber/fiber/v2"
)

func SetupUserRoutes(app *fiber.App) {
    api := app.Group("/api/v1/users")

    api.Get("/", func(c *fiber.Ctx) error {
        return c.JSON(fiber.Map{
            "message": "User list endpoint",
        })
    })

    api.Post("/register", func(c *fiber.Ctx) error {
        // TODO: Implement registration
        return c.JSON(fiber.Map{
            "message": "Register endpoint",
        })
    })
}
```

Update `routers/main.go`:

```go
func Init() *fiber.App {
    // ... existing code ...

    // Add before 404 handler:
    SetupUserRoutes(app)

    // ... rest of code ...
}
```

### 3. Add Database Models

Create `databases/models/user.go`:

```go
package models

import (
    "time"
    "go.mongodb.org/mongo-driver/bson/primitive"
)

type User struct {
    ID        primitive.ObjectID `json:"id" bson:"_id,omitempty"`
    Email     string             `json:"email" bson:"email"`
    Password  string             `json:"-" bson:"password"`
    Name      string             `json:"name" bson:"name"`
    CreatedAt time.Time          `json:"created_at" bson:"created_at"`
    UpdatedAt time.Time          `json:"updated_at" bson:"updated_at"`
}
```

## Development Tips

### Live Reload

Install and use Air for automatic reloading:

```bash
# Install air
go install github.com/cosmtrek/air@latest

# Run with live reload
make dev
# or
air
```

### Available Make Commands

```bash
make help          # Show all commands
make build         # Build the app
make run           # Run the app
make test          # Run tests
make fmt           # Format code
make lint          # Run linter
make clean         # Clean build files
```

### Useful Docker Commands

```bash
# View logs
docker-compose logs -f

# Stop services
docker-compose down

# Rebuild and restart
docker-compose up -d --build

# Clean everything
docker-compose down -v
```

## Troubleshooting

### Port Already in Use

```bash
# Find what's using port 6060
lsof -i :6060

# Kill the process
kill -9 <PID>
```

### MongoDB Connection Failed

```bash
# Check if MongoDB is running
pgrep mongod

# Check MongoDB logs
tail -f /var/log/mongodb/mongod.log

# Test connection
mongosh --eval "db.version()"
```

### Redis Connection Failed

```bash
# Check if Redis is running
redis-cli ping
# Should respond: PONG

# Check Redis logs
tail -f /var/log/redis/redis-server.log
```

### Module Not Found

```bash
# Clean and reinstall
go clean -modcache
go mod download
go mod tidy
```

## Getting Help

- 📖 Read the [full README](README.md)
- 🐛 Check [existing issues](https://github.com/your-username/your-repo/issues)
- 💬 Open a new issue for bugs
- 📧 Email support for other questions

## What's Next?

1. Read the [full documentation](README.md)
2. Check out the [API examples](#)
3. Review [security best practices](SECURITY.md)
4. Join our community
5. Star the repository if you find it useful!

---

Happy coding! 🚀
