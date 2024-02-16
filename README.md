## Disclaimer.
The content on this account/repository provided solely for educational and informational purposes.
It is not intended for use in making any kind of business, investment and/or legal decisions.
Although every effort has been made to keep the information up-to-date and accurate, no representations and/or warranties, express and/or implied, completeness, accuracy, reliability, suitability, and/or availability of the content.

## SonarQube.
This can be used to setup a SonarQube Server.  
SonarQube - https://docs.sonarsource.com/sonarqube/latest/

Since the SonarQube image default uses non-root user in image and this user does not have write permission to host directory with bind mount. Need to perform followings to make it work with bind mount.
```bash
mkdir -p ./sonarqube-data/{data,logs,extensions,bundled-plugins}
chown -R 1000:1000 ./sonarqube-data
```

For backup of postgresql database we will need to create a directory and set the correct ownership.
```bash
mkdir -p ./pgsql-db/backups
chown -R 1000:1000 ./pgsql-db/backups
```

## Docker Compose Version.
Always validate that [docker-compose](https://github.com/docker/compose/releases/) version is latest.
If not then use the latest released version. As of updating this document `v2.24.0` was latest released version.

### SonarQube CE branch plugin.
This setup uses an additional plugin for branch analysis. Before proceeding further download the compatible version jar file and copy it to `sonarqube-data/extensions/plugins/` directory.  
https://github.com/mc1arke/sonarqube-community-branch-plugin?tab=readme-ov-file#compatibility

Update the corresponding version in the [docker-compose.yml](./docker-compose.yml) file.

### Starting the container.
```bash
docker-compose up -d
```

### Checking the container logs.
```bash
docker-compose logs -f
```

### Once Container is successfully created, we can access the webui in the browser - http://IPADDR_OF_SYSTEM
- Default username and password - admin/admin

### Setting up first time.
- https://docs.sonarsource.com/sonarqube/latest/analyzing-source-code/overview
- https://github.com/SonarSource/sonar-scanning-examples

### Enabling authentication using Gitlab OAuth Application.
- https://docs.sonarsource.com/sonarqube/9.9/instance-administration/authentication/gitlab/

[Backup and Restore](./configs/backup-and-restore.md)

[Upgrading SonarQube](./configs/upgrading-sonarqube.md)

[Generates Analysis Reports from SonarQube Web API](https://github.com/cnescatlab/sonar-cnes-report?tab=readme-ov-file#advanced-usage-standalone)
