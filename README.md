![example workflow](https://github.com/github/docs/actions/workflows/yamdb_workflow.yml/badge.svg)

# Описание

Программа для создания небольших постов, с возможностью объединять их в группы, оставлять коментарии и подписываться на понравившего автора.
В данной реализации выполнена на REST_API

Версия программы: v1

# Установка

Клонировать репозиторий и перейти в него в командной строке:
```
git clone https://github.com/yandex-praktikum/kittygram2plus.git
```
Переходим в папку проекта
```
cd yatube_api
```
Cоздать и активировать виртуальное окружение:
```
python3 -m venv env
```
```
source env/bin/activate
```
Установить зависимости из файла requirements.txt:
```
pip install -r requirements.txt
```
Выполнить миграции:
```
python3 manage.py migrate
```
Запустить проект:
```
python3 manage.py runserver
```

# Примеры запросов

- Получить JWT-токен
```
POST /api/v1/jwt/create/
```
Содержание запроса:
```
{
  "username": "string",
  "password": "string"
}
```
Содержание ответа:
```
{
  "access": "string"
}
```
- Получение публикаций
Получить список всех публикаций. При указании параметров limit и offset выдача должна работать с пагинацией.
```
GET /api/v1/posts/
```
Содержание ответа:
```
{
  "count": 123,
  "next": "http://api.example.org/accounts/?offset=400&limit=100",
  "previous": "http://api.example.org/accounts/?offset=200&limit=100",
  "results": [
    {
      "id": 0,
      "author": "string",
      "text": "string",
      "pub_date": "2021-10-14T20:41:29.648Z",
      "image": "string",
      "group": 0
    }
  ]
}
```
- Создание публикации
Добавление новой публикации в коллекцию публикаций. Анонимные запросы запрещены.

```
POST /api/v1/posts/
```
Содержание ответа:
```
{
  "text": "string",
  "image": "string",
  "group": 0
}
```
- Получение комментариев
Получение всех комментариев к публикации. post_id (required) - id публикации
```
GET api/v1/posts/{post_id}/comments/
```
Содержание ответа:
```
[
  {
    "id": 0,
    "author": "string",
    "text": "string",
    "created": "2019-08-24T14:15:22Z",
    "post": 0
  }
]
```
- Добавление комментария
Добавление нового комментария к публикации. Анонимные запросы запрещены. post_id (required) - id публикации, text
(required) - string (текст комментария)    

```
POST api/v1/posts/{post_id}/comments/
```
Содержание ответа:
```
{
  "text": "string"
}
```

- Список сообществ
Получение списка доступных сообществ.
```
GET api/v1/groups/
```
Содержание ответа:
```
[
  {
    "id": 0,
    "title": "string",
    "slug": "string",
    "description": "string"
  }
]
```
- Информация о сообществе
Получение информации о сообществе по id. id(required) - id сообщества
```
POST api/v1/groups/{id}/
```
Содержание ответа:
```
[
  {
    "id": 0,
    "title": "string",
    "slug": "string",
    "description": "string"
  }
]
``` 
- Вся информация о доступных запросах
[/reDoc]
