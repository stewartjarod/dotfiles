#!/bin/sh
if test ! $(which spoof)
then
  echo "› installing spoof"
  sudo npm install spoof -g
fi

if type nvm &> /dev/null
then
  echo "› installing nvm"
  wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
fi

exit 0
