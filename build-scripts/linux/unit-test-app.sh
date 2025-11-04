#! /bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

$SCRIPT_DIR/env.sh

source /tmp/env_vars.sh

# Install all the web app dependencies
cd webapp
npm install
npm run test-headless-ci
TEST_EXIT_CODE=$?
exit $TEST_EXIT_CODE