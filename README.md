# API Ya Muddle Doodle Base
![yamdb_workflow](https://github.com/kapkaevandrey/yamdb_final/actions/workflows/yamdb_workflow.yml/badge.svg)
## api_yamdb

### _Описание проекта_

> ***Блез Паскаль*** _(1623–1662) — французский математик_
>>И те, что пишут не для славы, желают признания, что хорошо написали, а те, что читают их, — похвалы за то, что прочли.
-------------------------------------------------------------------

Проект API системы сбора отзывов и на различные произведения (кино, музыка, фильмы, книги, картины да всё что угодно)
Проект позволяет публиковать отзывы к различным произведениям и выставлять им оценки, также пользователи могут комментировать опубликованные отзывы. Данный проект поможет людям делится собственным мнением, и помочь пользователям определится с тем хотят ли они тратить время на знакомство с каким-либо произведением. Создателям произведений так же будет интересно узнать об оценке их творчества. Всё это позволит не только найти друзей с общими интересами, но повысить планку качества для авторов любых произведений.
Вместе мы делаем этот мир лучше)

### _Технологии_
 - _[Python 3.9.7](https://docs.python.org/3/)_
 - _[Django 2.2.16](https://docs.djangoproject.com/en/2.2/)_
 - _[Django REST framework 3.12.4](https://www.django-rest-framework.org/)_
 - _[Simple JWT 4.8.0](https://django-rest-framework-simplejwt.readthedocs.io/en/latest/)_
 - _[Chardet 4.0.0](https://pypi.org/project/chardet/)_
 - _[Docker](https://www.docker.com/)_
 - _[Gunicorn 20.0.4](https://pypi.org/project/gunicorn/)_
 - _[Nginx 1.19.3](https://nginx.org/)_
### _Как запустить проект в контейнерах Docker_:

Клонировать репозиторий и перейти в него в командной строке:

```
git clone https://github.com/kapkaevandrey/yamdb_final.git
```

```
cd yamdb_fianl
```

Запустите сборку и запуск контейнров:

```
docker-compose up
```

Окройте другое окно терминала и выполните миграции:

```
docker-compose exec web python manage.py makemigrations
docker-compose exec web python manage.py migrate
```

Заполнить данные из дампа БД:

```
docker-compose exec web python manage.py loaddata fixtures.json 
```

### Шаблон файла с переменными окружения **.env**
```
DB_ENGINE=django.db.backends.postgresql
DB_NAME=postgres
POSTGRES_USER=postgres
POSTGRES_PASSWORD=postgres
DB_HOST=db
DB_PORT=5432

SECRET_KEY=<Ваш уникальный криптографический ключ>
```

----------------------------------------------------------------
### Локализация
В проекте по умолчанию установлена русская локализация (ru) и все надписи переведны на русский язык. При необходимости вы можете обновить или созадть записи и перевод сообщений используя следующую команду (выоплненяется из директории проекта или директории приложения):
```shell
~/project_dir> django-admin makemessages -l ru
```
Затем отредактируйте файл сообщения **.po** расположенный в папке locale каждого приложения следую инсрукциям из официальной [документации](https://docs.djangoproject.com/en/3.2/topics/i18n/translation/#:~:text=the%20particular%20language.-,For,-example%2C%20if%20your.) 
После создания файла сообщения - и каждый раз, когда вы вносите в него изменения - вам нужно будет скомпилировать его в более эффективную форму для использования для этого используйте команду:
```shell
~/project_dir> django-admin compilemessages
```

☑️***Примечание:*** Если вы хотите загрузить данные в БД из набора фалов можете перейти по ссылке ниже

### [__Загрузка в базу данных с использованием CSV__](https://github.com/kapkaevandrey/infra_sp2/blob/master/Load%20Data.md)

-------------------------------------------------------------------
### _Пользовательские роли в проекте_:
1. **Аноним :alien:**
2. **Аутентифицированный пользователь :sunglasses:**
3. **Модератор :neutral_face:**
4. **Администратор :innocent:**

**Анонимные :alien:** пользователи могут:
1. Просматривать, информацию о произведениях;
2. Просматривать, отзывы на произведения;
3. Просматривать комментарии к отзывам;
4. Просматривать все имеющиеся в проекте жанры и категории.

**Аутентифицированные  (user)  :sunglasses:** пользователи могут:
1. Получать данные о **своей** учётной записи;
2. Просматривать, публиковать, удалять и редактировать **свои** отзывы (*автор может оставить только один отзыв к конкретному произведению*);
3. Просматривать, информацию о жанрах и категориях;
4. Просматривать, публиковать комментарии от своего имени к отзывам других пользователей *(включая самого себя)*, удалять и редактировать **свои** комментарии;
***Примечание***: Доступ ко всем операциям записи, обновления и удаления доступны только после аутентификации и получения токена.

**Модератор  (user)  :neutral_face:** пользователи могут:
1. Просматривать, публиковать, удалять и редактировать **свои** отзывы (*автор может оставить только один отзыв к конкретному произведению*);
2. Удалять и редактировать любые отзывы (*токсичная критика никому не приносит пользы*);
3. Просматривать, информацию о жанрах и категориях;
4. Просматривать, публиковать комментарии от своего имени к отзывам других пользователей *(включая самого себя)*, удалять и редактировать **свои** комментарии;
5. Удалять и редактировать любые комменатрии (*точки зрения могут быть разными, но это не повод переходить на личности*);
***Примечание***: 
Выбирайте администартора с умом.
> ***Бен Паркер*** 
>>С большой силой приходит большая ответственность.

**Администратор  (admin)  :innocent:** может:
1. Всё!!!
2. Реально абсолютно всё, он в этом проекте главный босс;
3. Получать информацию о пользователях;
4. Создавать пользователей,изменять их данные и удалять из проекта;
5. Так же может дбавлять новые произведения;
6. Добавлять новые жанры и категории.

### _Набор доступных эндпоинтов :point_down:_:
* `redoc/` - Подробная документация по работе API.
* `api/v1/categories/` - Получение, публикация и удаление категорий (_GET, POST, DELETE_).
* `api/v1/genres/` - Получение, публикация и удаление жанров (_GET, POST, DELETE_).
* `api/v1/titles/` - Получение и публикация произведения (_GET, POST_).
* `api/v1/titles/{id}` - Получение, изменение, удаление произведения с соответствующим **id** (_GET, PUT, PATCH, DELETE_).
* `api/v1/titles/{title_id}/reviews/` - Получение отзывов к произведению с соответствующим **title_id** и публикация новых отзывов(_GET, POST_).
* `api/v1/titles/{title_id}/reviews/{id}/` - Получение, изменение, удаление отзыва с соответствующим **id** к произведению с соответствующим **title_id** (_GET, PUT, PATCH, DELETE_).
*  `api/v1/titles/{title_id}/reviews/{review_id}/comments/` - Получение комментариев и публикация нового комментария к отзыву с соответствующим **review_id**, при этом отзыв оставлен к произведению с соответствующим **title_id**(_GET, POST_).
*  `api/v1/titles/{title_id}/reviews/{review_id}/comments/{id}/` - Получение, изменение, удаление комментария с соответствующим **id** к отзыву с соответствующим **review_id**, при этом отзыв оставлен к произведению с соответствующим **title_id**(_GET, PUT, PATCH, DELETE_).

* #### _Операции с пользователями :point_down:_:
  * `api/v1/users/` - получение информации о пользователе и создание новых пользователей. Только **admin** (_GET, POST_). 
  * `api/v1/users/{username}` - Получение, изменение, удаление информации о пользователе. Только **admin** (_GET, PUT, PATCH, DELETE_).
  * `api/v1/users/me/` - получение и изменение данных своей учётной записи. Доступна любым авторизованными пользователям (_GET, PATCH_). 

* #### _Аутентификация и создание новых пользователей :point_down:_:
  * `api/v1/auth/signup/` - Регистрация нового пользователя (_POST_). 
  * `api/v1/auth/token/` - Получение JWT-токена (_POST_).

## _Алгоритм регистрации пользователей_:
1. Пользователь отправляет POST-запрос на добавление нового пользователя с параметрами ***email*** и ***username*** на эндпоинт `/api/v1/auth/signup/`.
2. YaMDB отправляет письмо с кодом подтверждения (***confirmation_code***) на адрес ***email***.
3. Пользователь отправляет POST-запрос с параметрами ***username*** и ***confirmation_code*** на эндпоинт `/api/v1/auth/token/`, в ответе на запрос ему приходит token (JWT-токен).
4. При желании пользователь отправляет PATCH-запрос на эндпоинт `/api/v1/users/me/` и заполняет поля в своём профайле (описание полей — в документации).


## _Примеры выполнения запросов_:
##### Получаем JWT-токена 
`api/v1/auth/token/`
>
>Payload
>```json
>{
>"username": "string",
>"confirmation_code": "string"
>}
>```
>Response sample (status code = 200)
>```json
>{
>"token": "string"
>}
>```


##### Получение списка всех произведений 
`api/v1/titles/`
>
>Response sample (status code = 200)
>```json
>[
>  {
>    "count": 0,
>    "next": "string",
>    "previous": "string",
>    "results": [
>      {
>        "id": 0,
>        "name": "string",
>        "year": 0,
>        "rating": 0,
>        "description": "string",
>        "genre": [
>          {
>            "name": "string",
>            "slug": "string"
>          }
>        ],
>        "category": {
>          "name": "string",
>          "slug": "string"
>        }
>      }
>    ]
>  }
>]
>```


##### Опубликовать новый отзыв.
`api/v1/titles/{title_id}/reviews/` (*требуется Аутентификация*)
>
>Payload
>```json
>{
>"text": "string",
>"score": 1
>}
>```
>Response sample (status code = 201)
>```json
>{
>"id": 0,
>"text": "string",
>"author": "string",
>"score": 1,
>"pub_date": "2019-08-24T14:15:22Z"
>}
>```


##### Отредактировать комментарий к отзыву на произведение. 
(*требуется Аутентификация*)
(*доступно авторам и пользователям с правами админиcтратора и модератора*)
`api/v1/titles/{title_id}/reviews/{review_id}/comments/{comment_id}/`
>
>Payload
>```json
>{
>  "text": "string"
>}
>```
>Response sample (status code = 200)
>```json
>{
>  "id": 0,
>  "text": "string",
>  "author": "string",
>  "pub_date": "2019-08-24T14:15:22Z"
>}
>```


##### Добавление новой категории.
`api/v1/categories/` (*Доступно пользователям с правами админиcтратора*)
>
>Payload
>```json
>{
>  "name": "string",
>  "slug": "string"
>}
>```
>Response sample (status code = 201)
>```json
>{
>"name": "string",
>"slug": "string"
>}
>```


## Авторы проекта
#### Шапошников Антон
#### Москалёв Антон
#### Капкаев Андрей
>*Улыбайтесь - это всех раздражает :relaxed:.*
