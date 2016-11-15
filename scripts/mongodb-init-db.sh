#!/bin/bash

for db in /dumps/* ; do
    if [ -d ${db} ] ; then
        mongorestore --drop --db $(basename ${db}) --dir ${db}
    fi
done

unset db

mv /entrypoint.sh.orig /entrypoint.sh
chmod +x /entrypoint.sh

exec /entrypoint.sh $@
