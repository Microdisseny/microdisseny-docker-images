FROM ubuntu:18.04

MAINTAINER Microdisseny Tech team <tech@microdisseny.com>

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
    joe \
    nano \
    vim \
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
    python3 \
    python3-wheel \
    python3-dev \
    python3-setuptools \
    python3-pip \
    python3-venv \
    tzdata \
    postgresql-server-dev-10 \
    postgresql-client-10 \
    postgresql-10-postgis-2.4 postgresql-10-postgis-scripts \
    postgresql postgresql-contrib \
    libsqlite3-mod-spatialite \
    gettext \
    poppler-utils \
    gpg \
    gpg-agent \
    dirmngr && \
  pip3 install -U pip setuptools && \
  echo $TZ > /etc/timezone && \
  rm /etc/localtime && \
  ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
  dpkg-reconfigure -f noninteractive tzdata

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN \
  locale-gen ca_ES.UTF-8 && \
  locale-gen es_ES.UTF-8 && \
  locale-gen en_US.UTF-8 && \
  update-locale

# Create user for postgres
RUN /etc/init.d/postgresql start && \
  echo "CREATE ROLE admin PASSWORD 'admin' SUPERUSER CREATEDB CREATEROLE INHERIT LOGIN;" | \
  su - postgres -c psql

RUN mkdir -p /pip-cache
ADD ./requirements-devel.txt /
RUN pip3 wheel --wheel-dir /pip-cache -r requirements-devel.txt
RUN pip3 install --find-links=/pip-cache -r /requirements-devel.txt

RUN pip3 list --outdated

RUN mkdir -p /app

ADD entrypoint.sh /entrypoint.sh
RUN chmod -v +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
