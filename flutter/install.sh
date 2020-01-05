if test ! $(which flutter)
then
  echo 'installing flutter'
  git clone https://github.com/flutter/flutter.git ~/flutter
else
  echo 'updating flutter'
  flutter upgrade
  flutter doctor
  flutter config --no-analytics
fi


if test $(which pod)
then
  echo 'setting up pod'
  pod setup
fi
exit 0
