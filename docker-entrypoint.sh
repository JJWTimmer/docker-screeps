#!/bin/sh

SCREEPS_PATH=/screeps
SCREEPS_CONFIG=${SCREEPS_PATH}/.screepsrc
SCREEPS_AUTO_UPDATE=${SCREEPS_AUTO_UPDATE:-1}

# update check
[[ "$SCREEPS_AUTO_UPDATE" == "1" ]] && npm update screeps

# config check
if [ ! -e "${SCREEPS_CONFIG}" ]; then
    if [ -z "$STEAM_KEY" ]; then
        echo "no STEAM_KEY found -> EXIT"
        exit 1
    else
        echo "initialising screeps..."

        # pass our steam key into the init process
        echo "${STEAM_KEY}" | screeps init "${SCREEPS_PATH}"
    fi
fi

exec "$@"
