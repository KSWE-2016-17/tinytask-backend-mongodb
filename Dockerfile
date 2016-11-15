FROM mongo

RUN apt-get update && \
    apt-get install -y dos2unix

COPY dumps/ /dumps/
RUN for db in /dumps/* ; do \
        for f in $db/* ; do \
            dos2unix $f ; \
        done ; \
    done

COPY scripts/entrypoint.sh.orig /
RUN dos2unix /entrypoint.sh.orig

COPY scripts/entrypoint.sh.new /entrypoint.sh
RUN chmod +x /entrypoint.sh
RUN dos2unix /entrypoint.sh

COPY scripts/mongodb-init-db.sh /
RUN chmod +x /mongodb-init-db.sh
RUN dos2unix /mongodb-init-db.sh
