#!/usr/bin/env bash

echo "Prepare folder for clamav..."
mkdir -p \
    "${PLATFORM_APP_DIR}/var/log" \
    "${PLATFORM_APP_DIR}/var/lib" \
    "${PLATFORM_APP_DIR}/var/etc"

cp "${PLATFORM_APP_DIR}/etc/clamd.conf" "${PLATFORM_APP_DIR}/var/etc/"


echo "Prepare folder for data..."
mkdir -p \
    "${FOLDER2SCAN}" \
    "${FOLDER2MOVE}"