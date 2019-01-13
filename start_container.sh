#!/bin/bash
# Starts an instance of the given host container, copies the main executable
# and eventually starts it with forwarded arguments. Exists after the end
# of execution
# $1 - image name, $2 - container name, $3 - path to executable (on local machine), rest - arguments passed to executable
CONTAINER_ID=$(docker run -dit --name $2 --network genetic-actor-net $1 /bin/bash)
printf -- "-----------\nstarted container ID: $CONTAINER_ID\n-----------\n"
docker cp $3 $CONTAINER_ID:/app/main_executable
docker exec $CONTAINER_ID /app/main_executable ${@:4}
: $(docker stop $CONTAINER_ID)
: $(docker rm $CONTAINER_ID)
printf -- "-----------\nstopped container ID: $CONTAINER_ID\n-----------\n"
