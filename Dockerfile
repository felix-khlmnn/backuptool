FROM alpine:latest
RUN apk add --no-cache rsync
ADD create_backup.sh /create_backup.sh
ADD crontab_file /crontab_file
COPY entry.sh /entry.sh
RUN chmod 755 /create_backup.sh /entry.sh
RUN /usr/bin/crontab /crontab_file

CMD ["/entry.sh"]
