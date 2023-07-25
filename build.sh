#! /bin/bash
set -e

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
