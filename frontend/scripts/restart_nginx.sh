#!/bin/bash
set -e
nginx -t
systemctl restart nginx
sleep 2
systemctl is-active --quiet nginx
