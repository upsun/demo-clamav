#!/usr/bin/env bash
# -*- coding: utf-8 -*-

echo "Start Clamav daemon manualy (for test)"
clamd --config-file="${PLATFORM_APP_DIR}/var/etc/clamd.conf"
