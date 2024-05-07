#! /usr/bin/env bash

# Let the DB start
python3 /gitearn/app/backend_pre_start.py

# Run migrations
alembic upgrade head

# Create initial data in DB
python3 /gitern/app/initial_data.py
