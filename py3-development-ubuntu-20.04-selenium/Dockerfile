FROM microdisseny/py3-development:ubuntu-20.04

ENV SELENIUM_VERSION=2.53.6


RUN apt-get -qq update && apt-get -qq install -y --no-install-recommends \
    wget unzip

RUN wget -nv https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P ~/ \
    && ls -la ~/ \
    && apt-get -qq install -yf ~/google-chrome-stable_current_amd64.deb
RUN rm ~/google-chrome-stable_current_amd64.deb

# Install chromedriver.
RUN wget -nv -N https://chromedriver.storage.googleapis.com/2.35/chromedriver_linux64.zip -P ~/ && \
    unzip ~/chromedriver_linux64.zip -d ~/ && \
    rm ~/chromedriver_linux64.zip && \
    mv -f ~/chromedriver /usr/local/bin/chromedriver && \
    chmod +x /usr/local/bin/chromedriver

ENV PATH="/usr/local/bin/chromedriver:${PATH}"

ENV pip3 install selenium==$SELENIUM_VERSION

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
