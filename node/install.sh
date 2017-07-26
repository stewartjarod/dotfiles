#!/bin/sh
if test ! $(which spoof)
then
  echo "› installing spoof"
  sudo npm install spoof -g
fi

exit 0
