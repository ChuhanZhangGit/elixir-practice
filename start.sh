#!/bin/bash

# TODO: Enable this script by removing the abovev
export MIX_ENV=prod
export PORT=4790

echo "Stopping old copy of app, if any..."

_build/prod/rel/practice/bin/practice stop || true

echo "Starting app..."

_build/prod/rel/practice/bin/practice foreground

# TODO: Add a systemd service file
#       to start your app on system boot.

