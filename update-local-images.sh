for IMAGE in \
  microdisseny/py3-development:ubuntu-20.04 \
  microdisseny/py3-development:ubuntu-20.04-selenium \
  microdisseny/py3-development:ubuntu-18.04 \
  microdisseny/py3-development:ubuntu-18.04-selenium \
  microdisseny/py3-development:ubuntu-16.04
do
  echo "\n* $IMAGE"
  docker image inspect $IMAGE > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    docker image pull $IMAGE
  fi
done
