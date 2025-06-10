for IMAGE in \
  jgcz/microdisseny-py3-development:ubuntu-24.04 \
  jgcz/microdisseny-py3-development:ubuntu-22.04 \
  jgcz/microdisseny-py3-development:ubuntu-22.04-selenium \
  jgcz/microdisseny-py3-development:ubuntu-22.04-node \
  jgcz/microdisseny-py3-development:ubuntu-20.04 \
  jgcz/microdisseny-py3-development:ubuntu-20.04-selenium \
  jgcz/microdisseny-py3-development:ubuntu-20.04-node \
  jgcz/microdisseny-py3-development:ubuntu-18.04 \
  jgcz/microdisseny-py3-development:ubuntu-18.04-selenium
do
  echo "\n* $IMAGE"
  docker push $IMAGE
done
