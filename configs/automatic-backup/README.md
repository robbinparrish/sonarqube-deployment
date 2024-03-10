# Perform an automatic backup of SonarQube Deployment.

## Copy backup script.
```bash
cp -a sonarqube-deployment-backup.sh /usr/bin/
chmod +x /usr/bin/sonarqube-deployment-backup.sh
```

## Update the configuration path in the backup script.
Update following in `/usr/bin/sonarqube-deployment-backup.sh`
```
SONARQUBE_DEPLOYMENT_DIR="${HOME}/sonarqube-deployment"
SONARQUBE_DEPLOYMENT_BACKUP_PATH="${HOME}/sonarqube-deployment-backup"
```

## Copy systemd unit and timer files.
```bash
cp sonarqube-deployment-backup.timer sonarqube-deployment-backup.service /etc/systemd/system/
```

## Enable the timer.
```bash
systemctl daemon-reload
systemctl enable --now sonarqube-deployment-backup.timer
```