# Setup Checklist

After cloning this template, follow this checklist to customize it for your project.

## Initial Setup

- [ ] **Update project name** in `go.mod`

  - Change `YOUR_PROJECT_NAME` to your module name (e.g., `github.com/username/project`)
  - Run `go mod tidy` after changing

- [ ] **Update imports** across all files

  - Search and replace `YOUR_PROJECT_NAME` with your module name
  - Files to update: all `.go` files

- [ ] **Create config.yml**

  ```bash
  cp config.example.yml config.yml
  ```

- [ ] **Generate secure secrets**

  ```bash
  # JWT Secret (256 bytes)
  openssl rand -base64 256

  # AES Key (32 characters)
  openssl rand -hex 16

  # AES IV (16 bytes)
  openssl rand -hex 8
  ```

- [ ] **Update config.yml** with your settings
  - [ ] Change JWT secret
  - [ ] Change AES encryption keys
  - [ ] Update database URIs
  - [ ] Set appropriate server port
  - [ ] Configure mode (development/production)

## Repository Setup

- [ ] **Update README.md**

  - [ ] Change project name
  - [ ] Update description
  - [ ] Add your repository URL
  - [ ] Update contact information
  - [ ] Add your team/author info

- [ ] **Update LICENSE** (if needed)

  - [ ] Change copyright holder name
  - [ ] Update year

- [ ] **Update SECURITY.md**

  - [ ] Add your security contact email
  - [ ] Adjust supported versions

- [ ] **Update CONTRIBUTING.md**

  - [ ] Add contribution guidelines specific to your project
  - [ ] Update contact information

- [ ] **Update CODE_OF_CONDUCT.md**
  - [ ] Add enforcement contact email

## GitHub Settings

- [ ] **Enable template repository**

  - Settings → Options → Template repository ✓

- [ ] **Configure branch protection**

  - Settings → Branches → Add rule for `main`
  - Require pull request reviews
  - Require status checks to pass

- [ ] **Add repository topics**

  - golang, fiber, mongodb, redis, jwt, microservice, template

- [ ] **Update repository description**

  - Short description of your project

- [ ] **Enable Issues and Discussions** (optional)

  - Settings → Features

- [ ] **Set up GitHub Actions secrets** (if using CI/CD)
  - Settings → Secrets and variables → Actions
  - Add: `DOCKER_USERNAME`, `DOCKER_PASSWORD` (if pushing to Docker Hub)

## Development Environment

- [ ] **Install dependencies**

  ```bash
  go mod download
  ```

- [ ] **Set up databases**

  - [ ] Install MongoDB (or use Docker)
  - [ ] Install Redis (or use Docker)
  - [ ] Or use: `make services-start`

- [ ] **Test the setup**

  ```bash
  make run
  # or
  go run main.go
  ```

- [ ] **Install development tools** (optional)

  ```bash
  # Air for live reload
  go install github.com/cosmtrek/air@latest

  # golangci-lint for linting
  go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
  ```

## Customization

- [ ] **Add your routes**

  - Edit `routers/main.go`
  - Create new route files in `routers/`

- [ ] **Add database models**

  - Create models in `databases/models/`

- [ ] **Add database collections**

  - Create collection files in `databases/collections/`

- [ ] **Add database functions**

  - Create function files in `databases/functions/`

- [ ] **Customize middleware**

  - Update `routers/main.go` with your middleware

- [ ] **Add custom constants**
  - Add to files in `constants/` directory

## Docker Setup (Optional)

- [ ] **Update Dockerfile** (if needed)

  - Adjust Go version
  - Add custom build steps

- [ ] **Update docker-compose.yml**

  - [ ] Update service names
  - [ ] Configure environment variables
  - [ ] Adjust ports if needed
  - [ ] Uncomment accounts service when ready

- [ ] **Test Docker build**

  ```bash
  docker build -t your-service-name .
  ```

- [ ] **Test Docker Compose**
  ```bash
  docker-compose up -d
  ```

## Documentation

- [ ] **Update API documentation**

  - Document your endpoints in README.md
  - Or use Swagger/OpenAPI

- [ ] **Add examples**

  - Create examples/ directory
  - Add usage examples

- [ ] **Update CHANGELOG.md**
  - Document initial version
  - Add your changes

## Testing

- [ ] **Write tests**

  - Add test files (`*_test.go`)
  - Test critical functionality

- [ ] **Run tests**

  ```bash
  make test
  # or
  go test ./...
  ```

- [ ] **Check coverage**
  ```bash
  make test-coverage
  ```

## Production Preparation

- [ ] **Security audit**

  - [ ] Review all secrets and keys
  - [ ] Check encryption settings
  - [ ] Enable HTTPS/TLS
  - [ ] Configure CORS
  - [ ] Add rate limiting
  - [ ] Review security checklist in SECURITY.md

- [ ] **Performance optimization**

  - [ ] Enable production mode
  - [ ] Configure caching
  - [ ] Set up monitoring
  - [ ] Configure logging

- [ ] **Deployment setup**
  - [ ] Choose hosting platform
  - [ ] Set up CI/CD pipeline
  - [ ] Configure environment variables
  - [ ] Set up backups

## Final Steps

- [ ] **Remove this checklist**

  - Delete `SETUP_CHECKLIST.md` after completing setup

- [ ] **Make initial commit**

  ```bash
  git add .
  git commit -m "Initial setup from template"
  git push origin main
  ```

- [ ] **Create first release**

  - Tag: `v1.0.0`
  - Include changelog

- [ ] **Announce your project** 🎉
  - Share with your team
  - Post on social media
  - Submit to awesome lists

---

## Quick Commands Reference

```bash
# Setup
make setup

# Development
make dev          # Run with live reload
make run          # Run normally
make test         # Run tests
make fmt          # Format code

# Build
make build        # Build binary

# Docker
make docker-build # Build Docker image
make services-start # Start MongoDB & Redis

# Clean
make clean        # Remove build files
```

## Need Help?

- 📖 Read [QUICKSTART.md](QUICKSTART.md)
- 📚 Check [README.md](README.md)
- 🐛 Open an issue
- 💬 Start a discussion

---

**Note**: Delete this file after completing your setup!
