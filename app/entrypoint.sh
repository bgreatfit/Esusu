#!/bin/bash

# Collect static files
echo "Collect static files"
#python manage.py collectstatic --noinput
#python manage.py makemigrations
##
#python manage.py migrate
#
## Start server
#echo "Starting server"
#
#python manage.py flush --no-input
#python manage.py collectstatic --no-input
gunicorn --timeout=30 --workers=2 --bind 0.0.0.0:8000 cowrywise.wsgi:application --reload
exec "$@"