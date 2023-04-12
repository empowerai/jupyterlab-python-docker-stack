#!/bin/bash
# Copyright (c) 2020 b-data GmbH.
# Distributed under the terms of the MIT License.

set -e
_log 
if [ -e "/home/jovyan/firstrun" ]; then
    cp -an /var/backups/skel/. /home/${NB_USER}
    rm /home/jovyan/firstrun
    _log "Success!"

fi

