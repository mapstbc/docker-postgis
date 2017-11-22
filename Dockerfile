
FROM postgres:%%PG_MAJOR%%

MAINTAINER Mike Dillon <mike@appropriate.io>



ENV POSTGIS_MAJOR %%POSTGIS_MAJOR%%

ENV POSTGIS_VERSION %%POSTGIS_VERSION%%



RUN apt-get update \

      && apt-get install -y --no-install-recommends \

           postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR=$POSTGIS_VERSION \

           postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR-scripts=$POSTGIS_VERSION \

           postgis=$POSTGIS_VERSION \

      && rm -rf /var/lib/apt/lists/*



RUN mkdir -p /docker-entrypoint-initdb.d

COPY ./initdb-postgis.sh /docker-entrypoint-initdb.d/postgis.sh

COPY ./update-postgis.sh /usr/local/bin
