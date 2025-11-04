#! /bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

$SCRIPT_DIR/env.sh

source /tmp/env_vars.sh

docker build -f ./Dockerfile.release -t release-app-image . --build-arg SHORT_SHA=${SHORT_SHA} --build-arg SHA=${SHA}

docker run -it -d --name release-container release-app-image /bin/bash

docker cp release-container:/app/webapp/build ./webapp/build

docker rm -f release-container

7za a -tzip -x!assets/generated ./${BITBUCKET_REPO_SLUG}-${MajorRevision}.${MinorRevision}.${PatchVersion}.${BuildVersion}-${SHORT_SHA}-release-${BITBUCKET_BUILD_NUMBER}.zip ./webapp/build/ > NUL ;
