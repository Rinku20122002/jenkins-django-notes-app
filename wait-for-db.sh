#!/bin/sh

echo "Waiting for MySQL..."

# wait until port is open
until nc -z mysql 3306
do
  echo "MySQL not ready yet..."
  sleep 2
done

echo "MySQL is ready"

echo "Running migrations..."
python manage.py migrate --no-input

echo "Starting Gunicorn..."
exec gunicorn notesapp.wsgi:application --bind 0.0.0.0:8000
