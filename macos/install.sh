# The Brewfile handles Homebrew-based app and library installs, but there may
# still be updates and installables in the Mac App Store. There's a nifty
# command line interface to it that we can use to just install everything, so
# yeah, let's do that.

# setup pinentry
echo "pinentry-program $(which pinentry-mac)" >> ~/.gnupg/gpg-agent.conf

echo "› sudo softwareupdate -i -a"
sudo softwareupdate -i -a