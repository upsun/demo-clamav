#!/usr/bin/env bash
# -*- coding: utf-8 -*-

clamdscan \
    --config-file="${PLATFORM_APP_DIR}/var/etc/clamd.conf" \
    --log="${PLATFORM_APP_DIR}/var/log/scan-clt.log" \
    --move="${FOLDER2MOVE}" \
    --recursive \
    "${FOLDER2SCAN}"
