docker pull ubuntu:20.04
docker build --progress=plain -t microdisseny/py3-development:ubuntu-20.04 -t microdisseny/py3-development py3-development-ubuntu-20.04
docker build --progress=plain -t microdisseny/py3-development:ubuntu-20.04-selenium -t microdisseny/py3-development-selenium py3-development-ubuntu-20.04-selenium
docker build --progress=plain -t microdisseny/py3-development:ubuntu-20.04-node -t microdisseny/py3-development-node py3-development-ubuntu-20.04-node

docker pull ubuntu:18.04
docker build --progress=plain -t microdisseny/py3-development:ubuntu-18.04 py3-development-ubuntu-18.04
docker build --progress=plain -t microdisseny/py3-development:ubuntu-18.04-selenium py3-development-ubuntu-18.04-selenium

docker pull ubuntu:16.04
docker build --progress=plain -t microdisseny/py3-development:ubuntu-16.04 py3-development-ubuntu-16.04

docker build --progress=plain -t microdisseny/py-development py-development
