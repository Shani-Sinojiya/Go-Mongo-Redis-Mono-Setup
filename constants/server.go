package constants

import "YOUR_PROJECT_NAME/config"

var (
	// server
	ServerPort = config.GetConfig().GetString("server.port")
	ServerMode = config.GetConfig().GetString("server.mode")
)
