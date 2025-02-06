#!/usr/bin/env bash
# -*- coding: utf-8 -*-


# echo "Show environement"
# systemctl --user show-environment

echo "Reload Services"
systemctl --user daemon-reload

echo "Activating with user"
systemctl --user enable clamav.service

echo "Starting with user"
systemctl --user start clamav.service

# echo "Show current services"
# systemctl --user

echo "Show current services"
systemctl --user status clamav.service