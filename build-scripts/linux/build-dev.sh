#! /bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

$SCRIPT_DIR/env.sh

source /tmp/env_vars.sh

# Create the docker image
docker build -f ./Dockerfile.debug -t debug-app-image . --build-arg SHORT_SHA=${SHORT_SHA} --build-arg SHA=${SHA}

docker run -it -d --name debug-container debug-app-image /bin/bash

docker cp debug-container:/app/webapp/build ./webapp/build

docker rm -f debug-container

7za a -tzip -x!assets/generated ./${BITBUCKET_REPO_SLUG}-${MajorRevision}.${MinorRevision}.${PatchVersion}.${BuildVersion}-${SHORT_SHA}-debug-${BITBUCKET_BUILD_NUMBER}.zip ./webapp/build/ > NUL ;