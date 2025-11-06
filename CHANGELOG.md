# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Initial project structure
- Fiber web framework integration
- MongoDB and Redis database support
- JWT authentication utilities
- AES encryption helpers
- Password hashing utilities
- Phone number validation
- Configuration management with Viper
- HTTP error and success response utilities
- Security middleware (Helmet, Recover, ETag, Compression)
- Request logging with timestamps
- Docker and Docker Compose support
- CI/CD pipeline with GitHub Actions
- Comprehensive documentation

### Configuration

- Example configuration file
- Support for development and production modes
- Configurable JWT expiration
- Customizable encryption keys and rounds
- Database connection settings

### Developer Tools

- Makefile for common tasks
- Docker setup for local development
- Live reload support with Air
- Code formatting and linting scripts

## [1.0.0] - 2025-11-06

### Added

- Initial release as GitHub template repository
- Complete project scaffolding for accounts microservice
- Ready-to-use authentication infrastructure
- Production-ready middleware stack
- Comprehensive README and documentation

---

## How to Update This Changelog

When making changes:

1. Add entries under `[Unreleased]` in the appropriate category:

   - `Added` for new features
   - `Changed` for changes in existing functionality
   - `Deprecated` for soon-to-be removed features
   - `Removed` for now removed features
   - `Fixed` for any bug fixes
   - `Security` for vulnerability fixes

2. When releasing a new version:
   - Create a new section with the version number and date
   - Move items from `[Unreleased]` to the new version section
   - Update the version links at the bottom

Example:

```
## [1.1.0] - 2025-12-01

### Added
- User registration endpoint
- Email verification system

### Fixed
- JWT token refresh bug
```
