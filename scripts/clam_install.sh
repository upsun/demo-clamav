#!/usr/bin/env bash

echo "Prepare folder for clamav..."
mkdir -p \
    "${PLATFORM_APP_DIR}/var/log" \
    "${PLATFORM_APP_DIR}/var/lib" \
    "${PLATFORM_APP_DIR}/var/etc"

echo "Generate client config..."
cp "${PLATFORM_APP_DIR}/etc/clamd.conf" "${PLATFORM_APP_DIR}/var/etc/"
IP=$(ifconfig eth0 | grep "inet " | awk -F'[: ]+' '{ print $3 }')
sed -i "s/#TCPAddr localhost/TCPAddr ${IP}/g" "${PLATFORM_APP_DIR}/var/etc/clamd.conf"

echo "Prepare folder for data..."
mkdir -p \
    "${FOLDER2SCAN}" \
    "${FOLDER2MOVE}"