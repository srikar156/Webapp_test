#! /bin/bash

# Install all the necessary dependencies
echo "deb http://archive.debian.org/debian stretch main" > /etc/apt/sources.list
apt-get update 
apt-get install -y p7zip-full
apt-get install -y --allow-unauthenticated zip
apt-get install -y curl
apt-get install -y libgconf-2-4 libatk1.0-0 libatk-bridge2.0-0 libgdk-pixbuf2.0-0 libgtk-3-0 libgbm-dev libnss3-dev libxss-dev libasound2

# Set the correct environment variables
export SHORT_SHA=${BITBUCKET_COMMIT:0:8}
export SHA=${BITBUCKET_COMMIT}
export BITBUCKET_BRANCH=${BITBUCKET_BRANCH//\//-}

echo "export SHORT_SHA=$SHORT_SHA" > /tmp/env_vars.sh
echo "export DOCKER_BUILDKIT=1" >> /tmp/env_vars.sh
echo "export SHA=$SHA" >> /tmp/env_vars.sh
echo "export BITBUCKET_BRANCH=$BITBUCKET_BRANCH" >> /tmp/env_vars.sh

# Run the version script 
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
node $SCRIPT_DIR/../utils/set-version.js $SCRIPT_DIR/../../webapp/src/assets/version.json /tmp/env_vars.sh
