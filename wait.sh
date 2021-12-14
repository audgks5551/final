#!/bin/sh

apt-get update
apt-get install netcat-openbsd
while ! nc -z db 3306 ; do
    echo "Waiting for the MariaDB Server"
    sleep 3
done

python manage.py migrate
python manage.py runserver 0.0.0.0:8000