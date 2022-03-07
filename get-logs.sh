#!/bin/sh
ssh -i ~/.ssh/id_rsa_kalinets_gmail root@`doctl compute droplet list --no-header --format 'PublicIPv4' | head -n 1` \
  'docker logs -n 10 $(docker ps -q)'
