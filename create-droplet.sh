#!/bin/bash

SSH_KEYS=${DO_SSH_KEYS:-33340088}
IMAGE=${DO_IMAGE:-103272717}
REGION=$(doctl compute image get $IMAGE -o json | jq -r '.[].regions[]' | sort -R | head -n 1)

echo $REGION
doctl compute droplet create putin-must-die-$RANDOM-$RANDOM \
    --image $IMAGE \
    --ssh-keys $SSH_KEYS \
    --region $REGION \
    --size s-1vcpu-1gb \
    --tag-name putin-xyulo \
    --user-data-file ./src/run-attack.sh
