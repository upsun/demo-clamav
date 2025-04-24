#!/usr/bin/env bash
# -*- coding: utf-8 -*-

echo "Create Systemd user folder structure..."
mkdir -p ~/.config/systemd/user

echo "Copy Systemd user unit services..."
cp -R scripts/systemd.d/* ~/.config/systemd/user/