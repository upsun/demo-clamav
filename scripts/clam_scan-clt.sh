#!/usr/bin/env bash
# -*- coding: utf-8 -*-

echo "Trigger scan by service..."
clamscan \
    --database="${DATABASE}" \
    --config-file="${PLATFORM_APP_DIR}/var/etc/clamd.conf" \
    --log="${PLATFORM_APP_DIR}/var/log/scan-clt.log" \
    --move="${FOLDER2MOVE}" \
    "${FOLDER2SCAN}"
