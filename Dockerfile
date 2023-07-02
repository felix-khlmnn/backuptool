FROM alpine:latest
RUN apk add --no-cache rsync nano

COPY create_backup.sh /create_backup.sh
COPY crontab_configuration /crontab_configuration
COPY entry.sh /entry.sh

RUN chmod 755 /create_backup.sh /entry.sh
RUN chmod 644 /crontab_configuration

RUN /usr/bin/crontab /crontab_configuration

RUN touch /var/log/cron.log

CMD ["/entry.sh"]
