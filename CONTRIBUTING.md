# Contributing to WorkFlecks Accounts Service

First off, thank you for considering contributing to WorkFlecks Accounts Service! It's people like you that make this project such a great tool.

## Code of Conduct

By participating in this project, you are expected to uphold our Code of Conduct:

- Be respectful and inclusive
- Be collaborative
- Be professional
- Focus on what is best for the community

## How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check the existing issues to avoid duplicates. When you create a bug report, include as many details as possible:

- **Use a clear and descriptive title**
- **Describe the exact steps to reproduce the problem**
- **Provide specific examples**
- **Describe the behavior you observed and what you expected**
- **Include screenshots if applicable**
- **Note your environment** (Go version, OS, etc.)

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. When creating an enhancement suggestion, include:

- **Use a clear and descriptive title**
- **Provide a detailed description of the proposed feature**
- **Explain why this enhancement would be useful**
- **List any alternatives you've considered**

### Pull Requests

1. **Fork the repo** and create your branch from `main`
2. **Make your changes** following our coding standards
3. **Add tests** if you've added code that should be tested
4. **Update documentation** if you've changed APIs
5. **Ensure tests pass** by running `go test ./...`
6. **Format your code** with `go fmt ./...`
7. **Write a clear commit message**

## Development Process

### Setting Up Your Development Environment

```bash
# Clone your fork
git clone https://github.com/your-username/accounts.git
cd accounts

# Install dependencies
go mod download

# Copy configuration
cp config.example.yml config.yml

# Start required services (MongoDB, Redis)
# ... start your services ...

# Run the application
go run main.go
```

### Coding Standards

- Follow [Effective Go](https://golang.org/doc/effective_go.html) guidelines
- Use `gofmt` for formatting
- Use `golint` for linting
- Write clear, self-documenting code
- Add comments for complex logic
- Keep functions small and focused

### Naming Conventions

- **Files**: Use snake_case (e.g., `user_handler.go`)
- **Packages**: Use lowercase, single word (e.g., `routers`, `helpers`)
- **Functions**: Use PascalCase for exported, camelCase for private
- **Variables**: Use camelCase
- **Constants**: Use PascalCase or UPPER_SNAKE_CASE

### Testing

- Write unit tests for new features
- Aim for high test coverage
- Use table-driven tests where appropriate
- Mock external dependencies

```go
func TestUserCreation(t *testing.T) {
    tests := []struct {
        name    string
        input   User
        want    error
    }{
        {"valid user", User{Name: "John"}, nil},
        {"empty name", User{Name: ""}, ErrEmptyName},
    }

    for _, tt := range tests {
        t.Run(tt.name, func(t *testing.T) {
            got := CreateUser(tt.input)
            if got != tt.want {
                t.Errorf("got %v, want %v", got, tt.want)
            }
        })
    }
}
```

### Commit Messages

Write clear, concise commit messages:

```
Add user authentication endpoint

- Implement JWT token generation
- Add login/logout handlers
- Update tests for auth flow
```

Format:

- First line: Brief summary (50 chars or less)
- Blank line
- Detailed description if needed
- Use present tense ("Add feature" not "Added feature")

### Branch Naming

Use descriptive branch names:

- `feature/user-authentication`
- `bugfix/redis-connection`
- `hotfix/security-patch`
- `docs/api-documentation`

## Project Structure Guidelines

When adding new features, follow the existing structure:

- **Config**: Configuration-related code goes in `config/`
- **Constants**: Application constants in `constants/`
- **Databases**: Database logic in `databases/`
- **Encryption**: Security utilities in `encryptions/`
- **Helpers**: Generic helper functions in `helpers/`
- **HTTP**: HTTP utilities in `http/`
- **Routers**: Route definitions in `routers/`

## Documentation

- Update README.md for user-facing changes
- Add godoc comments for exported functions
- Update API documentation for endpoint changes
- Include examples in documentation

Example of good documentation:

```go
// HashPassword hashes a plain text password using bcrypt.
// It returns the hashed password as a string.
//
// Example:
//   hashed := HashPassword("mypassword123")
func HashPassword(password string) string {
    // implementation
}
```

## Review Process

1. All submissions require review
2. Reviewers will check:
   - Code quality and standards
   - Test coverage
   - Documentation
   - Performance implications
3. Address review comments promptly
4. Be open to feedback and suggestions

## Getting Help

- Check existing issues and pull requests
- Read the documentation thoroughly
- Ask questions in issue comments
- Reach out to maintainers if stuck

## Recognition

Contributors will be recognized in:

- The project's contributors list
- Release notes for significant contributions
- Special mentions for major features

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

Thank you for contributing to WorkFlecks Accounts Service! 🎉
