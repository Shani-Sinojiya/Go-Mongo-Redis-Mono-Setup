package databases

import (
	"context"

	"YOUR_PROJECT_NAME/constants"
)

func RedisFlush() error {
	info := RedisClient.Del(context.Background(), constants.DatabaseRedisPrefix+"*")
	return info.Err()
}
