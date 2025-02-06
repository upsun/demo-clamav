#!/usr/bin/env bash
# -*- coding: utf-8 -*-

echo "Update Virus database..."
freshclam --config-file=/app/etc/freshclam.conf
