# Security Policy

## Supported Versions

We release patches for security vulnerabilities. Currently supported versions:

| Version | Supported          |
| ------- | ------------------ |
| 1.0.x   | :white_check_mark: |

## Reporting a Vulnerability

We take security seriously. If you discover a security vulnerability, please follow these steps:

### 1. Do Not Open a Public Issue

Please do not open a public GitHub issue if the bug is a security vulnerability.

### 2. Report via Email (Recommended)

Send a detailed report to: **security@workflecks.com** (or your security contact)

Include:

- Description of the vulnerability
- Steps to reproduce
- Potential impact
- Suggested fix (if any)
- Your contact information

### 3. Response Timeline

- **Initial Response**: Within 48 hours
- **Status Update**: Within 7 days
- **Fix Timeline**: Depends on severity (see below)

### Severity Levels

- **Critical**: Fix within 24-48 hours
- **High**: Fix within 7 days
- **Medium**: Fix within 30 days
- **Low**: Fix in next release

## Security Best Practices

When using this template, follow these security guidelines:

### Configuration

1. **Never commit `config.yml`** to version control
2. **Generate strong secrets** for production:

   ```bash
   # JWT Secret (256 bytes)
   openssl rand -base64 256

   # AES Key (32 characters)
   openssl rand -hex 16
   ```

3. **Use environment variables** in production instead of config files

### JWT Tokens

1. Set appropriate expiration times (default: 30 days)
2. Rotate JWT secrets regularly
3. Implement refresh token mechanism
4. Store tokens securely on client side

### Encryption

1. Use AES-256 (32-byte keys)
2. Never reuse initialization vectors (IV)
3. Store encryption keys securely
4. Rotate encryption keys periodically

### Passwords

1. Use bcrypt with sufficient rounds (16+)
2. Never log or display passwords
3. Implement password complexity requirements
4. Use salting (already implemented)

### Database Security

**MongoDB:**

- Enable authentication in production
- Use strong passwords
- Limit network access
- Enable SSL/TLS
- Regular backups

**Redis:**

- Set password authentication
- Bind to localhost in development
- Use SSL/TLS in production
- Disable dangerous commands

### API Security

1. **Rate Limiting**: Implement to prevent abuse
2. **CORS**: Configure properly for production
3. **Input Validation**: Validate all user inputs
4. **SQL Injection**: Use parameterized queries (MongoDB is NoSQL)
5. **XSS Protection**: Sanitize outputs
6. **CSRF Protection**: Implement for state-changing operations

### Server Security

1. **HTTPS Only**: Use TLS certificates in production
2. **Security Headers**: Already configured with Helmet middleware
3. **Error Messages**: Don't expose stack traces in production
4. **Dependencies**: Keep updated (run `go get -u ./...` regularly)

### Monitoring

1. Log authentication attempts
2. Monitor for unusual patterns
3. Set up alerts for security events
4. Regular security audits

## Known Security Considerations

### Current Implementation

This template includes:

- ✅ JWT authentication structure
- ✅ AES encryption utilities
- ✅ Password hashing with bcrypt
- ✅ Security middleware (Helmet)
- ✅ Request logging
- ✅ Panic recovery

### Not Yet Implemented (TODO)

- ⚠️ Rate limiting middleware
- ⚠️ CORS configuration
- ⚠️ Input validation middleware
- ⚠️ Refresh token mechanism
- ⚠️ Account lockout after failed attempts
- ⚠️ Two-factor authentication (2FA)

## Security Checklist for Production

Before deploying to production:

- [ ] Change all default secrets and keys
- [ ] Enable HTTPS/TLS
- [ ] Configure MongoDB authentication
- [ ] Set Redis password
- [ ] Enable rate limiting
- [ ] Configure CORS properly
- [ ] Set up monitoring and alerts
- [ ] Review and update dependencies
- [ ] Implement backup strategy
- [ ] Set up firewall rules
- [ ] Use non-root user in Docker
- [ ] Enable audit logging
- [ ] Test error handling
- [ ] Review access controls

## Vulnerability Disclosure

After a security issue is fixed:

1. We will publish a security advisory
2. Credit will be given to the reporter (if desired)
3. Details will be disclosed after users have had time to update
4. A CVE may be requested for critical issues

## Additional Resources

- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [Go Security Best Practices](https://golang.org/doc/security/)
- [MongoDB Security Checklist](https://docs.mongodb.com/manual/administration/security-checklist/)
- [Redis Security](https://redis.io/topics/security)

## Contact

For security concerns: **security@workflecks.com**

For general issues: Open a GitHub issue

---

Thank you for helping keep WorkFlecks Accounts Service secure! 🔒
