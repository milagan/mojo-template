#!/bin/bash

sudo apt update
sudo apt install build-essential cpanminus git sqlite3 libsqlite3-dev libssl-dev zlib1g-dev
sudo cpanm --installdeps --notest .