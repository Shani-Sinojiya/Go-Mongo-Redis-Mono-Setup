.PHONY: help build run test clean install fmt lint docker-build docker-run

# Variables
APP_NAME=accounts-service
BUILD_DIR=./bin
MAIN_FILE=main.go

# Colors for terminal output
GREEN=\033[0;32m
YELLOW=\033[0;33m
NC=\033[0m # No Color

help: ## Display this help screen
	@echo "$(GREEN)Available commands:$(NC)"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  $(YELLOW)%-15s$(NC) %s\n", $$1, $$2}'

install: ## Install dependencies
	@echo "$(GREEN)Installing dependencies...$(NC)"
	go mod download
	go mod verify
	@echo "$(GREEN)Dependencies installed!$(NC)"

build: ## Build the application
	@echo "$(GREEN)Building $(APP_NAME)...$(NC)"
	@mkdir -p $(BUILD_DIR)
	go build -o $(BUILD_DIR)/$(APP_NAME) $(MAIN_FILE)
	@echo "$(GREEN)Build complete! Binary: $(BUILD_DIR)/$(APP_NAME)$(NC)"

run: ## Run the application
	@echo "$(GREEN)Running $(APP_NAME)...$(NC)"
	go run $(MAIN_FILE)

dev: ## Run with live reload (requires air)
	@echo "$(GREEN)Starting development server with live reload...$(NC)"
	@which air > /dev/null || (echo "$(YELLOW)Installing air...$(NC)" && go install github.com/cosmtrek/air@latest)
	air

test: ## Run tests
	@echo "$(GREEN)Running tests...$(NC)"
	go test -v ./...

test-coverage: ## Run tests with coverage
	@echo "$(GREEN)Running tests with coverage...$(NC)"
	go test -cover ./... -coverprofile=coverage.out
	go tool cover -html=coverage.out -o coverage.html
	@echo "$(GREEN)Coverage report generated: coverage.html$(NC)"

fmt: ## Format code
	@echo "$(GREEN)Formatting code...$(NC)"
	go fmt ./...
	@echo "$(GREEN)Code formatted!$(NC)"

lint: ## Run linter
	@echo "$(GREEN)Running linter...$(NC)"
	@which golangci-lint > /dev/null || (echo "$(YELLOW)Installing golangci-lint...$(NC)" && go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest)
	golangci-lint run ./...

vet: ## Run go vet
	@echo "$(GREEN)Running go vet...$(NC)"
	go vet ./...

clean: ## Clean build files
	@echo "$(GREEN)Cleaning...$(NC)"
	rm -rf $(BUILD_DIR)
	rm -f coverage.out coverage.html
	@echo "$(GREEN)Clean complete!$(NC)"

setup: ## Initial setup (copy config, install deps)
	@echo "$(GREEN)Setting up project...$(NC)"
	@if [ ! -f config.yml ]; then \
		cp config.example.yml config.yml; \
		echo "$(YELLOW)Created config.yml from config.example.yml$(NC)"; \
		echo "$(YELLOW)Please edit config.yml with your settings!$(NC)"; \
	else \
		echo "$(YELLOW)config.yml already exists$(NC)"; \
	fi
	@$(MAKE) install
	@echo "$(GREEN)Setup complete!$(NC)"

deps-update: ## Update dependencies
	@echo "$(GREEN)Updating dependencies...$(NC)"
	go get -u ./...
	go mod tidy
	@echo "$(GREEN)Dependencies updated!$(NC)"

docker-build: ## Build Docker image
	@echo "$(GREEN)Building Docker image...$(NC)"
	docker build -t $(APP_NAME):latest .
	@echo "$(GREEN)Docker image built!$(NC)"

docker-run: ## Run Docker container
	@echo "$(GREEN)Running Docker container...$(NC)"
	docker run -p 6060:6060 --env-file .env $(APP_NAME):latest

mongo-start: ## Start MongoDB with Docker
	@echo "$(GREEN)Starting MongoDB...$(NC)"
	docker run -d --name accounts-mongo -p 27017:27017 mongo:latest
	@echo "$(GREEN)MongoDB started on port 27017$(NC)"

redis-start: ## Start Redis with Docker
	@echo "$(GREEN)Starting Redis...$(NC)"
	docker run -d --name accounts-redis -p 6379:6379 redis:latest
	@echo "$(GREEN)Redis started on port 6379$(NC)"

services-start: mongo-start redis-start ## Start MongoDB and Redis

services-stop: ## Stop MongoDB and Redis containers
	@echo "$(GREEN)Stopping services...$(NC)"
	docker stop accounts-mongo accounts-redis || true
	docker rm accounts-mongo accounts-redis || true
	@echo "$(GREEN)Services stopped!$(NC)"

all: clean install build test ## Clean, install deps, build, and test
	@echo "$(GREEN)All tasks completed!$(NC)"
