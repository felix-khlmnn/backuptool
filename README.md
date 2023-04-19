# backuptool

A simple backup tool using the Docker engine for people who want to avoid messy backup shell scripts, weird crontabentries and other issues that come from non-containerized backups.  
All you need to take care of is providing a source and a target directory. 
## Configuration
The default configuration creates daily backups in the target folder, named after the day they were created. The container also creates a symlink to the latest backup.  
To get started, I recommend using a docker compose file like the following
```yaml
version: "3"

services:
  backuptool:
    image: ghcr.io/felix-khlmnn/backuptool
    restart: unless-stopped
    volumes:
      - /path/to/source/directory:/source:ro
      - /path/to/target/directory:/target
```

And that's all you need for a simple daily backup.

If you want to adjust the backup frequency, you can "simply" execute:
```bash
docker compose exec backuptool nano /crontab_configuration
docker compose restart
```
## Planned additions
- Option to enable compression on the backups
- Making the crontab configuration more accessible
