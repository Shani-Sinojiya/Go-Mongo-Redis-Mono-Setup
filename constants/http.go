// Package constants provides global constants and shared instances for the application.
package constants

import "YOUR_PROJECT_NAME/http"

var (
	HTTPSuccess = http.NewSuccess()
	HTTPErrors  = http.NewHTTPErrors()
)
