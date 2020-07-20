#!/bin/bash

# Add local user using LOCAL_USER_ID if passed in at runtime
USER_ID=${LOCAL_USER_ID:-9001}

if [ $USER_ID != 9001 ]
  then

  HOME=/home/user
  if [ ! -d "$HOME" ]
  then
      USER_ID=${LOCAL_USER_ID:-9001}
      echo "Starting with UID : $USER_ID"
      useradd --shell /bin/bash -u $USER_ID -o -c "" -m user || true
      # Add pip --user installed programs to PATH
      echo "PATH=\$PATH:$HOME/.local/bin/" > $HOME/.bashrc
      chown user.user /home/user/.bashrc
  fi

  exec /usr/sbin/gosu user "$@"

else
  exec "$@"

fi
