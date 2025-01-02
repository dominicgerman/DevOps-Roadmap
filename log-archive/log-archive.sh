#!/usr/bin/bash

TODAYS_DATE=$(date +%Y%m%d_%H%M%S)

for LOG_DIR in $@
do
	tar -czvf /tmp/logs_archive_${TODAYS_DATE}.tar.gz  $LOG_DIR/*.log
done
