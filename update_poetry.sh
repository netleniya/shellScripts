#!/bin/bash

FILE=./pyproject.toml
LOGFILE=/usr/local/var/log/poetry_updates.log
CMD="poetry update"
DIR=/Users/peterfiee/Documents/Programming/Python

if [[ ! -e $LOGFILE ]]; then
	touch $LOGFILE
fi

echo "Created on: $(date)." >> $LOGFILE

for dir in $DIR/* ;do
	if [[ -d $dir ]]; then
				cd "$dir" &&
				(if [[ -e $FILE ]]; then
					echo -e "\nUpdating poetry packages in $dir" | tee -a $LOGFILE
					eval $CMD >> $LOGFILE 2>&1
					fi
				)
	fi
done
