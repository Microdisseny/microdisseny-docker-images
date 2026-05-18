#! /bin/bash
set -e

docker pull python:3.12-slim
docker build --progress=plain -t microdisseny/py3-development:python-3.12-slim py3-development-python3.12-slim

docker pull ubuntu:24.04
docker build --progress=plain -t microdisseny/py3-development:ubuntu-24.04 py3-development-ubuntu-24.04

docker pull ubuntu:22.04
docker build --progress=plain -t microdisseny/py3-development:ubuntu-22.04 py3-development-ubuntu-22.04
docker build --progress=plain -t microdisseny/py3-development:ubuntu-22.04-selenium py3-development-ubuntu-22.04-selenium
docker build --progress=plain -t microdisseny/py3-development:ubuntu-22.04-node py3-development-ubuntu-22.04-node

docker pull ubuntu:20.04
docker build --progress=plain -t microdisseny/py3-development:ubuntu-20.04 py3-development-ubuntu-20.04
docker build --progress=plain -t microdisseny/py3-development:ubuntu-20.04-selenium py3-development-ubuntu-20.04-selenium
docker build --progress=plain -t microdisseny/py3-development:ubuntu-20.04-node py3-development-ubuntu-20.04-node

docker pull ubuntu:18.04
docker build --progress=plain -t microdisseny/py3-development:ubuntu-18.04 py3-development-ubuntu-18.04
docker build --progress=plain -t microdisseny/py3-development:ubuntu-18.04-selenium py3-development-ubuntu-18.04-selenium
