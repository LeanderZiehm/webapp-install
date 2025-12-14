#!/bin/bash

# Code was taken from the Omarchy Github from DHH from this file: https://github.com/basecamp/omarchy/blob/master/bin/omarchy-launch-webapp  permanent link: https://github.com/basecamp/omarchy/blob/8a37f3dce71b0764e3758cb86478c503a4a8746e/bin/omarchy-launch-webapp

browser=$(xdg-settings get default-web-browser)

case $browser in
google-chrome* | brave-browser* | microsoft-edge* | opera* | vivaldi* | helium*) ;;
*) browser="chromium.desktop" ;;
esac

exec setsid uwsm-app -- $(sed -n 's/^Exec=\([^ ]*\).*/\1/p' {~/.local,~/.nix-profile,/usr}/share/applications/$browser 2>/dev/null | head -1) --app="$1" "${@:2}"