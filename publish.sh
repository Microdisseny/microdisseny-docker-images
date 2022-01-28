for IMAGE in \
  microdisseny/py3-development:ubuntu-20.04 \
  microdisseny/py3-development:ubuntu-20.04-selenium \
  microdisseny/py3-development:ubuntu-20.04-node \
  microdisseny/py3-development:ubuntu-18.04 \
  microdisseny/py3-development:ubuntu-18.04-selenium
do
  echo "\n* $IMAGE"
  docker push $IMAGE
done
