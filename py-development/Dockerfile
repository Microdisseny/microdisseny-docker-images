FROM ubuntu:18.04

MAINTAINER Alexandre Busquets Triola <tech@microdisseny.com>

ENV PYTHONUNBUFFERED 1
ENV DEBIAN_FRONTEND noninteractive

ENV PATH /usr/local/bin:$PATH

ENV LANG C.UTF-8
ENV TZ 'Europe/Berlin'

ENV CPLUS_INCLUDE_PATH /usr/include/gdal
ENV C_INCLUDE_PATH /usr/include/gdal


RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    build-essential \
    openssh-client \
    sudo \
    gosu \
	git \
    unzip \
    netcat \
	tzdata \
	gdal-bin \
	libgdal-dev \
    python \
	python-dev \
	python-setuptools \
	python-pip \
	python3 \
	python3-dev \
	python3-setuptools \
	python3-pip \
	tzdata \
	postgresql-server-dev-10 \
    postgresql-client-10 \
    postgresql-10-postgis-2.4 postgresql-10-postgis-scripts \
    postgresql postgresql-contrib \
    libsqlite3-mod-spatialite \ 
    gettext \
    poppler-utils && \
    pip2 install -U pip setuptools && \
    pip3 install -U pip setuptools && \
	echo $TZ > /etc/timezone && \
	rm /etc/localtime && \
	ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
	dpkg-reconfigure -f noninteractive tzdata

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Create user for postgres
RUN /etc/init.d/postgresql start && \
    echo "CREATE ROLE admin PASSWORD 'admin' SUPERUSER CREATEDB CREATEROLE INHERIT LOGIN;" | \
    su - postgres -c psql

RUN mkdir -p /app

ADD entrypoint.sh /entrypoint.sh
RUN chmod -v +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
