FROM microdisseny/py3-development:ubuntu-22.04

RUN apt-get -qq update && apt-get -qq upgrade -y && \
    apt-get -qq install -y nodejs \
    npm

RUN npm install -g @quasar/cli
