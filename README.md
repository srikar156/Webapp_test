# Example Angular v11 web app

This is an example web app to be used with BB CI/CD for testing. It includes a web app build and an npm package build.

## Docker files

- Dockerfile.debug - Builds the development version of the web app **(used in the pipeline)**
- Dockerfile.release - Builds the production version fo the web app **(used in the pipeline)**
- Dockerfile.watch - Starts the web application in watch mode **(NOT used in the pipeline)**

## Docker compose

You can use docker-compose.yml to manage the docker containers.

Build a specific docker image specified in the docker-compose.yml file
`docker-compose build <app-name>`

Start the specific image which is specified in the docker-compose.yml file.
`docker-compose up -d <app-name>`

Tear all of the docker-compose started containers all at once
`docker-compose down`

## Build scripts

We have some linux build scripts which are used in the bitbucket-pipelines.yml file.

- build-dev.sh - Builds the development version of the web app using docker containers
- build-prod.sh - Builds the production version of the web app using docker containers
- env.sh - installs all the required dependencies and sets the required environment variables
- unit-test-app.sh - Unit tests the web app using test-headless-ci script which is inside webapp/package.json

## NPM package

The npm-package is a simple node library used as an example. We want to add a script which will build this package and upload to Azure DevOps. We don't have example scripts because we don't currently have an npm registry to upload to.

## Support

Please contact `pbes@seakeeper.com` if you want me to run over anything.
