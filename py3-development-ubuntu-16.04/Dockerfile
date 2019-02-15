FROM ubuntu:16.04

MAINTAINER Microdisseny tech team <tech@microdisseny.com>

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
	tzdata \
	gdal-bin \
	libgdal-dev \
	python3 \
	python3-dev \
	python3-setuptools \
	python3-pip \
	tzdata \
    postgresql-server-dev-9.5 \
    postgresql-client-9.5 \
    postgresql-9.5-postgis-2.2 postgresql-9.5-postgis-scripts \
    postgresql postgresql-contrib \
    libsqlite3-mod-spatialite && \
	pip3 install -U pip setuptools && \
	echo $TZ > /etc/timezone && \
	rm /etc/localtime && \
	ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
	dpkg-reconfigure -f noninteractive tzdata

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /app

ADD entrypoint.sh /entrypoint.sh
RUN chmod -v +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
