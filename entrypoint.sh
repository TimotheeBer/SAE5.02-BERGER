#!/bin/sh
set -e
prometheus --config.file=/etc/prometheus/prometheus.yml
tail -f /dev/null
