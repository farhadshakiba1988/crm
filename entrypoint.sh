#!/bin/sh

echo "Starting migrations..."
python manage.py migrate --noinput
echo "Migrations completed."

echo "Collecting static files..."
python manage.py collectstatic --noinput
echo "Static files collected."

echo "Starting Gunicorn server..."
gunicorn base.wsgi:application -c gunicorn.conf.py
