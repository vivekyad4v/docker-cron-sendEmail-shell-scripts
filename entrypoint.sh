#!/bin/sh

crond -c /var/spool/cron/crontabs -f -L /var/log/cron.log "$@"
