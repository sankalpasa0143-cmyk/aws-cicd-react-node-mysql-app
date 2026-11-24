#!/bin/bash
echo "=== nginx config test ==="
nginx -t 2>&1

echo "=== listeners on 80/443 ==="
ss -tlnp | grep -E ':80|:443'

echo "=== restarting nginx ==="
if ! systemctl restart nginx 2>&1; then
  echo "=== journal ==="
  journalctl -xeu nginx.service --no-pager | tail -30
  exit 1
fi
echo "nginx restarted OK"
