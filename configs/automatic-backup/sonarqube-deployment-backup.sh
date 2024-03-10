#!/bin/bash

# Path where the SonarQube deployment is configured.
# NEED TO REPLACE THEASE TO CORRECT PATH.
SONARQUBE_DEPLOYMENT_DIR="${HOME}/sonarqube-deployment"
SONARQUBE_DEPLOYMENT_BACKUP_PATH="${HOME}/sonarqube-deployment-backup"

# Backup directory.
BACKUP_TIME=$(date "+%d%m%Y%H%M%S")
SONARQUBE_DEPLOYMENT_BACKUP_DIR="${SONARQUBE_DEPLOYMENT_BACKUP_PATH}/${BACKUP_TIME}"

cd "${SONARQUBE_DEPLOYMENT_DIR}" || exit 1

# Backup configuration files.
mkdir -p "${SONARQUBE_DEPLOYMENT_BACKUP_DIR}"
cp -av ./sonarqube-data/extensions ./sonarqube-data/bundled-plugins "${SONARQUBE_DEPLOYMENT_BACKUP_DIR}"/

# Create backup.
mkdir -p ./pgsql-db/backups
chown -R 1000:1000 ./pgsql-db/backups
docker-compose exec -it pgsql-db /usr/bin/pg_dumpall --clean -U postgres > ./pgsql-db/backups/pgsql-db-backup.sql
mv -fv ./pgsql-db/backups/pgsql-db-backup.sql "${SONARQUBE_DEPLOYMENT_BACKUP_DIR}"/
sync
 
# Compress the backup.
cd "${SONARQUBE_DEPLOYMENT_BACKUP_PATH}" || exit 1
tar -cvzf "${BACKUP_TIME}".tar.gz "${BACKUP_TIME}"
rm -rf "${BACKUP_TIME}"
sync
