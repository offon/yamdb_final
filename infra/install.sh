#!/bin/bash
docker-compose up -d
docker-compose exec web python manage.py migrate
echo "Cоздание пользователя admin"
docker-compose exec web echo "from users.models import User; User.objects.create_superuser('admin', 'admin@yamdb.com', 'admin')" | python manage.py shell
echo "Пользователь admin создан"
exec "$@"