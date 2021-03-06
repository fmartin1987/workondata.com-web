#!/bin/sh

if [ "$1" = "start" ]; then
    openssl enc -aes-256-cbc -d -in deploy.sh.dat > deploy.sh -pass pass:$OPENSSL_PASS
    if [ $? -eq 0 ]; then
        chmod +x deploy.sh
        bash -x deploy.sh
    fi
    python -c 'while 1: import ctypes; ctypes.CDLL(None).pause()'
else
    exec "$@"
fi
