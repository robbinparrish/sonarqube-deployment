## Upgrading SonarQube to latest Stable Release.

**NOTE** - Before proceeding further please make sure that you have created a backup. If not then follow [Backup and Restore](./backup-and-restore.md) to create a backup.

### Identify the latest released version.
- https://hub.docker.com/_/sonarqube/tags
- https://hub.docker.com/_/postgres/tags
- https://hub.docker.com/_/nginx/tags

Once the latest released version is identified we can update the corresponding version in the [docker-compose.yml](./../docker-compose.yml) file.

### SonarQube CE branch plugin.
This setup uses an additional plugin for branch analysis. When upgrading to the new version make sure to also upgrade this plugin as well.
https://github.com/mc1arke/sonarqube-community-branch-plugin?tab=readme-ov-file#compatibility

Download the compatible version jar file and copy it to `sonarqube-data/extensions/plugins/` directory.  
`Do not forget to remove the old files.`

Update the corresponding version in the [docker-compose.yml](./../docker-compose.yml) file.

Once version is updated, recreate container so it can use new version.

### Upgrading the container.
```bash
docker-compose up -d
```

### Checking the container logs.
```bash
docker-compose logs -f
```
