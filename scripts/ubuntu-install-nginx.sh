#!/usr/bin/env bash

sudo apt install -y nginx
sudo systemctl enable --now nginx.service