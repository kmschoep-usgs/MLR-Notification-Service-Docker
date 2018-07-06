# MLR-Notification-Service-Docker
Docker configuration to deploy the MLR-Notification-Service service in a Docker container 

[![Build Status](https://travis-ci.org/USGS-CIDA/MLR-Notification-Service-Docker.svg?branch=master)](https://travis-ci.org/USGS-CIDA/MLR-Notification-Service-Docker) [![Coverage Status](https://coveralls.io/repos/github/USGS-CIDA/MLR-Notification-Service-Docker/badge.svg?branch=master)](https://coveralls.io/github/USGS-CIDA/MLR-Notification-Service-Docker?branch=master)

## Using Docker

### Building the Image
The docker image is built using a jar version that has been uploaded to the CIDA artifactory. The artifact version needs to be provided as follows:
```
% docker build --mlr-version=0.1-SNAPSHOT .
```

### Creating the Docker Service
On the docker manager of your swarm you can create the service to run this application by running a command such as (where `mlr_notification` is the name of the built image):
```
docker service create --name mlrnotification --publish 8080:8080 --secret source=mlr_email_config,target=application.yml --env MLR_NOTIFICATION_EMAIL_FROM="test@example.com" --env MLR_NOTIFICATION_EMAIL_TEXT="Hello" --env MLR_NOTIFICATION_EMAIL_HOST=localhost --env MLR_NOTIFICATION_EMAIL_PORT=25 --env MLR_NOTIFICATION_SERVICE_PWD="test"
```