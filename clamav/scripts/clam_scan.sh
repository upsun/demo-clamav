#!/usr/bin/env bash
# -*- coding: utf-8 -*-

echo "Trigger scan by one-time call..."
clamscan  \
    --database="${DATABASE}" \
    --log="${PLATFORM_APP_DIR}/var/log/scan.log" \
    --move="${FOLDER2MOVE}" \
    --recursive \
    "${FOLDER2SCAN}"