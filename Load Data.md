## _Загрузка данных из файлов формата CSV_
### Для считывания данных используется стандартный модуль Python CSV.
____________________________________________________________________________

## Набор необходимых файлов
Для загрузки данных в БД вам необходимо, сгруппировать в директории файлы со следующими именами:
#### * **category.csv** *(данные о категориях)*
#### * **genre.csv** *(данные о жанрах)*
#### * **titles.csv** *(данные о произведениях)*
#### * **users.csv** *(данные о пользователях)*
#### * **genre_title.csv** *(данные о связи произведения и его жанра)*
#### * **review.csv** *(данные об отзывах)*
#### * **comments.csv** *(данные о комментариях)*

---------------------------------------------
## Требования к полям файлов
Ниже вы найдёте минимальный набор полей необходимый в каждом файле чтобы загрузка прошла успешно.

#### * **category.csv** *(данные о категориях)*
| *id*        | *name*          | *slug* |
|:----------:|:-------------:| :-----:|
| 1      | Фильм | film |
| 2      | Книга | book |

#### * **genre.csv** *(данные о жанрах)*
| *id*        | *name*           | *slug* |
| :-------------: |:-------------:|:-----:|
| 1      | Драма | drama |
| 2      | Комедия | comedy |

#### * **titles.csv** *(данные о произведениях)*
| *id*  | *name*          | *year* | *category_id* | *description* |
|:---:|:-------------:|:-----:|:-----:|:-----:|
| 1   | Колобок | 1873 | 2 | A ball of bread |
| 2   | Назад в будущее | 1985 | 1 |  |

#### * **users.csv** *(данные о пользователях)*
| *id*  | *username*          | *email* | *role* | *first_name* | *last_name* | 
|:---:|:-------------:|:-----:|:-----:|:-----:|:-------|
| 100   | spider | sppitpark@aveng.com | user | Piter | Parker  |
| 101   | VolanDeMort | slizerin@hogwarts.com | admin |  |     |

#### * **genre_title.csv** *(данные о связи произведения и его жанра)*
| *id*        | *title_id*          | *genre_id* |
|:----------:|:-------------:| :-----:|
| 1      | 1 | 1 |
| 2      | 2 | 1 |

#### * **review.csv** *(данные об отзывах)*
| *id*  | *title_id*          | *text* | *author_id* | *score* | *pub_date* | 
|:---:|:-------------:|:-----:|:-----:|:-----:|:-------:|
| 1   | 1 | This was amazing | 100| 10 | 2019-09-24T21:08:21.567Z  |
| 2   | 1 | Avada Kedavra | 101 | 1 |  2019-09-24T21:08:21.567Z   |

#### * **comments.csv** *(данные о комментариях)*
| *id*  | *review_id*          | *text* | *author_id* | *pub_date* | 
|:---:|:-------------:|:-----:|:-----:|:-------:|
| 1   | 1 | Bullshit | 70 |2019-09-24T21:08:21.567Z  |
| 2   | 6 | Lumus | 60 |2019-09-24T21:08:21.567Z   |

----------------------------------------------------------------
## Загрузка данных
Если ваши файлы верны и минимальный набор полей готов к работе, то загрузка данных пройдёт без проблем. 
*Однако помните, что в передаваемых данных есть связанны поля соотвественно при ошибочных первичных ключах некоторые данные загрузить удастся а некоторые нет. Будьте внимательны.*

Если вы хотите хранить данные вместе с проектом можно разметстить их директории

```shell
project_dir/sample_data
```
В этом случае загрузить данные можно используя команду

```shell
docker-compose exec web python manage.py read_data_from_csv
```
Или загрузите данные из любой другой директории передав необязательным аргументом абсолютный путь к директории.

```shell
docker-compose exec web python manage.py read_data_from_csv С:/User/my_dir/
```
