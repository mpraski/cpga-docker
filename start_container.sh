#!/bin/bash
# Starts an instance of the given host container, copies the main executable
# and eventually starts it with forwarded arguments. Exists after the end
# of execution
CONTAINER_ID=$(docker run -dit $1 /bin/bash)
docker cp $2 $CONTAINER_ID:/app/main_executable
docker exec $CONTAINER_ID /app/main_executable ${@:3}
docker stop $CONTAINER_ID
