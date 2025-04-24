#!/usr/bin/env bash
# -*- coding: utf-8 -*-

echo "Prepare folder for clamav..."
mkdir -p \
    "${PLATFORM_APP_DIR}/var/log" \
    "${PLATFORM_APP_DIR}/var/lib" \
    "${PLATFORM_APP_DIR}/var/etc" \
    "${PLATFORM_APP_DIR}/data/folder2scan" \
    "${PLATFORM_APP_DIR}/data/quarantine" \
    "${PLATFORM_APP_DIR}/data/uploads" 

echo "Generate client/server config..."
cp "${PLATFORM_APP_DIR}/etc/clamd.conf" "${PLATFORM_APP_DIR}/var/etc/"
IP=$(ifconfig eth0 | grep "inet " | awk -F'[: ]+' '{ print $3 }')
sed -i "s/#TCPAddr localhost/TCPAddr ${IP}/g" "${PLATFORM_APP_DIR}/var/etc/clamd.conf"