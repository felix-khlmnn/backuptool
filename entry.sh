#!/bin/sh

# Start cron

# If BACKUP_FREQUENCY is set, replace the frequency in the crontab config
if [ -z "$BACKUP_FREQUENCY" ]; then
    echo "BACKUP_FREQUENCY wasn't set by the user, so defaulting to \"@daily\".";
else
    sed "s/@daily/$BACKUP_FREQUENCY/w /crontab_configuration.tmp" /crontab_configuration
    mv /crontab_configuration.tmp /crontab_configuration
fi

/usr/bin/crontab /crontab_configuration

# Blocking command, only place at the very end!
/usr/sbin/crond -f -l 8
