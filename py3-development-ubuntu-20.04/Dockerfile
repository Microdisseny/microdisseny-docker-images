FROM ubuntu:20.04

MAINTAINER Microdisseny Tech team <tech@microdisseny.com>

ENV PYTHONUNBUFFERED 1
ENV DEBIAN_FRONTEND noninteractive

ENV PATH /usr/local/bin:$PATH

ENV LANG C.UTF-8
ENV TZ 'Europe/Berlin'

ENV CPLUS_INCLUDE_PATH /usr/include/gdal
ENV C_INCLUDE_PATH /usr/include/gdal


RUN apt-get -qq update && \
  apt-get -qq upgrade -y && \
  apt-get -qq install -y --no-install-recommends \
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
    locales \
    iputils-ping \
    gdal-bin \
    libgdal-dev \
    postgresql-client \
    python-is-python3 \
    python3 \
    python3-wheel \
    python3-dev \
    python3-setuptools \
    python3-pip \
    python3-venv \
    tzdata \
    gettext \
    poppler-utils \
    gpg \
    gpg-agent \
    dirmngr && \
  pip3 -q install -U pip setuptools uwsgi && \
  echo $TZ > /etc/timezone && \
  rm /etc/localtime && \
  ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
  dpkg-reconfigure -f noninteractive tzdata && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN \
  locale-gen ca_ES.UTF-8 && \
  locale-gen es_ES.UTF-8 && \
  locale-gen en_US.UTF-8 && \
  update-locale

RUN mkdir -p /pip-cache
ADD ./requirements-devel.txt /
RUN pip3 -q wheel --wheel-dir /pip-cache -r requirements-devel.txt
RUN pip3 -q install --find-links=/pip-cache -r /requirements-devel.txt

RUN pip3 list --outdated

RUN mkdir -p /app

ADD entrypoint.sh /entrypoint.sh
RUN chmod -v +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
