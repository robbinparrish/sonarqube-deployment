#
# SonarQube.
# This can be used to setup a SonarQube Server.
#

SonarQube - https://docs.sonarsource.com/sonarqube/latest/

#
# Since the SonarQube image default uses non-root user in image and
# this user does not have write permission to host directory with bind
# mount. Need to perform followings to make it work with bind mount.
#
mkdir -p ./sonarqube-data/{data,logs,extensions,bundled-plugins}
chown -R 1000:1000 ./sonarqube-data

#
# Starting the container.
#
docker-compose up -d

#
# Checking the container logs.
#
docker-compose logs -f

#
# Once Container is successfully created, we can access the webui
# in the browser - http://sonarqube.mydomain.com
# Default username and password - admin/admin
#

#
# Setting up first time.
# https://docs.sonarsource.com/sonarqube/latest/analyzing-source-code/overview
# https://github.com/SonarSource/sonar-scanning-examples
#

#
# Enabling authentication using Gitlab OAuth Application.
# https://docs.sonarsource.com/sonarqube/9.9/instance-administration/authentication/gitlab/
#
