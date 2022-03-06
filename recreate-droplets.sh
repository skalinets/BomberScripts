#!/bin/bash
doctl compute droplet list --format ID --no-header | xargs -L 1 doctl compute droplet delete -f
for n in {1..5}; do ./create-droplet.sh; done
