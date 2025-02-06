#!/usr/bin/env bash
# -*- coding: utf-8 -*-

clamscan  \
    --database="${DATABASE}" \
    --log="${PLATFORM_APP_DIR}/var/log/scan.log" \
    --move="${FOLDER2MOVE}" \
    --recursive \
    "${FOLDER2SCAN}"